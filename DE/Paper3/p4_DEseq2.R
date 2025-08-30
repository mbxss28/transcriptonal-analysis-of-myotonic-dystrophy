#Load packages
library(DESeq2)
library(tidyverse)
library(apeglm)
library(pheatmap)
library(RColorBrewer)
library(EnhancedVolcano)
library(clusterProfiler)
library(enrichplot)
library(tximport)
library(AnnotationHub) 
library(ensembldb)
library("org.Hs.eg.db", character.only = TRUE)
library(dplyr)
library(annotate)
library("pathview")

#Load necessary human gene annotation
ahub = AnnotationHub() 
ens_query <- query(ahub, c("EnsDb", "sapiens", "113"))  
ens_query
ensdb_113 <- ens_query[["AH119325"]]

#load transcript ids and  gene IDS
tx_data <- transcripts(ensdb_113, return.type = "DataFrame")
tx2gene <- tx_data[, c("tx_id", "gene_id")]
tx2gene

#Load quant files
dirp4 <- "C:/Users/SamSw/OneDrive/Documents/R Projects/p4_salmon"
p4 <- grep(".sf",list.files(dirp4),value=TRUE)
sample_namesp4 <- gsub("_quant$", "", basename(p4))
p4quant_files <- list.files(dirp4, pattern = "quant.sf$", recursive = TRUE, full.names = TRUE)
p4quant_files
names(p4quant_files) <- sample_namesp4
names(p4quant_files)


#import quant files into txi object, converting the transcript ids into genes ids.
txi4 <- tximport(p4quant_files, type = "salmon", tx2gene = tx2gene, 
                 ignoreTxVersion = TRUE,
                 txOut=FALSE,
                 txIn = TRUE)

#Load coldata
p4ColData <- read.csv("p4_coldata.csv")
p4ColData$Condition <- factor(p4ColData$Condition)
p4ColData


#run convert txi object into dds object
ddsTxi_p4 <- DESeqDataSetFromTximport(txi4, 
                                      p4ColData,
                                      design = ~Condition)

colData(ddsTxi_p4)$Condition
#Filter low gene counts from dds object
smallestGroupSize <- 7
keep <- rowSums(counts(ddsTxi_p4) >= 10) >= smallestGroupSize
ddsTxi_p4 <- ddsTxi_p4[keep,]

#Change order of comparison so the Unaffected samples are treated as the control
ddsTxi_p4$Condition
ddsTxi_p4$Condition <- factor(ddsTxi_p4$Condition, levels = c("Unaffected", "DM1"))


#Run deseq2 on dds object
ddsp4 <- DESeq(ddsTxi_p4)

#shows results for deseq2
res_p4 <- results(ddsp4)

#Perform LFC shrinkage on ddsp4 object
ddsp4$Condition
resultsNames(ddsp4)
resLFC_p4 <- lfcShrink(ddsp4, coef =  "Condition_DM1_vs_Unaffected",type = "apeglm")

#Filter deseq2 results for later use
resOrdered_p4 <- res_p4[order(res_p4$padj),]
resOrdered_p4
resexpressionp4 <- res_p4[order(res_p4$log2FoldChange,decreasing = TRUE),]
resexpressionp4

#create MAplot
plotMA(resLFC_p4, alpha = 0.05, main = "Choroid plexus DM1")

#Filter results based on if they are significantly up or down regulated
res_p4$diffexpressed[res_p4$log2FoldChange == 0 ] <- "Not significant"
res_p4$diffexpressed[res_p4$log2FoldChange > 0 & res_p4$padj < 0.05] <- "UP"
res_p4$diffexpressed[res_p4$log2FoldChange < 0 & res_p4$padj < 0.05] <- "DOWN"

#Convert ENSEMBL ids into symbol ids
res_df4 <- as.data.frame(res_p4)
res_df4$symbol <- mapIds(org.Hs.eg.db, keys = rownames(res_df4),
                         keytype = "ENSEMBL", column = "SYMBOL")
#plot distribution of significant up and downregulated genes
EnhancedVolcano(res_p4,
                lab = res_df4$symbol,
                title = 'Choroid plexus DM1',
                pCutoff = 0.05,
                subtitle = NULL,
                x = 'log2FoldChange',
                y = 'padj')

#plot dispersion of normalized gene counts
plotDispEsts(ddsp4, legend = TRUE, main = "Dispersion of counts in choroid plexus DM1")

#Create heatmap of results
rld_p4 <- rlog(ddsp4, blind=FALSE) 
sampleDists_p4 <- dist(t(assay(rld_p4)))
sampleDistMatrix_p4 <- as.matrix(sampleDists_p4)
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
heatmap(sampleDistMatrix_p4,
        clustering_distance_rows=sampleDists_p4,
        clustering_distance_cols=sampleDists_p4,
        col=colors, legend = TRUE, scale = "row",
        main = "Distance of DM1 and Unaffected samples")

#Create PCA of results
z <- plotPCA(rld_p4, intgroup = ("Condition"))
z + geom_text(aes_string(x = "PC1", y = "PC2", label = "name"),
              color = "black")

#create another heatmap
dfp4 <- as.data.frame(colData(ddsp4)[,c("Sample","Condition")]) 
select <- order(rowMeans(counts(ddsp4,normalized=TRUE)),
                decreasing=TRUE)[1:20]
pheatmap(assay(rld_p4)[select,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=dfp4)

#Create CSV files from previously ordered results 
Topvalues_p4 <- resOrdered_p4
newTOP_p4 <- as.data.frame(Topvalues_p4)
Bothp4 <- newTOP_p4 %>% dplyr::filter(padj < 0.05)
write.csv(Bothp4, file = "Ord_p4.csv")
write.csv(Topvalues_p4, file = "Fulllistp4.csv")
Upregulated_p4 <- newTOP_p4 %>% dplyr::filter(log2FoldChange > 0) %>%
  dplyr::filter(padj < 0.05)
write.csv(Upregulated_p4, file = "Upregulated_p4.csv")
downregulated_p4 <- newTOP_p4 %>% dplyr::filter(log2FoldChange < 0) %>%
  dplyr::filter(padj < 0.05)
write.csv(downregulated_p4, file = "downregulated_p4.csv")


#create csv of entire list of genes
p4_expression <- resexpressionp4
p4_expression
new_expressionp4 <- as.data.frame(p4_expression)
new_expressionp4
write.csv(new_expressionp4, "expression_listp4.csv")

#convert expressionlist into format usable for GSEA analysis
Expressionp4 <- read.csv("expression_listp4.csv", header=TRUE)
original_gene_listp4 <- Expressionp4$log2FoldChange
names(original_gene_listp4) <- Expressionp4$X
gene_listp4<-na.omit(original_gene_listp4)
gene_listp4 <- sort(gene_listp4, decreasing = TRUE)


#converted list of significantly differentially expressed genes into entrez ids usable for ORA and KEGG analysis
geneidp4 <- read.csv("gene_idp4new.csv")
gene_idp4 <- na.omit(geneidp4)
genesp4 <- as.vector(gene_idp4[,1])
idsp4 <- mapIds(org.Hs.eg.db, keys = genesp4,
                column = "ENTREZID", keytype = "SYMBOL")
ids2p4 <- as.data.frame(idsp4)

idsp4_final <- as.vector(ids2p4[,1])
idsp4_final <- na.omit(idsp4_final)
idsp4_final

#Run ORA
enrichp4 <- enrichGO(gene = idsp4_final,
                     ont = "ALL",
                     keyType = "ENTREZID",
                     pvalueCutoff = 0.05,
                     'org.Hs.eg.db',
                     pAdjustMethod = "fdr")

#Run GSEA
gsep4 <- gseGO(gene = gene_listp4,
               ont = "All",
               keyType = "ENSEMBL",
               pvalueCutoff = 0.05,
               OrgDb = 'org.Hs.eg.db')

#Run KEGG enrichment
keggp4 <- enrichKEGG(gene = idsp4_final ,
                     organism = 'hsa',
                     keyType = 'ncbi-geneid',
                     pvalueCutoff = 0.05)


kegg4_df <- as.data.frame(keggp4@result)
kegg4_order <- kegg4_df[order(kegg4_df$FoldEnrichment,decreasing = TRUE),]

gsexp4 <- setReadable(gsep4, "org.Hs.eg.db", keyType = "auto")
gse_p4 <- pairwise_termsim(gsexp4, showCategory = dim(gsexp4)[1])

#create dotplot
dotplot(gsep4, showCategory=10, font.size = 6.1,
        title = "Significant GSEA results of DM1 vs Unaffected samples",
        split=".sign") + facet_grid(.~.sign)

#create upsetplot
upsetplot(gsep4, n = 5)
#create gseaplot2
gseaplot2(gsep4, geneSetID = 1:3, title = )

#create cnetplot
cnetplot(gsexp4, layout = "kk"
         , showCategory = 3,
         foldChange=gene_listp4,
         , cex_label_gene = 0.5,
         circular = TRUE,
         color_category = "#E5C494",
         cex_label_category = 0.5)

#create barplot
barplot(enrichp4, showCategory=15, title = "Significant enrichment results from Choroid plexus DM1")

#create figures that show enriched pathways and what genes are significantly differentially expressed.
hsa04750 <- pathview(gene.data = idsp4_final,
                       pathway.id = "hsa04152",
                        species    = "hsa",
                        gene.idtype = "entrez")


hsa05022 <- pathview(gene.data = idsp4_final,
                        pathway.id = "hsa04062",
                        species    = "hsa",
                        gene.idtype = "entrez")


hsa04668 <- pathview(gene.data = idsp4_final,
                     pathway.id = "hsa04668",
                     species    = "hsa",
                     gene.idtype = "entrez")

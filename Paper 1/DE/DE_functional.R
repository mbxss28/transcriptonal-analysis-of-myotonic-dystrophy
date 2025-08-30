#Load packages
library(DESeq2)
library(tidyverse)
library(BiocManager)
library(apeglm)
library(pheatmap)
library(RColorBrewer)
library(EnhancedVolcano)
library(clusterProfiler)
library(enrichplot)
library(tximport)
library(AnnotationHub)
library(ensembldb)
library(DOSE)
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
dirp1 <- "C:/Users/SamSw/OneDrive/Documents/R Projects/p1_salmon"
p1 <- grep(".sf",list.files(dirp1),value=TRUE)
sample_namesp1 <- gsub("_quant$", "", basename(p1))
p1quant_files <- list.files(dirp1, pattern = "quant.sf$", recursive = TRUE, full.names = TRUE)
names(p1quant_files) <- sample_namesp1


#import quant files into txi object, converting the transcript ids into genes ids.
txi1 <- tximport(p1quant_files, type = "salmon", tx2gene = tx2gene, 
                 ignoreTxVersion = TRUE,
                 txOut=FALSE,
                 txIn = TRUE)


#Load coldata
p1ColData <- read.csv("p1_colddata.csv")
p1ColData$Condition <- factor(p1ColData$Condition)

#run convert txi object into dds object
ddsTxi_p1 <- DESeqDataSetFromTximport(txi1, 
                                      p1ColData,
                                      design = ~Condition)

#Filter low gene counts from dds object
smallestGroupSize <- 6
keep <- rowSums(counts(ddsTxi_p1) >= 10) >= smallestGroupSize
ddsTxi_p1 <- ddsTxi_p1[keep,]


#Change order of comparison so the Unaffected samples are treated as the control
ddsTxi_p1$Condition <- factor(ddsTxi_p1$Condition, levels = c("Unaffected", "DM"))

#Run deseq2 on dds object
ddsp1 <- DESeq(ddsTxi_p1)

#shows results for deseq2
res_p1 <- results(ddsp1)

#Perform LFC shrinkage on ddsp1 object
resultsNames(ddsp1)
resLFC_p1 <- lfcShrink(ddsp1, coef =  "Condition_DM_vs_Unaffected",type = "apeglm")

#Filter deseq2 results for later use
resOrdered_p1 <- res_p1[order(res_p1$padj),]
resOrdered_p1
resexpressionp1 <- res_p1[order(res_p1$log2FoldChange,decreasing = TRUE),]
resexpressionp1

#create MAplot
plotMA(resLFC_p1, alpha = 0.05, main = "Frontal cortex DM1")

#Filter results based on if they are significantly up or down regulated 
res_p1$diffexpressed[res_p1$log2FoldChange == 0 ] <- "Not significant"
res_p1$diffexpressed[res_p1$log2FoldChange > 0 & res_p1$padj < 0.05] <- "UP"
res_p1$diffexpressed[res_p1$log2FoldChange < 0 & res_p1$padj < 0.05] <- "DOWN"

#Convert ENSEMBL ids into symbol ids
res_df1 <- as.data.frame(res_p1)
res_df1$symbol <- mapIds(org.Hs.eg.db, keys = rownames(res_df1),
                keytype = "ENSEMBL", column = "SYMBOL")
#plot distribution of significant up and downregulated genes
EnhancedVolcano(res_df1,
                lab = res_df1$symbol,
                title = 'Frontal cortex DM1',
                pCutoff = 0.05,
                subtitle = NULL,
                x = 'log2FoldChange',
                y = 'padj')
#plot dispersion of normalized gene counts
plotDispEsts(ddsp1, legend = TRUE, main = "Dispersion of counts in frontal cortex DM1")

#Create heatmap of results
rld_p1 <- rlog(ddsp1, blind=FALSE) 
sampleDists_p1 <- dist(t(assay(rld_p1)))
sampleDistMatrix_p1 <- as.matrix(sampleDists_p1)
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
heatmap(sampleDistMatrix_p1,
        clustering_distance_rows=sampleDists_p1,
        clustering_distance_cols=sampleDists_p1,
        col=colors, legend = TRUE, scale = "row",
        main = "Distance of DM1 and Unaffected samples")

#Create PCA of results
z <- plotPCA(rld_p1, intgroup = ("Condition"))
z + geom_text(aes_string(x = "PC1", y = "PC2", label = "name"),
              color = "black")

#create another heatmap
dfp1 <- as.data.frame(colData(ddsp1)[,c("Sample","Condition")]) 
select <- order(rowMeans(counts(ddsp1,normalized=TRUE)),
                decreasing=TRUE)[1:20]
pheatmap(assay(rld_p1)[select,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=dfp1)

#Create CSV files from previously ordered results 
Topvalues_p1 <- resOrdered_p1
newTOP_p1 <- as.data.frame(Topvalues_p1)
Bothp1 <- newTOP_p1 %>% dplyr::filter(padj < 0.05)
write.csv(Bothp1, file = "Ord_p1.csv")
write.csv(Topvalues_p1, file = "Fulllistp1.csv")
Upregulated_p1 <- newTOP_p1 %>% dplyr::filter(log2FoldChange > 0) %>%
  dplyr::filter(padj < 0.05)
write.csv(Upregulated_p1, file = "Upregulated_p1.csv")
downregulated_p1 <- newTOP_p1 %>% dplyr::filter(log2FoldChange < 0) %>%
  dplyr::filter(padj < 0.05)
write.csv(downregulated_p1, file = "downregulated_p1.csv")

#create csv of entire list of genes 
p1_expression <- resexpressionp1
p1_expression
new_expressionp1 <- as.data.frame(p1_expression)
new_expressionp1
write.csv(new_expressionp1, "expression_listp1.csv")

#convert expressionlist into format usable for GSEA analysis
Expressionp1 <- read.csv("expression_listp1.csv", header=TRUE)
original_gene_listp1 <- Expressionp1$log2FoldChange
names(original_gene_listp1) <- Expressionp1$X
gene_listp1<-na.omit(original_gene_listp1)
gene_listp1 <- sort(gene_listp1, decreasing = TRUE)

#converted list of significantly differentially expressed genes into entrez ids usable for ORA and KEGG analysis
geneidp1 <- read.csv("gene_idp1.csv")
gene_idp1 <- na.omit(geneidp1)
genesp1 <- as.vector(gene_idp1[,1])
idsp1 <- mapIds(org.Hs.eg.db, keys = genesp1,
              column = "ENTREZID", keytype = "SYMBOL")
ids2p1 <- as.data.frame(idsp1)
idsp1_final <- as.vector(ids2p1[,1])
idsp1_final <- na.omit(idsp1_final)
idsp1_final

#Run ORA
enrichp1 <- enrichGO(gene = idsp1_final,
               ont = "ALL",
               keyType = "ENTREZID",
               pvalueCutoff = 0.05,
               'org.Hs.eg.db',
               pAdjustMethod = "fdr")
#Run GSEA
gsep1 <- gseGO(gene = gene_listp1,
               ont = "All",
               keyType = "ENSEMBL",
               pvalueCutoff = 0.05,
               OrgDb = 'org.Hs.eg.db')

#Run KEGG enrichment
keggp1 <- enrichKEGG(gene = idsp1_final ,
                  organism = 'hsa',
                  keyType = 'ncbi-geneid',
                  pvalueCutoff = 0.05)

gsex1 <- setReadable(gsep1, "org.Hs.eg.db", keyType = "auto")
gse_p1 <- pairwise_termsim(gsex1, showCategory = dim(gsex1)[1])
#create dotplot
dotplot(gsep1, showCategory=10, font.size = 6.1, 
        split=".sign",
        title = "Significant GSEA results from Frontal cortex DM1") + facet_grid(.~.sign)
#create upsetplot
upsetplot(gsep1, n = 5)
#create gseaplot2
gseaplot2(gsep1, geneSetID = 1:3)

#create cnetplot
cnetplot(gsex1, layout = "kk"
         , showCategory = 3,
         foldChange = gene_listp1,
         color_category = "#E5C494",
         , pie = "Count", cex_label_gene = 0.5,
         cex_label_category = 0.5)

#create barplot
barplot(enrichp1, showCategory = 15, title = "Significant enrichment results from Frontal cortex DM1")


#create figures that show enriched pathways and what genes are significantly differentially expressed.
hsa05171  <- pathview(gene.data  = idsp1_final,
                     pathway.id = "hsa05171",
                     species    = "hsa",
                     gene.idtype = "entrez")

hsa05171  <- pathview(gene.data  = idsp1_final,
                      pathway.id = "hsa05171",
                      species    = "hsa",
                      gene.idtype = "entrez")

hsa04668  <- pathview(gene.data  = idsp1_final,
                      pathway.id = "hsa04668",
                      species    = "hsa",
                      gene.idtype = "entrez")
hsa04621 <- pathview(gene.data  = idsp1_final,
                      pathway.id = "hsa04621",
                      species    = "hsa",
                      gene.idtype = "entrez")

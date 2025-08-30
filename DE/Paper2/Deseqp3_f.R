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
dirp3f <- "C:/Users/SamSw/OneDrive/Documents/R Projects/p3_f_salmon"
p3f <- grep(".sf",list.files(dirp3f),value=TRUE)
sample_namesp3f <- gsub("_quant$", "", basename(p3f))
sample_namesp3f
p3fquant_files <- list.files(dirp3f, pattern = ".sf$", recursive = TRUE, full.names = TRUE)
names(p3fquant_files) <- sample_namesp3f

#import quant files into txi object, converting the transcript ids into genes ids.
txi3f <- tximport(p3fquant_files, type = "salmon", tx2gene = tx2gene, 
                 ignoreTxVersion = TRUE,
                 txOut=FALSE,
                 txIn = TRUE)
#Load coldata
p3fColData <- read.csv("p3_coldata_f.csv")
p3fColData$Condition <- factor(p3fColData$Condition)

#run convert txi object into dds object
ddsTxi_p3f <- DESeqDataSetFromTximport(txi3f, 
                                      p3fColData,
                                      design = ~Condition)

#Filter low gene counts from dds object
smallestGroupSize <- 5
keep <- rowSums(counts(ddsTxi_p3f) >= 10) >= smallestGroupSize
ddsTxi_p3f <- ddsTxi_p3f[keep,]

#Change order of comparison so the Unaffected samples are treated as the control
ddsTxi_p3f$Condition <- factor(ddsTxi_p3f$Condition, levels = c("Healthy", "C9ALS"))

#Run deseq2 on dds object
ddsp3f <- DESeq(ddsTxi_p3f)

#shows results for deseq2
res_p3f <- results(ddsp3f)
resultsNames(ddsp3f)

#Filter deseq2 results for later use
resOrdered_p3f <- res_p3f[order(res_p3f$padj),]
resOrdered_p3f
resexpressionp3f <- res_p3f[order(res_p3f$log2FoldChange,decreasing = TRUE),]
resexpressionp3f
resultsNames(ddsp3f)

#Perform LFC shrinkage on ddsp3f object
resLFC_p3f <- lfcShrink(ddsp3f, coef ="Condition_C9ALS_vs_Healthy",type = "apeglm")

#create MAplot
plotMA(res_p3f, alpha = 0.05, main = "Frontal cortex ALS")

#Filter results based on if they are significantly up or down regulated 
res_p3f$diffexpressed[res_p3f$log2FoldChange == 0 ] <- "Not significant"
res_p3f$diffexpressed[res_p3f$log2FoldChange > 0 & res_p3f$padj < 0.05] <- "UP"
res_p3f$diffexpressed[res_p3f$log2FoldChange < 0 & res_p3f$padj < 0.05] <- "DOWN"

#Convert ENSEMBL ids into symbol ids
res_df3f <- as.data.frame(res_p3f)
res_df3f$symbol <- mapIds(org.Hs.eg.db, keys = rownames(res_df3f),
                         keytype = "ENSEMBL", column = "SYMBOL")

#plot distribution of significant up and downregulated genes
EnhancedVolcano(res_p3f,
                lab = res_df3f$symbol,
                title = 'Frontal cortex ALS',
                subtitle = NULL,
                pCutoff = 0.05,
                x = 'log2FoldChange',
                y = 'padj')
#plot dispersion of normalized gene counts
plotDispEsts(ddsp3f, legend = TRUE, main = "Dispersion of counts in frontal cortex ALS")

#Create heatmap of results
rld_p3f <- rlog(ddsp3f, blind=FALSE) 
sampleDists_p3f <- dist(t(assay(rld_p3f)))
sampleDistMatrix_p3f <- as.matrix(sampleDists_p3f)
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
heatmap(sampleDistMatrix_p3f,
        clustering_distance_rows=sampleDists_p3f,
        clustering_distance_cols=sampleDists_p3f,
        col=colors, legend = TRUE, scale = "row",
        main = "C9ALS and Healthy Samples")

#Create PCA of results
Y <- plotPCA(rld_p3f, intgroup = ("Condition"))
Y + geom_text(aes_string(x = "PC1", y = "PC2", label = "name"),
              color = "black")

#create another heatmap
dfp3f <- as.data.frame(colData(ddsp3f)[,c("Sample","Condition")]) 
select3f <- order(rowMeans(counts(ddsp3f,normalized=TRUE)),
                 decreasing=TRUE)[1:20]
pheatmap(assay(rld_p3f)[select3f,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=dfp3f)


#Create CSV files from previously ordered results 
Topvalues_p3f <- resOrdered_p3f
newTOP_p3f <- as.data.frame(Topvalues_p3f)
Bothp3f <- newTOP_p3f %>% dplyr::filter(padj < 0.05)
write.csv(Bothp3f, file = "Ord_p3f.csv")
p3f_expression <- resexpressionp3f
p3f_expression
new_expressionp3f <- as.data.frame(p3f_expression)
new_expressionp3f
write.csv(new_expressionp3f, "expression_listp3f.csv")

#create csv of entire list of genes
Expressionp3f <- read.csv("expression_listp3f.csv", header=TRUE)
original_gene_listp3f <- Expressionp3f$log2FoldChange
names(original_gene_listp3f) <- Expressionp3f$X
gene_listp3f<-na.omit(original_gene_listp3f)
gene_listp3f <- sort(gene_listp3f, decreasing = TRUE)

#converted list of significantly differentially expressed genes into entrez ids usable for ORA and KEGG analysis
gene_idp3f <- read.csv("Gene_idp3f.csv")
gene_idp3f <- na.omit(gene_idp3f)
genesf <- as.vector(gene_idp3f[,1])
idsf <- mapIds(org.Hs.eg.db, keys = genesf,
              column = "ENTREZID", keytype = "SYMBOL")
ids2f <- as.data.frame(idsf)
idsp3f <- as.vector(ids2f[,1])
idsp3f <- na.omit(idsp3f)

#Run ORA
enrichp3f <- enrichGO(gene = idsp3f,
                     ont = "ALL",
                     keyType = "ENTREZID",
                     pvalueCutoff = 0.05,
                     'org.Hs.eg.db',
                     pAdjustMethod = "fdr")
#Run GSEA
gsep3f <- gseGO(gene = gene_listp3f,
               ont = "All",
               keyType = "ENSEMBL",
               pvalueCutoff = 0.05,
               OrgDb = 'org.Hs.eg.db')

keggp3f <- enrichKEGG(gene = idsp3f,
                     organism = 'hsa',
                     keyType = 'ncbi-geneid',
                     pvalueCutoff = 0.05)
#Run KEGG enrichment
keggp3_dff <- as.data.frame(keggp3f@result)
kegg3f_order <- keggp3_dff[order(keggp3_dff$FoldEnrichment,decreasing = TRUE),]

gsex3f <- setReadable(gsep3f, "org.Hs.eg.db", keyType = "auto")
gse_p3f <- pairwise_termsim(gsex3f, showCategory = dim(gsex3f)[1])

#create dotplot
dotplot(gsep3f, showCategory=10, font.size = 5, 
        split=".sign",
        title = "Significant GSEA results from Frontal cortex ALS") + facet_grid(.~.sign)

#create upsetplot
upsetplot(gsep3f, n = 5)

#create gseaplot2
gseaplot2(gsep3f, geneSetID = 1:3)

#create cnetplot
cnetplot(gsex3f, layout = "kk"
         , showCategory = 3,
         foldChange = gene_listp3f,
         color_category = "#E5C494",
         , pie = "Count", cex_label_gene = 0.5,
         cex_label_category = 0.5)
#create barplot
barplot(enrichp3f, showCategory=15, title = "Significant enrichment results from Frontal cortex ALS") 

#create figures that show enriched pathways and what genes are significantly differentially expressed.
hsa04210 <- pathview(gene.data  = idsp3f,
                     pathway.id = "hsa04210",
                     species    = "hsa",
                     gene.idtype = "entrez")


hsa04064 <- pathview(gene.data  = idsp3f,
                      pathway.id = "hsa04064",
                      species    = "hsa",
                      gene.idtype = "entrez")

hsa04621 <- pathview(gene.data  = idsp3f,
                     pathway.id = "hsa04621",
                     species    = "hsa",
                     gene.idtype = "entrez")

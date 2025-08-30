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


splicep1 <- read.csv("allSEp1.csv")

splicep1 <- na.omit(splicep1)

spliceidp1 <- as.vector(splicep1[,1])

SEp1 <- mapIds(org.Hs.eg.db, keys = spliceidp1,
                column = "ENTREZID", keytype = "SYMBOL")

SE2p1 <- as.data.frame(SEp1)

SEp1_final <- as.vector(SE2p1[,1])
idsSEp1_final <- na.omit(SEp1_final)


enrichSEp1 <- enrichGO(gene = idsSEp1_final,
                     ont = "ALL",
                     keyType = "ENTREZID",
                     pvalueCutoff = 0.05,
                     'org.Hs.eg.db',
                     pAdjustMethod = "fdr")

barplot(enrichSEp1, showCategory = 15, font.size = 10,
        title = "Significant enrichment results from Frontal cortex DM1 Splice events]")



splicep3 <- read.csv("allSEp3.csv")

splicep3 <- na.omit(splicep3)

spliceidp3 <- as.vector(splicep3[,1])

SEp3 <- mapIds(org.Hs.eg.db, keys = spliceidp3,
               column = "ENTREZID", keytype = "SYMBOL")

SE2p3 <- as.data.frame(SEp3)

SEp3_final <- as.vector(SE2p3[,1])
idsSEp3_final <- na.omit(SEp3_final)

enrichSEp3 <- enrichGO(gene = idsSEp3_final,
                       ont = "ALL",
                       keyType = "ENTREZID",
                       pvalueCutoff = 0.05,
                       'org.Hs.eg.db',
                       pAdjustMethod = "fdr")

barplot(enrichSEp3, showCategory = 15, font.size = 10,
        title = "Significant enrichment results from Frontal cortex ALS Splice events")


splicep4 <- read.csv("allSEp4.csv")

splicep4 <- na.omit(splicep4)

spliceidp4 <- as.vector(splicep4[,1])

SEp4 <- mapIds(org.Hs.eg.db, keys = spliceidp4,
               column = "ENTREZID", keytype = "SYMBOL")

SE2p4 <- as.data.frame(SEp4)

SEp4_final <- as.vector(SE2p4[,1])
idsSEp4_final <- na.omit(SEp4_final)

enrichSEp4 <- enrichGO(gene = idsSEp4_final,
                       ont = "ALL",
                       keyType = "ENTREZID",
                       pvalueCutoff = 0.05,
                       'org.Hs.eg.db',
                       pAdjustMethod = "fdr")

barplot(enrichSEp4, showCategory = 15, font.size = 10,
        title = "Significant enrichment results from Choroid plexus DM1 Splice events")




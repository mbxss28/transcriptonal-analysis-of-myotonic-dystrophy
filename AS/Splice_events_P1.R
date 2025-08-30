library(tidyverse)


A3 <- read.table("A3SS.MATS.JCEC.txt", sep = "\t", header = TRUE)


A3_df <- as.data.frame(A3)


A3_df_filter <- A3_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(A3_df_filter, file = "p1_A3.csv")

A5 <- read.table("A5SS.MATS.JCEC.txt", sep = "\t", header = TRUE)

A5_df <- as.data.frame(A5)

A5_df_filter <- A5_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(A5_df_filter,"p1_A5.csv")

MXE  <- read.table("MXE.MATS.JCEC.txt", sep = "\t", header = TRUE)

MXE_df <- as.data.frame(MXE)

MXE_df_filter <- MXE_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(MXE_df_filter, "p1_MXE.csv")

RI <- read.table("RI.MATS.JCEC.txt", sep = "\t", header = TRUE)

RI_df <- as.data.frame(RI)

RI_df_filter <- RI_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(RI_df_filter, "p1_RI.csv")

SE <- read.table("SE.MATS.JCEC.txt",  sep = "\t", header = TRUE )

SE_df <- as.data.frame(SE)

SE_df_filter <- SE_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)
write.csv(SE_df_filter, "p1_SE.csv")


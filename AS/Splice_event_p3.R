library(tidyverse)

p3_A3 <- read.table("p3_A3SS.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3_A3_df <- as.data.frame(p3_A3)

p3_A3_df_filter <- p3_A3_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

p3_A5 <- read.table("p3_A5SS.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3_A5_df <- as.data.frame(p3_A5)

p3_A5_df_filter <- p3_A5_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

p3_MXE  <- read.table("p3_MXE.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3_MXE_df <- as.data.frame(p3_MXE)

p3_MXE_df_filter <- p3_MXE_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

p3_RI <- read.table("p3_RI.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3_RI_df <- as.data.frame(p3_RI)

p3_RI_df_filter <- p3_RI_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

p3_SE <- read.table("p3_SE.MATS.JCEC.txt",  sep = "\t", header = TRUE )

p3_SE_df <- as.data.frame(p3_SE)

p3_SE_df_filter <- p3_SE_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

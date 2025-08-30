library(tidyverse)


p3f_A3 <- read.table("p3f_A3SS.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3f_A3_df <- as.data.frame(p3f_A3)

p3f_A3_df_filter <- p3f_A3_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(p3f_A3_df_filter, "p3f_A3.csv")

p3f_A5 <- read.table("p3f_A5SS.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3f_A5_df <- as.data.frame(p3f_A5)

p3f_A5_df_filter <- p3f_A5_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(p3f_A5_df_filter, "p3f_A5.csv")

p3f_MXE  <- read.table("p3f_MXE.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3f_MXE_df <- as.data.frame(p3f_MXE)

p3f_MXE_df_filter <- p3f_MXE_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(p3f_MXE_df_filter, "p3f_MXE.csv")

p3f_RI <- read.table("p3f_RI.MATS.JCEC.txt", sep = "\t", header = TRUE)

p3f_RI_df <- as.data.frame(p3f_RI)

p3f_RI_df_filter <- p3f_RI_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(p3f_RI_df_filter, "p3f_RI.csv")

p3f_SE <- read.table("p3f_SE.MATS.JCEC.txt",  sep = "\t", header = TRUE )

p3f_SE_df <- as.data.frame(p3f_SE)

p3f_SE_df_filter <- p3f_SE_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(p3f_SE_df_filter, "p3f_SE.csv")

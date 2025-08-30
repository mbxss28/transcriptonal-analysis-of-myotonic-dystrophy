library(tidyverse)


A3p4 <- read.table("p4_A3SS.MATS.JCEC.txt", sep = "\t", header = TRUE)


A3p4_df <- as.data.frame(A3p4)


A3p4_df_filter <- A3p4_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(A3p4_df_filter, file = "p4_A3.csv")

A5p4 <- read.table("p4_A5SS.MATS.JCEC.txt", sep = "\t", header = TRUE)

A5p4_df <- as.data.frame(A5p4)

A5p4_df_filter <- A5p4_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(A5p4_df_filter,"p4_A5.csv")

MXEp4  <- read.table("p4_MXE.MATS.JCEC.txt", sep = "\t", header = TRUE)

MXEp4_df <- as.data.frame(MXEp4)

MXEp4_df_filter <- MXEp4_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(MXEp4_df_filter, "p4_MXE.csv")

RIp4 <- read.table("p4_RI.MATS.JCEC.txt", sep = "\t", header = TRUE)

RIp4_df <- as.data.frame(RIp4)

RIp4_df_filter <- RIp4_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)

write.csv(RIp4_df_filter, "p4_RI.csv")

SEp4 <- read.table("p4_SE.MATS.JCEC.txt",  sep = "\t", header = TRUE )

SEp4_df <- as.data.frame(SEp4)

SEp4_df_filter <- SEp4_df %>% filter(FDR < 0.05) %>%
  arrange(FDR)
write.csv(SEp4_df_filter, "p4_SE.csv")
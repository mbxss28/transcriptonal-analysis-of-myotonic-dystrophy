library(tidyverse)



splice_count <- read.csv("SEcountable.csv")

splice_count_df <- as.data.frame(splice_count)

countdataA3 <- gather(splice_count_df, key="measure", value="Count",
                    c("A3_SS"))

ggplot(countdataA3, aes(Condition, Count)) + 
  geom_bar(stat = "identity") + ggtitle("Number of A3_ss events across samples")
  
countdataA5 <- gather(splice_count_df, key="measure", value="Count",
                      c("A5_SS"))

ggplot(countdataA5, aes(Condition, Count)) + 
  geom_bar(stat = "identity") + ggtitle("Number of A5_ss events across samples")


countdataRI <- gather(splice_count_df, key="measure", value="Count",
                      c("RI"))

ggplot(countdataRI, aes(Condition, Count)) + 
  geom_bar(stat = "identity") + ggtitle("Number of RI events across samples")


countdataMXE <- gather(splice_count_df, key="measure", value="Count",
                      c("MXE"))

ggplot(countdataMXE, aes(Condition, Count)) + 
  geom_bar(stat = "identity") + ggtitle("Number of MXE events across samples")


countdataSE <- gather(splice_count_df, key="measure", value="Count",
                       c("SE"))

ggplot(countdataSE, aes(Condition, Count)) + 
  geom_bar(stat = "identity") + ggtitle("Number of SE events across samples")
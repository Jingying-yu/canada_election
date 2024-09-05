####Workspace Setup####
library(tidyverse)
library(janitor)

####Script####
barplot: 
  # Assuming df is your data frame and A is the categorical column
  counts <- table(df$A)  # Get the frequency of each category
  
  # Create a bar plot
  barplot(counts, col="skyblue", main="Frequency of Categories in Column A", xlab="Categories", ylab="Frequency")
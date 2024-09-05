####Workspace Setup####
library(tidyverse)
library(janitor)

####Script####

raw_elections_data <-
  read_csv(
    file = 
      "",
    show_col_types = FALSE,
    skip = 1
  )

write_csv(
  x = raw_elections_data,
  file = "raw_canadian_voting.csv"
)
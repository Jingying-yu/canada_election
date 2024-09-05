####Workspace Setup####
library(tidyverse)
library(janitor)

####Script####

raw_elections_data <-
  read_csv(
    file = 'input/table_tableau11.csv',
    show_col_types = FALSE
  )

write_csv(
  x = raw_elections_data,
  file = "raw_data/raw_elections_data.csv"
)

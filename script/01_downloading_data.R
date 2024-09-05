####Workspace Setup####
library(tidyverse)
library(janitor)

####Script####

raw_elections_data <-
  read_csv(
    file = 
      'input/table_tableau11.csv',
    show_col_types = FALSE
  )

# We have read the data from the AEC website. We may like to save
# it in case something happens or they move it.
write_csv(
  x = raw_elections_data,
  file = "input/raw_data/canada_voting.csv"
)

head(raw_elections_data)

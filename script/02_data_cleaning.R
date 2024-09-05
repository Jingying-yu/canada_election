####Workspace Setup####
library(tidyverse)
library(janitor)
library(dplyr)

####Script####
raw_elections_data <-
  read_csv(
    file = "input/raw_data/canada_voting.csv",
    show_col_types = FALSE
  )


# Make the names easier to type
cleaned_elections_data <-
  clean_names(raw_elections_data)


# obtain column names for easier reference
names(cleaned_elections_data)

# only select the two desired columns
cleaned_elections_data <- cleaned_elections_data |>
  select(electoral_district_name_nom_de_circonscription, elected_candidate_candidat_elu) |>
  rename(electoral_district_name = electoral_district_name_nom_de_circonscription,
         elected_candidate =  elected_candidate_candidat_elu)



cleaned_elections_data <-
  cleaned_elections_data |>
  separate(
    col = elected_candidate,
    into = c("Other", "party"),
    sep = "/"
  ) |>
  select(-Other) |>
  mutate(party = 
           case_when(party == 'Libéral' ~ 'Liberal',
                     party == 'Conservateur' ~ 'Conservative',
                     party == 'NPD-Nouveau Parti démocratique' ~ 'New Democratic',
                     party == 'Parti Vert' ~ 'Green')
  )


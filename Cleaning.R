####Workspace Setup####
library(tidyverse)
library(janitor)
library(dplyr)

####Script####
raw_elections_data <-
  read_csv(
    file = 'raw_data/raw_elections_data.csv',
    show_col_types = FALSE,
    skip = 1
  )

clean_elections_data <- 
  clean_names(raw_elections_data)

clean_elections_data <- clean_elections_data |> 
  mutate(electoral_district_name_nom_de_circonscription = electoral_district_name, 
         elected_candidate_candidat_elu = lected_candidate)

clean_elections_data <-
  clean_elections_data |>
  separate(
    col = elected_candidate,
    into = c("Other", "party"),
    sep = "/"
  )|>
  select(-Other)

clean_elections_data <- clean_elections_data |> mutate(
  case_when(party == "Libéral" ~ "Liberal",
                  party =="Conservateur" ~ "Conservative",
                   party == "Bloc Québécois" ~ "Bloc Québécois",
                  party == "Nouveau Parti démocratique" ~ "New Democratic",
                   party == "Parti vert" ~ "Green"))

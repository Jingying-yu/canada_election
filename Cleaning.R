####Workspace Setup####
library(tidyverse)
library(janitor)

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
  rename(electoral_district_name = electoral_district_name_nom_de_circonscription, elected_candidate = elected_candidate_candidat_elu)

clean_elections_data <-
  clean_elections_data |>
  separate(
    col = elected_candidate,
    into = c("Other", "party"),
    sep = "/"
  )|>
  select(-Other)

df$Party <- recode(clean_elections_data$Party,
                   "Libéral" = "Liberal",
                   "Conservateur" = "Conservative",
                   "Bloc Québécois" = "Bloc Québécois",
                   "Nouveau Parti démocratique" = "New Democratic",
                   "Parti vert" = "Green")

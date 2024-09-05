####Workspace Setup####
#install.packages("tidyverse")
#install.packages("janitor")

library(tidyverse)
library(janitor)

####Script####


set.seed(1009)
simulated_data <-
  tibble(
    # Use 1 through to 151 to represent each division
    "Division" = 1:338,
    # Randomly pick an option, with replacement, 151 times
    "Party" = sample(
      x = c("Liberal", "Conservative", "Bloc Québécois", "New Democratic", "Green", "other"),
      size = 338,
      replace = TRUE
    )
  )

simulated_data

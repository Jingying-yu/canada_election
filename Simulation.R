####Workspace Setup####
#install.packages("tidyverse")
#install.packages("janitor")

library(tidyverse)
library(janitor)

####Script####

set.seed(21)

simulated_data <-
  tibble(
    # Use 1 through to 151 to represent each division
    "Division" = 1:151,
    # Randomly pick an option, with replacement, 151 times
    "Party" = sample(
      x = c("Liberal", "Labor", "National", "Green", "Other"),
      size = 151,
      replace = TRUE
    )
  )

simulated_data
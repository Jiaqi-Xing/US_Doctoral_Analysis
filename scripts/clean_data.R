#### Preamble ####
# Purpose: Cleans the raw data
# Author: Ariel Xing
# Date: 21 November 2024
# Contact: ariel.xing@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(readr)

#### Clean data ####
raw<-read_csv("../data/usa_00001.csv")


doctoral_degree_code <- 116 

state_edu_data <- raw %>%
  filter(EDUCD == doctoral_degree_code) %>%   # Filter for rows where EDUC equals the doctoral degree code
  group_by(STATEICP) %>%                     # Group by STATEICP (state code)
  summarise(respondents = n()) %>%           # Count the number of respondents per state
  arrange(desc(respondents))                 # Sort in descending order

#### Save data ####
write_csv(state_edu_data, file = "data/analysis_data/cleaned_data.csv")

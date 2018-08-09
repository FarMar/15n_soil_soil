## This is the first Data School exercise
## We are looking at tidying and graphically presenting data

## My chosen dataset is the soil solution nitrogen data from the GRDC Biological Inputs 15N pot experiment

# first, load tidyverse

library(tidyverse)
raw_data <- read_csv("results/raw/15n_soil_sol.csv")
raw_data

## First we need to create a don variable by subtracting "no3" and "nh4" from "tdn"



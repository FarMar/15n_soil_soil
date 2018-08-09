## This is the first Data School exercise
## We are looking at tidying and graphically presenting data

## My chosen dataset is the soil solution nitrogen data from the GRDC Biological Inputs 15N pot experiment

# first, load tidyverse

library(tidyverse)
raw_data <- read_csv("results/raw/15n_soil_sol.csv")
raw_data

## First we need to create a don variable by subtracting "no3" and "nh4" from "tdn"

# make a 'din' variable

with_din <- mutate(raw_data, nh4 + no3)
with_din

# rename using base R "names function. Note the "[11]" is the column number. 
# But... use this with care as if columns are mis-ordered it can result in wrong data

names(with_din)[11] <- "din"
with_din

#now let's subtract din from tdn to make don

with_don <- mutate(with_din, tdn - din)
names(with_don)[12] <- "don"
with_don

##do we have any negatives?
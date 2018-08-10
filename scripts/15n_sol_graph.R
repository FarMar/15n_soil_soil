## This script takes the wrangled data from 15n_sol_proc.R and ../results/raw/15n_soil_sol.csv
## It examines the final processed data ../results/processed/ratios.csv

library(tidyverse)
all <- read_csv("results/processed/ratios.csv")
all

## Now let's look how the variables change over time

## this page was helpful for mu and super/subscripts: 
## https://stackoverflow.com/questions/34892262/subscripts-and-superscripts-or-with-ggplot2-axis-labels-ionic-chemical

## also here: https://rstudio-pubs-static.s3.amazonaws.com/136237_170402e5f0b54561bf7605bdea98267a.html



ggplot(data = all, aes(days, no3, colour = trt)) +
  scale_colour_manual(values=c("#CCFF00",
                               "#99FF00",
                               "#66FF00",
                               "#00CC00",
                               "#336600",
                               "#FFCC33",
                               "#FF9933",
                               "#CC9933",
                               "#996600",
                               "#993300",
                               "#333333",
                               "#0099FF"
  )) +
  #geom_point(size = 6, alpha = 0.6) +
  geom_jitter(size = 6, alpha = 0.6, width = 1) +
  stat_smooth(method = "loess", se = FALSE, size = 1) + 
  stat_smooth(method = "loess", 
  #              colour = "red", 
                geom = "ribbon", 
                alpha = 0.1,
                size = 0.01,
  #              fill = , 
                fullrange = FALSE) + 
 # xlim(0, 48) + ylim(0, 300) +
  coord_cartesian(xlim = c(0, 48), ylim = c(0, 450)) +
  labs(
    x = "Time (days)",
    y = ~NO[3]^{textstyle("-")}-N ~mg~L^{-1},
    #  title = "Nitrogen",
    colour = "Treatment"
  ) +
  theme(
    panel.grid = element_blank(),
    # axis.text.y = element_text(angle = 90), rotates labels
    axis.text=element_text(size=14),
    axis.title = element_text(color="black", face="bold", size=18),
    panel.background = element_rect(fill = "white",
                                    colour = "black")
  )



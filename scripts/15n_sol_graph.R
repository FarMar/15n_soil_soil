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
  geom_point(size = 6, alpha = 0.6) +
  geom_smooth(aes(alpha = 0.2), size = 0.5, se=TRUE) +
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
    panel.background = element_rect(fill = "black",
                                    colour = "black")
  )


#x <- 1:10
#dd <- data.frame(x = x, y = 0.8 + 0.5 * x + rnorm(10, s = 1.5))
#xrange<- function(x, margin){ 
#  r<-range(x, na.rm=TRUE) 
#  d<-diff(r) 
#  m<-c(d*-margin, d*margin) 
#  return (r+m) 
#} 
#ggplot(dd, aes(x = x, y = y)) + 
#  geom_point() + 
#  stat_smooth(method = "loess", se = FALSE) + 
#  stat_smooth(method = "loess", 
#              colour = "red", 
#              geom = "ribbon", 
#              fill = , 
#              fullrange = TRUE) + 
#  scale_x_continuous(limits = xrange(x, 0.2)) + 
#                       coord_cartesian(xlim = xrange(x,0.05)) 

ggplot(data = all, aes(days, no3, colour = trt)) +
  geom_point(size = 6, alpha = 0.6) +
  stat_smooth(method = "loess", se = FALSE, size = 3) + 
  stat_smooth(method = "loess", 
  #              colour = "red", 
                geom = "ribbon", 
                alpha = 0.1,
                size = 0.01,
  #              fill = , 
                fullrange = TRUE) + 
  #  scale_x_continuous(limits = xrange(x, 0.2)) + 
  #                      coord_cartesian(xlim = xrange(x,0.05))  +
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

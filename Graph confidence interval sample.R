library(dplyr)
library(tidyverse)
library(ggplot2)
data("nhtemp")
data.frame(year = as.numeric(time(nhtemp)), temperature = as.numeric(nhtemp)) %>%
  ggplot(aes(year,temperature)) +
  geom_point() +
  geom_smooth() +
  ggtitle("Average Yearly Temperature in New Havens")

# observe the shaded region over the central line that represents the confidence interval
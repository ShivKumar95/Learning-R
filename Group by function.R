# Group by function 
# Creates groups of data using one or more variables

library(tidyverse)
library(dslabs)
library(dplyr)
data(murders)
data(heights)

# Computute seperate average and standard deviation for male and female
heights %>% group_by(sex) %>%
  summarise(average = mean(height), standard_deviation = sd(height))

# compute median murder rate by region
murders <- murders %>% mutate(murder_rate = total/population*100000)
murders %>% group_by(region) %>% summarise(median_rate = median(murder_rate))

# using a summarize function on a grouped data returns the summary of that group
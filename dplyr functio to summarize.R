library(tidyverse)
library(dslabs)
library(dplyr)
data(heights)

# compute average and standard deviations for male using summarize
s <- heights %>% filter(sex == "Male") %>% summarise(average = mean(height), standard_deviation = sd(height))
# to access the data from summary table
s$average
s$standard_deviation
class(s)
# note that the resultant value is a data.frame
# also note that the summarize function can only retun 1 value

# another way of doing it is quantile to get min, median and max
quantile(heights$height, c(0,0.5,1))

# note that the same can't be used under summarize
p <- heights %>% filter(sex == "Male") %>% summarise(range = quantile(height, c(0,0.5,1)))
# this returns us the error function that the legth must be one 
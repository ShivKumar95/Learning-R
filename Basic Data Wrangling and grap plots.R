# Basiic Data Wrangling

# Manipulating data franes 

library(dplyr)
library(dslabs)
data("murders")

# To add a column in the existing table we use a function called Mutate
murders <- mutate(murders, rate = total/population*100000)
# here murders is object and rate is the new variable

# subsetting with a filter
filter(murders,rate <= 0.71)

# selecting columns with select 
new_table <- select(murders,state,region,rate)
new_table
# note that murders is the object table while state, region and rate are variables)

# Series of operation using pipe operator 
# using pipe operator

murders %>% select(state, region, rate) %>% filter(rate <= 0.71)
# by using pipe function the program runs the first operation and then runs it through second operation

# basic plots

x <- murders$population/10^6
y <- murders$total
plot(x,y)

# a histogram murder rates
hist(murders$rate)

# boxplots of murder rates by region
boxplot(rate~region, data = murders)

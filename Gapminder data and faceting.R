# Gapminder datasets and using various data visualization techniques to better understand data
 library(dslabs)
 library(tidyverse)
 library(dplyr)
 library(ggplot2)
 library(ggthemes)
data("gapminder") 
head(gapminder)

# compare infant mortality in Si Lanka and Turkey
gapminder %>% 
  filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>%
  select(country, infant_mortality)
# we observe that the infant mortality rate of Sri Lanka is Much lower than Turkey

# Basic scatter plot for fertility vs life expectancy

ds_theme_set() # set plot theme
filter(gapminder, year == 1962) %>% 
  ggplot(aes(fertility, life_expectancy)) + geom_point()

# we can further refine the plot by addig color to the continent
filter(gapminder, year == 1962) %>% 
  ggplot(aes(fertility, life_expectancy, color = continent)) + geom_point()

## Faceting
# Faceting is a function which allows the scales to be fixed across all plots
# this enables easier comparison

# FAcet by continent and year

filter(gapminder, year %in% c(1962,2012)) %>% 
  ggplot(aes(fertility,life_expectancy, col = continent)) +
  geom_point() + facet_grid(continent~year)
 # note that this seperates the entire graph into continent section comparing the 2 years

# to facet only by year
filter(gapminder, year %in% c(1962,2012)) %>% 
  ggplot(aes(fertility,life_expectancy, col = continent)) +
  geom_point() + facet_grid(.~year) 
# we use a dot function to tell the function that there is only a single variable year

# We can also add multiple years to show the progress over the years
# in this case we need to use a function called facet_wrap() this keeps the scale same
filter(gapminder, year %in% c(1962,1970,1980,1990,2000,2012)) %>% 
  ggplot(aes(fertility,life_expectancy, col = continent)) +
  geom_point() + facet_wrap(.~year) 

# This indeed proves that there isn't a major difference in the so called western and eastern world 
# and they are merging 
# over the years life expectancy has gone up and fertility has decreased



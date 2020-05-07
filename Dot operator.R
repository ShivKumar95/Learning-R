# The Dot placeholder
library(tidyverse)
library(dslabs)
library(dplyr)
data(murders)
# the dot operator allows the dplyr function to pull a single vector or numeric data
# this is especially useful in cases where we need a numeric for a function and not a data.frame
murders <- murders %>% mutate(murder_rate = total / population*100000) 
summarise(murders, mean(murder_rate))

# calculating US Murder rate, Geerating a data frame
us_murder_rate <- murders %>% summarise(rate = sum(total)/sum(population)*100000)
us_murder_rate

# calculating the numeric us_murder_rate
us_murder_rate %>% .$rate
# note that the dot operator returned a numeric valur from a data frame

# the following thing could be achieved without creating a data frame using a single line pipe code
us_murder_rate <- murders %>% summarise(rate = sum(total)/sum(population)*100000) %>% .$rate

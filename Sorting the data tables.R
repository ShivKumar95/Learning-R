# sorting the data tables

library(tidyverse)
library(dslabs)
library(dplyr)
data("murders")

murders <- murders %>% mutate(murder_rate = total/population*100000)
# arrange by population  column
murders %>% arrange(population) %>% head()

# arrange by murder rate
murders %>% arrange(murder_rate) %>% head()

# arrange in descending order
murders %>% arrange(desc(murder_rate)) %>% head()

# we can also break the columns and do nested arrangements
murders %>% arrange(region, murder_rate) %>% head()
# this aranges the murder rates within the region 

# to show top 10 states with highest murder rate
murders %>% arrange(desc(murder_rate)) %>% top_n(10)

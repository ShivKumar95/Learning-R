# contineous probabilities 

library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

# we can define a functio for cdf
 F <- function(n) mean(x <= n)
 # to find out probability of people taller than 70 inch
 
 1-F(70)
 
 # to find out probability of people taller than 60 but shorter than 70
 
 taller_60 <- 1-F(60)
 shorter_70 <- F(70)
ans<- taller_60 - shorter_70 
ans

# this can be used by normal distribution
mean(x)
sd(x)

 # probability of student picked is less than 70 inch
1-pnorm(70.5,mean(x),sd(x))


# plotting the probability density for the normal distribution
# we need to define a range of possible value 

library(tidyverse)
library(dplyr)

x <- seq(-4,4, length = 100)
data.frame(x, f = dnorm(x)) %>% ggplot(aes(x,f)) + geom_line()




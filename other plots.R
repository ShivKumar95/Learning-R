# Other plot examples

# histogram
 library(tidyverse)
 library(dslabs)
 library(dplyr)
 data("heights")
 
 # define a object p
 p<- heights %>% 
   filter(sex == "Male") %>%
   ggplot(aes(x = height))
 
 # basic histogram
 p + geom_histogram()
 # Note that it returns the error for default value of binwidth
 # adding a binwidth arguments
 p + geom_histogram(binwidth = 1)
 # adding aesthetics 
 p + geom_histogram(binwidth = 1, fill = "blue", col = "black") +
     xlab("Male heights in iches") + ggtitle("Histogram Male Heights")
 
 # Smooth density curve
 p + geom_density(fill = "blue")

 # Quantile-Quantile plots
 # basic qq plot
  p<- heights %>% filter(sex == "Male") %>%
    ggplot(aes(sample = height))
  
  p + geom_qq()
# note that the qq plot is generated based upon the theoretical mean
# generating 11 plot with actual mean and sd
  
  # we need to define an object for the argument dprams
  prams <- heights %>% 
            filter(sex == "Male") %>% summarise(mean = mean(height), sd = sd(height))
p + geom_qq(dparams = prams) + geom_abline() 

# qq plot of scaled data against normal distribution
heights %>% 
  ggplot(aes(sample = scale(height))) +
  geom_qq() + geom_abline()
  
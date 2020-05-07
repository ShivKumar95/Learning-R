# sample modeling casio roulette table reds and blacks

# # monte carlo

# sample model 1: defines a lot and then sample
library(dplyr)
library(tidyverse)
color <- rep(c("Black","Red","Green"),c(18,18,2))
 n <- 1000 # no. of reps
 X <- sample(ifelse(color == "Red", -1,1),n, replace = TRUE)
 # if the sample drawn is red we lose of not we win
 
 # sample model 2: defines a lot inside the sample function by noting probabilities
 

 
S <- sum(x) # winings is sum of draws
S

# using mote carlo simulation
n <- 1000 # no. of roulette plays
B <- 10000 # no of monte carlo trials

S <- replicate(B, {x <- sample(c(-1,1),n,replace = TRUE, prob = c(9/19,10/19))
      sum(x)})

mean(S<0) # probability of casino loosing money


# We can plot a histogram for normal density curve to observe values

s <- seq(min(S), max(S), length = 100)    # sequence of 100 values across range of S
normal_density <- data.frame(s = s, f = dnorm(s, mean(S), sd(S))) # generate normal density for S
data.frame (S = S) %>%    # make data frame of S for histogram
  ggplot(aes(S, ..density..)) +
  geom_histogram(color = "black", binwidth = 10) +
  ylab("Probability") +
  geom_line(data = normal_density, mapping = aes(s, f), color = "blue")
 
# we observe that the probability distribution os sum of these draws is normal

# we can use central limit theorem

# These equations apply to the case where there are only two outcomes,  a  and  b  with proportions  p  and  1???p  respectively. The general principles 
# above also apply to random variables with more than two outcomes.
 ## here in this case we have -1 or 1 as the possible outcomes with 1 having more chance

# can be defined as ap + b(1-p)
# expected value or mu (mean)
a <- -1
b <- 1
p <- 9/19
p
1-p

mu <- a*p + b*(1-p)
mu

# standard deviation by central limit theory

se <- abs(1--1) * sqrt(p*(1-p))
se

# still this doesn't answer the expected range
# if 1000 people play the roulette the expected income

n <- 1000
mu*n
# about $52

# to find range
sqrt(n)*se
 # about 32
# therefore the casino can earn from $30 - $84


# roulette game betting on green
# prize $17 when you win $-1 when you lose

green <- 2
red <- 18
black <- 18

p_green <- green / (green + red + black)
p_not_green <- 1 - p_green
# No. of games played
n <- 1000
# Sample outcomes
X <- sample(c(17,-1),n,replace = TRUE, prob = c(p_green,p_not_green))

# sum of all 1000 outcomes
S <- sum(X)

a <- 17
b <- -1
# expected mean 
mu <- a*(p_green) + b*(p_not_green)
# expected money in 1000 rolls
n*mu

# standard error
se <- abs(17--1)*sqrt(p_green*p_not_green)
# range of errors
sqrt(n)*se

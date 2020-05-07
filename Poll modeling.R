# interference and modelling
# # to estimate parameters
# in a poll we need to esttimate the poll proportions

#let us create a poll
library(tidyverse)
library(dplyr)
library(dslabs)
take_poll(25)

# this gives us a random variable
#  X = X1 + X2 + X3 + ...................Xn
# Converting it into Z
# Z = x - E(x)/SE(x)
# we need to find proportion in such a way that the SE is ~ 1%
# this can be said to find the interval between pnorm(0.01/se) , pnorm(-0.01/se)

#Pr(Z <= 0.01/ sqrt(p(1-p)/N)) - Pr(Z <= -0.01/sqrt(p(1-p)/N))
# we don't know the value of p but we can put in an estimated value using the poll
# the equation becomes
#Pr(Z <= 0.01/ sqrt(X(1-X)/N)) - Pr(Z <= -0.01/sqrt(X(1-X)/N))

X_hat <- 0.48
se <- sqrt(X_hat*(1-X_hat)/25)
pnorm(0.01/se) - pnorm(-0.01/se)

# margin of error <- 2 times standard error of the estimate mean
# or there is 95% chance that estimated mean will be within 2 standard error of actual parameter of p


# we can run a monte carlo simulation to compare with theoritical value
B<-10000
n<-1000
x_hat <- replicate(B,{x <- sample(c(0,1),n,replace = TRUE, prob = c(p,1-p))
         mean(x)})

# but the issue is since we dont know the vale of the p we can't run the simulation

# another way of doing this would be to assume a p and run the simulation
p <- 0.45
x_hat <- replicate(B,{x <- sample(c(0,1),n,replace = TRUE, prob = c(p,1-p))
mean(x)})
# now we can run and see
se(x_hat)
mean(x_hat)

# we need to find spread
# we know its 2p - 1
# its basically 2SE(X)
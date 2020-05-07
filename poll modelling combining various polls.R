# simulation polls
# obama elections
library(tidyverse)
library(dplyr)
d <- 0.039
Ns <- c(1298,533,1342,897,774,254,812,324,1291,1056,2172,516)
p <- (d+1)/2

# to calculate confidence intervals of the spread
confidence_interval <- sapply(Ns, function(N){
                      X <- sample(c(0,1),N,replace = TRUE, prob = c(1-p,p))
                      X_hat <- mean(X)
                      SE_hat <- sqrt(X_hat*(1-X_hat)/N)
                      2*c(X_hat,X_hat - 2*SE_hat, X_hat + 2*SE_hat)
})
# generating a data frame to store confidence_interval
polls <- data.frame(poll = 1:ncol(confidence_interval), 
                    t(confidence_interval), sample_size = Ns)
names(polls) <- c("poll", "estimate", "low", "high","sample_size")
polls

# calculating the spread of the combined polls
d_hat <- polls %>%
  summarise(avg = sum(estimate*sample_size)/sum(sample_size)) %>%
  .$avg
 
p_hat <- (1+d_hat)/2
moe <- 2*qnorm(0.975)*sqrt(p_hat*(1-p_hat)/sum(polls$sample_size))
round(d_hat*100,1)
round(moe*100,1)

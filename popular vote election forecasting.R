# Poll biased  
# popular vote
# d ~ N(mu,tou) this discribes the best guess when no polling data is available 
# where d = spread
#       N = NO. of polls
#       mu = expeccted mean (0 in this case denoting that we don't know who will win)
#       tou = standard error using historic data is about 3.5%

# Xbar|d ~ N(d,sigma) when poolster bias is accounted for
# Xbar is sample average
# we compute prsterior_mean (we do an estimate of mean)
# we find out the probability of prosterior_mean be > 0 or d >0 
library(tidyverse)
library(dplyr)
library(dslabs)
polls <- polls_us_election_2016 %>% 
        filter(state == "U.S."& enddate >= "2016-10-31" & (grade %in% c("A+","A","A-","B")| is.na(grade))) %>%
        mutate(spread = rawpoll_clinton/100 - rawpoll_trump/100)
one_poll_per_pollster <- polls %>% group_by(pollster) %>% filter(enddate == max(enddate))%>%
  ungroup()

results <- one_poll_per_pollster%>% 
          summarise(avg = mean(spread), se = sd(spread)/sqrt(length(spread))) %>%
          mutate(start = avg -1.96*se, end = avg + 1.96*se)

# computing prosterior mean, standard error, credible interval and probability

mu <- 0
tau <- 0.035
sigma <- results$se
Y <- results$avg
B <- sigma^2/(sigma^2 + tau^2) # bias
posterior_mean <- B*mu + (1-B)*Y
posterior_se <- sqrt(1/(1/sigma^2 + 1/tau^2))

# 95% credibility index
posterior_mean + c(-1.96,1.96)*posterior_se

# probability of d >0
1-pnorm(0,posterior_mean,posterior_se)

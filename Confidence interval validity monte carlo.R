# monte carlo simulation to check validity of confidence interval

B <- 10000
n <- 100
 inside <- replicate(B,{
   X<- sample(c(0,1),n, replace = TRUE, prob = c(1-p,p))
    X_hat <- mean(X)
    SE_hat <- sqrt(X_hat*(1-X_hat)/n)
    between(p, X_hat - 2*SE_hat,X_hat + 2*SE_hat) # this returns true if the p lies within
 })
   mean(inside)
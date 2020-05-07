# confidence intervals 
# defined as a region in which you can say with 95% confidence that p lies in

# Mathematically
# [X - 2SE(X), X + 2SE(X)]
# but the variable is random

# we can check this using monte carlo simulation

p <- 0.45
n <- 100
X <- sample(c(0,1),n, replace = TRUE, prob = c(1-p,p))
X_hat <- mean(X)
SE_hat <- sqrt(X_hat*(1-X_hat)/n)
c(X_hat - 2*SE_hat, X_hat + 2*SE_hat)

# everytime we run thi code the values chage
# to determine the probability of the interval

# we need to compute
# Pr(X - 2SE(X)<= p <= X + 2SE(X))
# multiplying and dividing by X/SE(X)
# 2 <= X - p/SE(X) < = 2
# 2 <= Z <= 2
# Z is normal random variable  
# this is intern called ~95% cofidece interval

# -z <= Z <= z

# using qnorm to solve for Z
z <- qnorm(0.995)
pnorm(qnorm(0.995))
pnorm(qnorm(1-0.995))
pnorm(z)-pnorm(-z)

# note to get +2 and -2 confidence interval we need to use qnorm(0.975) to compute exact 95% 
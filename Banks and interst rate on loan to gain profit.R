# Bank lending loan by default loses the return of the money on 2% cases
# need to find the optimum interest rate so that we dont run loss

# code interest rate sampling model
n <- 1000
loss_per_foreclosure <- -200000
p <- 0.02
defaults <- sample(c(0,1),n, prob = c(1-p,p), replace = TRUE)
sum(defaults*loss_per_foreclosure)


# since the results are binomial we ca use CLT
# expected value and standard error
mu <- n*(p*loss_per_foreclosure) + (1-p)*0
se <- sqrt(n)*abs(loss_per_foreclosure)*sqrt(p*(1-p))

# calculate interest rate for expected value
# we need to add amount x to compensate for the losses so expected value is 0 or we break even
# lp + x(1-p) = 0,
# where l is expected loss per foreclosure, foreclosure probability p, profit x, no forclosue (1-p)
x = -loss_per_foreclosure*p/(1-p)
x
# on a $180,000 loan
x/180000*100
# these interst rate gives that on average we break even but there is still 50% chance that we lose money 
# that is if the expected value is not 0

# therefore we need to find an optimum solution in which we can get 1/100 chamce of loosing money

# P(S<0) = 0.01
# expected value of S is given by {lp + x(1-p)}n, where l is loss per foreclosure and n is no. of loans
# se is |x -l|sqrt(n*p*(1-p))
# Converting it into Z score 
# we know that Z = (x - E)/se
# Pr {S-E[S]/se[S] < -E[S]/se[S]} = 0.01
# therefore this equation can be written as
# Pr{Z < E[S]/se[S]} = 0.01
# Pr{Z < z} = 0.01
# z = {lp + x(1-p)}n / |x -l|sqrt(n*p*(1-p))
# Z is noraml random variable
# z = qnorm(0.01)
# solving for x will give us the amount
l <- loss_per_foreclosure
z <- qnorm(0.01)
x <- -l*(n*p - z*sqrt(n*p*(1-p)))/ (n*(1-p) + z*sqrt(n*p*(1-p)))
x/180000 # interest rate
loss_per_foreclosure*p + x*(1-p) # expected value of profit per loan
n *(loss_per_foreclosure*p + x*(1-p)) # expected vale of profit per n loan

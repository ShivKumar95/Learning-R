# for loops
# 1+ 2 + 3+ ....+n = n(n+1)/2
# create a function which can calculate the sum of n terms
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}

m <- 25
s_n <- vector(length = m)
# create an empty vector to store the results from the for loop
for (n in 1:m) {
  s_n[n] <- compute_s_n(n)
}
# for loop has a variable and its conditions followed by the expression 
n <- 1:m
plot (n,s_n)
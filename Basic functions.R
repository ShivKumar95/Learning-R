# Basic functions

# sometimes we might not have a function inside of R so we might need to create it

# general form:
# my_function <- function(x){operation that operates on x which is defined by user of function valure final line is returned}

# example
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

x <- 1:100
avg(x)
mean(x)
identical
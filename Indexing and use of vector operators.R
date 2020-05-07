# Indexing

# Further using logical operators we can refine the data

# In this case we require a city which has equalent murder rates to ITLy from where we are relocating

library(dslabs)
data("murders")

murder_rates <- murders$total/murders$population*100000
# logical vector to find murder rate <= 0.71

index <- murder_rates <= 0.71
# to find out wich state has the required condition
murders$state[index]
# we can also use sum() to get the no. of states
sum(index)

# now if we want to move into a mountain region and having murder rates atmost 1
# using & operator

west <- murders$region == "West"
safe <- murder_rates <= 1

# defining an index that satisfies both the conditions
index <- west & safe
# to find the name of states
murders$state[index]

# Index Functions
# the function which() gives us entries of a logical functions that are ture

# example

x <- c(FALSE,TRUE,FALSE,TRUE,TRUE,FALSE)
which(x) # returns the position of True

# this can be useful to find out specific information as murder rates specific
index <- which(murders$state == "California")
index
murder_rates[index]

# match operator matches the entries and returns the index
# to obtain indices and murder rates of new york, florida, texas
index <- match(c("New York","Florida","Texas"),murders$state)
index
murders$state[index]
murder_rates[index]

# %in% operator is used to check if elements of vector a are present in vectoe b
# example
x <- c("a","b","c","d","e")
y <- c("a","d","f")
y %in% x

# this can be used to check if one entry is present or not
# example
c("Boston","Dakota","Washington")%in% murders$state

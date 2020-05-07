# Sorting
# Sort is a, function that sorts a vector into increasing order

library(dslabs)
data("murders")

#our objective was to check and select the highest and lowest crime rates

sort(murders$total)

# BUt this only gives us the total in increasing order and does not give us the state associated with it

# to better deduce it we need another function called Order

# Example of Sort, Order, Rank

x <- c(31,4,15,92,65)
sort(x)
# Puts elements in order of increasing

# Order
index <- order(x) # returns index that will put x in the order
x[index] # rearranging by this index puts elements in order
order(x)

# Rank
rank(x) # rank returns the smallest to largest rank





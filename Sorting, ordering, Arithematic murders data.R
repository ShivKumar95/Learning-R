# To get a valuable information about the gun murder cases 

library(dslabs)
data("murders")

# if we sort the total 
sort(murders$total)

# this only gives you the increasing order of the cases but doesnt give any information about the state corresponding

# in such case a order is more suitable function

index <- order(murders$total) 
murders$abb[index] # orders abbrevations by total numbers instead of numbers
 
# this give us the result that "VT" has the least gun murder cases while "CA" has the most

# this can also be done using another function called max and min
max(murders$total) #returns the maximum no. of murders
which.max(murders$total) # this function returns the position in the table
# to get the state name we need to assign the vale to a variable
# use this variable to pin point the specific state
i_max <- which.max(murders$total)
# this returns the name of the state which has the most gun murder cases
murders$state[i_max]


# california is the state with highest murders 
# but it could be possible that the state has a large population and hence the large number

# So to get a better estimate we should consider murders per capita

# Vector Arithmetic

# to find out which state has max population
murders$state[which.max(murders$population)]

# indeed california has the largest population

# to obtai murder rate

murder_rate <- murders$total/murders$population*100000

# ordering the states by murder rates in decreasing order
murders$state[order(murder_rate,decreasing = TRUE)]

# as the results show that california is in 14th place and District of Columbia has the highest murder rates

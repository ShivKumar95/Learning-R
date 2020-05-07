# Loading dslabs liberary and murders data set
library(dslabs)
data("murders")

# determine that the murders dataset is of the "data.frame" class
class(murders)
# Finding out more about the structure of thwe object
str(murders)
# showing frist 6 lines of entry
head(murders)
# showing last 6 entries
tail(murders)

#accessing a particular column
# using the accessor operator to get population column
murders$population
# $ is the accessor operator that lets you choose the specific column

# displaying variable names inside dataset
names(murders)
# gives you the names of the variable i the dataset otherwise the headings

# these variables are a vector

# determining the no. of entries in a vector
# assigning the column in a seperate variable or argument
pop <- murders$population

#length function returns the no. of entries 
length(pop)

#vectors can be of multiple type class, numeric and character

class(pop)
# class of pop is numeric as the pop contains the population data
class(murders$state)
# class (murder$state) contains characters as it contains the name of the state

# logical vectors are either true or false
z <- 3 == 2
z
class(z)
# == is a relatioal operator

# factors are nother type of class
class(murders$region)
# factor is used to define category or to store category type data
levels(murders$region)
# gives 4 categories 
# this is done to be more effective and less confusing and save data space

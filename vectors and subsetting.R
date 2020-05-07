# vectors are basic objects in which you can store data in R
# to create a vector we use a function called "concatenate" or "c"
# we use it as

codes <- c(380,124,818)
country <- c("itly","canada","egypt")
# "" used defines the object as characters and not as variables 

# for example

country <- c(itly,canada,egypt)
# this would return an error as variable not defined

# we can also assign the variable 
codes <- c(itly = 380,canada = 124,egypt = 818)
# or
codes <- c("itly" = 380,"canada" = 124,"egypt" = 818)
# both these would return the same value


# we can also name the elements of a numeric vector using the name function
codes <- c(380,124,818)
country <- c("itly","canada","egypt")
names(codes) <- country

## Subsetting

# using a square bracket we can access a particular o specific element
codes[2]
codes[c(1,3)]
# or using a sequence shorthand :
codes[1:2]

# a way to create a vector is to use sequence
seq(1,10)
# where it gives you consecutive integers from start value to end with default 1 increment

# if we change the default values
# get even numbers till 100
seq(2,100,2)

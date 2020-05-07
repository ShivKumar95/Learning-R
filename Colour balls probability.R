cyan <- 3
magenta <- 5
yellow <- 7

# Assign a variable `p` as the probability of choosing a cyan ball from the box
p <- cyan / (cyan + magenta + yellow)
p
# Print the variable `p` to the console

# probability of not p
1-p

cyan <- 3
magenta <- 5
yellow <- 7

# The variable `p_1` is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable `p_2` as the probability of not choosing a cyan ball on the second draw without replacement.
p_2 <- 1 - (cyan - 1) / (cyan + magenta + yellow - 1)

# Calculate the probability that the first draw is cyan and the second draw is not cyan.
p_1 * p_2


cyan <- 3
magenta <- 5
yellow <- 7

# The variable 'p_1' is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable 'p_2' as the probability of not choosing a cyan ball on the second draw with replacement.
p_2 <- (magenta + yellow)/(cyan + magenta + yellow)
# Calculate the probability that the first draw is cyan and the second draw is not cyan using `p_1` and `p_2`.
p_1*p_2

cyan <- 3
magenta <- 5
yellow <- 7

# Assign the variable 'p_yellow' as the probability that a yellow ball is drawn from the box.
p_yellow <- yellow / (cyan + magenta + yellow)
# Using the variable 'p_yellow', calculate the probability of drawing a yellow ball on the sixth draw. Print this value to the console.
mean(p_yellow)

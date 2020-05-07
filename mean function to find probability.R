set.seed(1, sample.kind="Rounding")
set.seed(1)

# using mean function for probability
beads <- rep(c("red", "blue"), times = c(2,3))    # create an urn with 2 red, 3 blue
beads    # view beads object

# to find the probability of drawing a blue bead at random
mean(beads == "blue")

# the function check with individual entries and returs true or false
# then find the proportions

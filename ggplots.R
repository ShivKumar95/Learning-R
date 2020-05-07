# ggplot

# components to remember
# 1.Data : The data set being summarized
# 2. Geometry: The type of plot(scatterplot, boxplot, histogram, qqplot, sooth density, etc.)
# 3. Asthetics maping: Variables mapped to visual clues, such as x-axis and y-axis values ad color
# There are additional components such as scale, labels, title, legend, theme/style

library(dslabs)
library(ggplot2)
library(tidyverse)
library(dplyr)
data(murders)

murders %>% ggplot()
# note that we get a blank grey background as we haven't added objects or layers

p<- ggplot(data = murders)
# adding points to predefined ggplot objects
# First thing to add is geometry 
# we are going to do a scatter plot geom_point is used
#aes is a function inside that specifies the aesthetics 
p + geom_point(aes(population/10^6, total))
# Note that now we have a scatter plot with x and y axis
# adding text layer
p + geom_point(aes(population/10^6, total))+ geom_text(aes(population/10^6,total, label = abb))
# we observe that the abbreviation no longer shows the points
# we can manually change thw size of the points
p + geom_point(aes(population/10^6, total), size = 3)+ geom_text(aes(population/10^6,total, label = abb))
# now we face another problem that the abbs are not visible
# we can use a function called nudge to move it a bit
p + geom_point(aes(population/10^6, total), size = 3)+ geom_text(aes(population/10^6,total, label = abb), nudge_x = 1)

# we can simplify the code using a global aesthetic
p <- ggplot(data = murders,aes(population/10^6,total, label = abb))
p + geom_point( size = 3) + geom_text(nudge_x = 1.5)

# the local aesthetic code can override the global


# change in the scale 
# log transformation x axis and y axis

p + geom_point( size = 3) + geom_text(nudge_x = 0.075) + scale_x_log10() + scale_y_log10()
# notice here since we changed it into log we have to readjust the nudge

# Add labels and titles
p + geom_point( size = 3) + geom_text(nudge_x = 0.075) + scale_x_log10() + scale_y_log10() + xlab("Population in million (log scale)") + ylab("Total number of murders (log scale)") + ggtitle("US Gun Murders in 2010") 
# to add the labels in x axis and y axis we use a function xlab() and ylab()
# to add the title we use the function ggtitle()

# since the code is very big lets redefine the variable in p except geom_point
p <- p + geom_text(nudge_x = 0.075) + scale_x_log10() + scale_y_log10() + xlab("Population in million (log scale)") + ylab("Total number of murders (log scale)") + ggtitle("US Gun Murders in 2010") 
# adding colour to the points making all points blue
p + geom_point(size = 3, color = "blue")
# but that isn't the goal our goal is to have color correspond the region of state
p + geom_point(aes(col = region), size = 3)
# we have the state now differentiated by the region
# note that the ggplot automatically adds a legend

# adding a line with average murder rate
# define a variable r for average murder rate
r <- murders %>% summarise(rate = sum(total)/sum(population)*10^6) %>% pull(rate)
# adding the average line
p + geom_point(aes(col = region), size = 3) + geom_abline(intercept = log10(r))
# slope is default of 1
# we now observe that the line is passing through the points 
# changing line color and characteristics
p <- p + geom_point(aes(col = region), size = 3) + geom_abline(intercept = log10(r), lty = 2, color = "darkgrey")
# Changing the Legend
p

# we can further modify the plot using some add on functions to make it look even more impressive
library(ggthemes)
library(ggrepel)


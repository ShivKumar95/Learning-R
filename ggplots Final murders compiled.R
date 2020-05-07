# now is the time to combine all and make a graph

library(dslabs)
library(tidyverse)
library(dplyr)
library(ggthemes)
library(ggrepel)
library(ggplot2)
data("murders")

# defining rate of murder
r <- murders %>% summarise(rate = sum(total)/sum(population)*10^6) %>% pull(rate)

# combining all the elements to make a plot

murders %>% ggplot(aes(population/10^6, total, label = abb)) + 
            geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
            geom_point(aes(col = region), size = 3) +
            geom_text_repel() +
            scale_x_log10() + scale_y_log10() +
            xlab("Population in millions (log scale)") + 
            ylab("Total number of Murders (log scale)") +
            ggtitle("US  Gun Murders in 2010") + 
            scale_color_discrete(name = "Region") +
            theme_economist()

# we finally get the desired plot
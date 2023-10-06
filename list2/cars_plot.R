library(ggplot2)
library(dplyr)


data(mpg)


plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point() +
  facet_wrap(~ class)

print(plot)
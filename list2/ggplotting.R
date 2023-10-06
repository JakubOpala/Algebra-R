library(gapminder)
library(ggplot2)
library(magrittr)
library(dplyr)
library(plotly)

p <- gapminder %>%
  filter(year==1977) %>%
  ggplot( aes(gdpPercap, lifeExp, size = pop, color=continent)) +
  geom_point(alpha=0.6) +
  theme_minimal()



plot <- ggplotly(p)
print(plot)
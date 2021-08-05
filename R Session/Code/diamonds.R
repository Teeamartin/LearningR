library(tidyverse)
ggplot(data = mpg, aes(x = hwy, y = cyl)) + 
  geom_point()

ggplot(data = mpg, aes(class, drv)) + 
  geom_point()

ggplot(data = diamonds, aes(x = carat, y = price, color = clarity, size = x)) +
  geom_point(alpha = .15) +
  facet_wrap(~ color)


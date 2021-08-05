library(tidyverse)
library(palmerpenguins)
library(ggthemes)

#ggthemes will change font and the look of data
# only allows first 6 rows or what the console will allow
head(penguins)

# will list as many as it can 
glimpse(penguins)

# the advantage of using view is you can see the entire data
View(penguins)

# How many different spieces are in a data set 
unique(penguins$species)

# calcuate the avg weight of each species
penguins %>% 
  group_by(species) %>% 
  summarise(avg_mass=mean(body_mass_g,na.rm=TRUE))

# magrittr %>% 

# base r |> "native pipe"
penguins |> 
  group_by(species) |>
  summarise(avg_mass = mean(body_mass_g, na.rm = TRUE))

# visualize the bodymass and adding labels 
ggplot(penguins, aes(body_mass_g, species)) + 
  geom_boxplot() +
  labs(
    title = "Bodymass of Penguins", 
    y = "Species", x = "Bodymass"
  ) + 
  theme_economist()

ggsave(here::here("Images/mass.png"))

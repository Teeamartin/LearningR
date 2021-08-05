#Load packages
library(dplyr)

#Load Data
scoobydoo <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv')

# Chapter 4
# Naming variables: snake_case, CamelCase, dot.case (don't do this because you dont want you confuse your varialbe with a function)

##Functions
###Format: Functions name( set_of_arguments_inputs)
seq(1,10) # seq(to = 1, from =10)
seq(from =10) # has a default value if I do not specify a to value

seq(1,10, by = 2) #prints odd numbers
seq(2, 10, by = 2) #prints even numbers

seq(1,1000, length.out = 15) # Length.out is now many # to print

(b <- seq(1, 1000, length.out = 15)) # highlight the sentence and shift + parent

#Chapter 5 Data Transformations/Wrangling data
##package: dplyr
##functions: filter, arrange, group_by, mutate, summarize, select

#number of observations %>% ctrl +shift+ M
num_obs_2 <- scoobydoo %>% 
  group_by(format) %>% 
  #summarize(count = n())
  mutate(count = n()) 
# mutate tacks on to the end of a dataset
# summarize condenses dataset
# arrange default is least to greatest unless I put a - sign in front of count
# filter will keep all the variable and reduce the number of rows
# select keeps the rows, reduces the variables
num_obs <- scoobydoo %>% 
  group_by(format) %>% 
  summarize(count = n()) %>% 
  arrange(-count) 
  
df <- scoobydoo %>% #dataframe
  filter(format == "TV Series") %>%  # removes any rws that are not a TV series
  select(c(series_name, network, season, imdb)) %>% 
  group_by(series_name, season) %>% 
  mutate(imdb = as.numeric(imdb)) %>% # I am overwritting imdb col from char col to a num col 
  summarize(avg_imdb = mean(imdb, na.rm=TRUE))
  
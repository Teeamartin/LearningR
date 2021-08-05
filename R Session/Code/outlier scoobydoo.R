#Load packages
library(dplyr)
library(ggplot2)

#Load Data
scoobydoo <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv')

#IQR & Outliers
tv_data <- scoobydoo %>% 
  filter(format == "TV Series") %>%  
  mutate(imdb = as.numeric(imdb))

ggplot(tv_data, aes(imdb))+
  geom_histogram()


tv_data_summary <- tv_data %>% 
  summarize(iqr= IQR(imdb, na.rm = TRUE),
            q1 = fivenum(imdb)[2],
            q3 = fivenum(imdb)[4])

#outliers are determined by fences
# lower Fence:Q1 -1.5*IQR
# upper Fence:Q3+1.5*IQR

lower_fence <- tv_data_summary$q1-1.5*tv_data_summary$iqr
upper_fence <- tv_data_summary$q3+1.5*tv_data_summary$iqr

# which episodes are outliers?

tv_data <- tv_data %>% 
  mutate(outlier =case_when(
    imdb < 6.4 ~ "low", 
    imdb > 8.8 ~ "high",
    TRUE ~ "not an outlier"
  ))

tv_test <- tv_data %>% 
  select(c(imdb, outlier))

ggplot(tv_data, aes(imdb, fill = outlier)) +
  geom_histogram() 

ggplot(tv_data, aes(imdb)) +
  geom_boxplot()

#covariation pirce and clarity has a high covariation- as I can see a pattern between the two. 
ggplot(diamonds, aes(price, carat, color = clarity))+
  geom_point()

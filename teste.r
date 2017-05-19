library('ggplot2')
library('tidyr')
library('dplyr')
library('readr')

series = read_csv(file = "dados/series_from_imdb.csv") %>% 
  select(series_name, series_ep, season, season_ep, Episode, UserRating, UserVotes) %>% 
  filter(series_name %in% c("Black Mirror", "13 Reasons Why", "Sense8", "House of Cards", "Stranger Things")) %>%
  group_by(series_name)
  
  

series %>% summarise(desvio = sd(UserRating))


ggplot(series, aes(x = `season_ep`, 
                   y = `UserRating`))+
                
  geom_jitter(width = 50, height = 0, alpha = .6)
  coord_flip()

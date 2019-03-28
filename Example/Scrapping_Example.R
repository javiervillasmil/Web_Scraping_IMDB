#import libraries

if(require("pacman")=="FALSE"){
  install.packages('pacman')
  library('pacman')
  pacman::p_load(here,rvest) # <- add libraries here
} else {
  library('pacman')
  pacman::p_load(here,rvest) # <- add libraries here
}

p_loaded()
##########

#save the url for the desired website ti be scrapped
url <- 'https://www.imdb.com/search/title?title_type=feature&release_date=2018-01-01,2018-12-31&count=100&start=1&ref_=adv_nxt'

############

#reading the html code for the website and converts it into a XML object.
webpage <- read_html(url)

## RANKING section
rank_data <- webpage %>%
  html_nodes('.text-primary') %>% # Use CSS Selectors to scraps the nodes
  html_text() %>% # Converts the selected nodes into text
  as.numeric()

## TITLE section
title_data <- webpage %>%
  html_nodes('.lister-item-header a') %>%
  html_text()

## DESCRIPTION section
description_data <- webpage %>%
  html_nodes('.ratings-bar+ .text-muted') %>%
  html_text()

description_data <- trimws(gsub('\n','',description_data)) #removes '\n' and trims leading and trailing whitespaces.

## RUNTIME section
runtime_data <- webpage %>%
  html_nodes('.runtime') %>%
  html_text()

runtime_data <- as.numeric(trimws(gsub('min','',runtime_data))) #removes 'min' pattern, trims leading and trailing whitespaces and converts to numeric.

## GENRE section
genre_data <- webpage %>%
  html_nodes('.genre') %>%
  html_text()

# removes '\n' and trims leading and trailing whitespaces.
# removes all genres after the first comma
# converts to factor
genre_data <- as.factor(gsub(",.*","",trimws(gsub('\n','',genre_data))))

## IMDB Rating section
imdb_rating_data <- webpage %>%
  html_nodes('.ratings-imdb-rating strong') %>%
  html_text()

imdb_rating_data <- as.numeric(imdb_rating_data) #converts to numeric.

## Votes section
votes_data <- webpage %>%
  html_nodes('.sort-num_votes-visible span:nth-child(2)') %>%
  html_text()

votes_data <- as.numeric(gsub(',','',votes_data)) # removes comma and converts to numeric.

## Director section
director_data <- webpage %>%
  html_nodes('.text-muted+ p a:nth-child(1)') %>%
  html_text()

director_data <- as.factor(director_data)

## Actors section
main_actors_data <- webpage %>%
  html_nodes('.lister-item-content .ghost+ a') %>%
  html_text()

main_actors_data <- as.factor(main_actors_data)

## MetaScore section
metascore_data <- webpage %>%
  html_nodes('.lister-item-content') %>%
  html_node('.ratings-metascore') %>%
  html_text()

metascore_data <- as.numeric(trimws(gsub("\n | Metascore", "", metascore_data))) #removes '\n' and 'Metascore', trims whitespaces and convert to numeric.


# which(is.na(metascore_data) == TRUE) <- checks which movies has no metascore.

## Gross Revenue section
gross_data <- webpage %>%
  html_nodes('.lister-item-content') %>%
  html_node('.ghost~ .text-muted+ span') %>%
  html_text()

gross_data <- as.numeric(gsub("[$M,]","",gross_data))
  
#which(is.na(gross_data) == TRUE) <- checks which movies has no gross revenue listed.

## Small Posters
small_poster <- webpage %>%
  html_nodes('.loadlate') %>%
  html_attr('loadlate')

movies_df<-data.frame(Rank = rank_data, 
                      Title = title_data,Description = description_data, 
                      Runtime = runtime_data,
                      Genre = genre_data, 
                      IMDB_Rating = imdb_rating_data,
                      Metascore = metascore_data,
                      Votes = votes_data,
                      Gross_Earning_in_Mil = gross_data,
                      Director = director_data, 
                      Actor = main_actors_data,
                      Poster_URL = small_poster)

movies_df$Poster_URL <- as.character(movies_df$Poster_URL)



for (i in movies_df$Poster_UR) {
  download.file(i,paste(which(movies_df$Poster_UR==i),'jpg', sep = '.'), mode = 'wb')
}

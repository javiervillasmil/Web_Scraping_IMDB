#import libraries

if(require("pacman")=="FALSE"){
  install.packages('pacman')
  library('pacman')
  pacman::p_load(here,rvest,crayon,openxlsx,stringr,lubridate,doParallel) # <- add libraries here
} else {
  library('pacman')
  pacman::p_load(here,rvest,crayon,openxlsx,stringr,lubridate,doParallel) # <- add libraries here
}

p_loaded()

#initilalize counter
j = 1

#initilalize empty vector
url_full = c()
rank <- c()
title <- c()
description <- c()
runtime <- c()
genre <- c()
imdb_rating <- c()
metascores <- c()
votes <- c()
gross_earning <- c()
director <- c()
actor <- c()
poster_url <- c()
##########


#load scrapping functions
for (h in list.files(here::here('scripts'))){
  source(here::here('scripts',h))
}

#enables pararell processing
do_parallel_function()

#crawls the IMDB website for 2018 movies
while (j <= 5000) {
  for (i in j){
    url <- paste('https://www.imdb.com/search/title?title_type=feature&release_date=2018-01-01,2018-12-31&count=100&start=',i,'&ref_=adv_nxt',sep='')
    webpage <- read_html(url)
    rank <- c(rank,ranking_scrap(webpage))
    title <- c(title,title_scrap(webpage))
    description <- c(description,description_scrap(webpage))
    runtime <- c(runtime,runtime_scrap(webpage))
    genre <- c(genre,genre_scrap(webpage))
    imdb_rating <- c(imdb_rating,imdb_rating_scrap(webpage))
    metascores <- c(metascores,metascore_scrap(webpage))
    votes <- c(votes,votes_scrap(webpage))
    gross_earning <- c(gross_earning,gross_scrap(webpage))
    director <- c(director,director_scrap(webpage))
    actor <- c(actor,main_actor_scrap(webpage))
    poster_url <- c(poster_url,poster_scrap(webpage))
    
    url_full <- c(url_full,url)
    
      j = j + 100
    }
}

#restart counter
j = 1

#creates the ovies dataframe and excel file.
movies_df <- generate_movies_df()

#download the mini-poster
save_images(movies_df)

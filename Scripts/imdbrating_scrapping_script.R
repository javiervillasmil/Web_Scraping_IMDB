## Scraps the IMDB Rating section
imdb_rating_scrap <- function(webpage) {
  imdb_rating_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.ratings-imdb-rating strong') %>%
    html_text()
  

  imdb_rating_data <- as.numeric(imdb_rating_data) #converts to numeric.
  
  cat(red((paste(length(which(is.na(imdb_rating_data) == TRUE)),'  MISSING VALUES IN IMDB RATING'))),sep="\n")
  
  return(imdb_rating_data)
}
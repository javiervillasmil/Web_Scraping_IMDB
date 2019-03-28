## Scraps the GENRE section
genre_scrap <- function(webpage) {
  genre_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.genre') %>%
    html_text()
  
  # removes '\n' and trims leading and trailing whitespaces.
  # removes all genres after the first comma
  # converts to factor
  genre_data <- gsub(",.*","",trimws(gsub('\n','',genre_data)))
  
  cat(red((paste(length(which(is.na(genre_data) == TRUE)),'  MISSING VALUES IN GENRE'))),sep="\n")
  
  return(genre_data)
  }
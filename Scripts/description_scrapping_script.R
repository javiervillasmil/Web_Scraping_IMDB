## Scraps the DESCRIPTION section
description_scrap <- function(webpage) {
  description_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.ratings-bar+ .text-muted') %>%
    html_text()
  
  description_data <- trimws(gsub('\n','',description_data)) #removes '\n' and trims leading and trailing whitespaces.
  
  cat(red((paste(length(which(is.na(description_data) == TRUE)),'  MISSING VALUES IN DESCRIPTION'))),sep="\n")
  
  return(description_data)
  }
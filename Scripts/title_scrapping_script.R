## Scraps the TITLE section
title_scrap <- function(webpage) {
  title_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.lister-item-header a') %>%
    html_text()
  
  cat(red((paste(length(which(is.na(title_data) == TRUE)),'  MISSING VALUES IN TITLE'))),sep="\n")
  
  return(title_data)
  }
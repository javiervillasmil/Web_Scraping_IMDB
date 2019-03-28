## Scraps the RANKING section
ranking_scrap <- function(webpage) {
  rank_data <- webpage %>%
  html_nodes('.lister-item-content') %>%
  html_node('.text-primary') %>% # Use CSS Selectors to scraps the nodes
  html_text() # Converts the selected nodes into text
  
  #removes point and comma
  rank_data <- as.numeric(gsub("[,.,]","",rank_data))
  
  cat(red((paste(length(which(is.na(rank_data) == TRUE)),'  MISSING VALUES IN RANK'))),sep="\n")
  
  return(rank_data)
  }

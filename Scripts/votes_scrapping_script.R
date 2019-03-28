## Scraps the VOTES section
votes_scrap <- function(webpage) {
  votes_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.sort-num_votes-visible span:nth-child(2)') %>%
    html_text()
  
  votes_data <- as.numeric(gsub(',','',votes_data)) # removes comma and converts to numeric.
  
  cat(red((paste(length(which(is.na(votes_data) == TRUE)),'  MISSING VALUES IN VOTES'))),sep="\n")
  
  return(votes_data)
}
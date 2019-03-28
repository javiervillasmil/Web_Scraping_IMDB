## Scraps the DIRECTOR section
director_scrap <- function(webpage) {
  director_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.text-muted+ p a:nth-child(1)') %>%
    html_text()
  
  
  cat(red((paste(length(which(is.na(director_data) == TRUE)),'  MISSING VALUES IN DIRECTORS'))),sep="\n")
  
  return(director_data)
}
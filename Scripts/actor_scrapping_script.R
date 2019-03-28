## Scraps the ACTOR section
main_actor_scrap <- function(webpage) {
  main_actors_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.ghost+ a') %>%
    html_text()
  
  
  cat(red((paste(length(which(is.na(main_actors_data) == TRUE)),'  MISSING VALUES IN ACTORS'))),sep="\n")
  
  return(main_actors_data)
}
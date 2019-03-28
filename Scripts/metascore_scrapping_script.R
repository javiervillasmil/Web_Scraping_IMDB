## Scraps the METASCORE section
metascore_scrap <- function(webpage) {
  metascore_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.ratings-metascore') %>%
    html_text()
  
  #removes '\n' and 'Metascore', trims whitespaces and convert to numeric.
  metascore_data <- as.numeric(trimws(gsub("\n | Metascore", "", metascore_data))) 
  
  cat(red((paste(length(which(is.na(metascore_data) == TRUE)),'  MISSING VALUES IN METASCORE'))),sep="\n")
  
  return(metascore_data)
  }
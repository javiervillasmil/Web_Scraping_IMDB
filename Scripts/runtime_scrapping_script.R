## Scraps the RUNTIME section
runtime_scrap <- function(webpage) {
  runtime_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.runtime') %>%
    html_text()
  
  runtime_data <- as.numeric(trimws(gsub('min','',runtime_data))) #removes 'min' pattern, trims leading and trailing whitespaces and converts to numeric.
  
  cat(red((paste(length(which(is.na(runtime_data) == TRUE)),'  MISSING VALUES IN RUNTIME'))),sep="\n")
  
  return(runtime_data)
  }
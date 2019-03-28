## Scraps the GROSS REVENUE section
gross_scrap <- function(webpage) {
  gross_data <- webpage %>%
    html_nodes('.lister-item-content') %>%
    html_node('.ghost~ .text-muted+ span') %>%
    html_text()
  
  gross_data <- as.numeric(gsub("[$M,]","",gross_data))
  
  cat(red((paste(length(which(is.na(gross_data) == TRUE)),'  MISSING VALUES IN GROSS REVENUE'))),sep="\n")
  
  return(gross_data)
}
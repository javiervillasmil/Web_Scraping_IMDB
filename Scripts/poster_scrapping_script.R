## Scraps the SMALL POSTER URL section
poster_scrap <- function(webpage) {
  small_poster <- webpage %>%
    html_nodes('.loadlate') %>%
    html_attr('loadlate')
  
  cat(red((paste(length(which(is.na(small_poster) == TRUE)),'  MISSING VALUES IN SMALL POSTER'))),sep="\n")
  return(small_poster)
}
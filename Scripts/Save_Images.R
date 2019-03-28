## download the mini posters function
save_images <- function(df) {
  
  #save the Poster jpg's
  setwd(here::here('Data','Images'))
  
  for (i in df$Poster_URL) {
    tryCatch(download.file(i,
                  gsub("[$/!?:¡¿,-]","",paste(str_c(c(df$Rank[which(df$Poster_URL==i)],'_',df$Title[which(df$Poster_URL==i)]),collapse = ""),'jpg', sep = '.')), 
                  mode = 'wb', quiet = T),
             error = function(e) print(paste(i, 'did not work out'))
             )
  }
  
  cat(yellow(paste('IMAGES DOWNLOADED IN:', getwd())))
  setwd(here::here())
}

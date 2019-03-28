## Create and save the DataFrames
generate_movies_df <- function() {
 
   movies_df<-data.frame(Rank = rank, 
                        Title = title,
                        Description = description, 
                        Runtime = runtime,
                        Genre = genre, 
                        IMDB_Rating = imdb_rating,
                        Metascore = metascores,
                        Votes = votes,
                        Gross_Earning_in_Mil = gross_earning,
                        Director = director, 
                        Actor = actor,
                        Poster_URL = poster_url, stringsAsFactors = FALSE)
   
   #Set then directory to Data folder
   setwd(here::here('Data'))
   
   #creates a list with the movies_df and the url_vector
   l <- list("Movies_Scrap" = movies_df, "Url_Scrap" = as.data.frame(url_full))
   
   #writes the excel file
   write.xlsx(l, 
              file = str_c(
                c('Movies',
                  '_',
                  as.character(date(Sys.time())),
                  '_',as.character(hour(Sys.time())),
                  as.character(minute(Sys.time())),
                  '.xlsx'),
                collapse =''), 
              colNames = TRUE, borders = "columns")
   
   cat(yellow(paste('EXCEL FILE GENERATED IN:', getwd())))
   
   #Save the directory to ROOT
   setwd(here::here())
   
   #return movies df
   return(movies_df)
}


      
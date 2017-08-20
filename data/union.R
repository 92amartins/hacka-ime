library(dplyr)

setwd("../../data/")

paths <- c("cs/sarajane.csv",
           "cs/clodoaldo.csv",
           "cs/karina.csv",
           "cs/fabio_kon.csv",
           "cs/ivandre.csv",
           "fis/alencar.csv",
           "fis/salvadori.csv",
           "med/kalil.csv",
           "med/ludhmilla.csv",
           "med/sommer.csv")

df <- data.frame(Author = character(), 
                 Title = character(),
                 Year = character(),
                 Link = character(),
                 Affiliation = character(),
                 Abstract = character(),
                 "Author Keywords" = character(),
                 "Index Keywords" = character(),
                 stringsAsFactors = FALSE)

for(path in paths){
    df <- rbind(df, read.csv(path, stringsAsFactors = FALSE))
}

res <- mutate(df, Text = paste(Abstract, Author.Keywords, Index.Keywords, sep = ' ')) %>%
    select(Author, Text, Affiliation)
    
df2 <- aggregate(res$Text, by=list(res$Author, res$Affiliation), paste, collapse=";") %>%
    tail(10)

names(df2) <- c("Author", "Text", "Affiliation")

write.csv(df2, file = "data.csv")
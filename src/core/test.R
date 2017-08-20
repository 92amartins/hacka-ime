source("preprocess.R")
source("top_matches.R")

setwd("../src/core")

query <- "A smart city is an urban development vision to integrate information and communication technology (ICT) and 
Internet of things (IoT) technology in a secure fashion to manage a city's assets. These assets include local 
departments' information systems, schools, libraries, transportation systems, hospitals, power plants, water supply 
networks, waste management, law enforcement, and other community services. A smart city is promoted to use urban 
informatics and technology to improve the efficiency of services. ICT allows city officials to interact directly with 
the community and the city infrastructure and to monitor what is happening in the city, how the city is evolving, and 
how to enable a better quality of life. Through the use of sensors integrated with real-time monitoring systems, data 
are collected from citizens and devices – then processed and analyzed. The information and knowledge gathered are keys 
to tackling inefficiency.[1]"

query <- papers_to_vector(query)

papers <- read.csv("../../data/data.csv", stringsAsFactors = FALSE)

tokenized_dfm <- papers_to_vector(papers$Text)

save(tokenized_dfm, file = "database.RData")

load("database.RData")

## REAL TEST CASE
start <- Sys.time()
tokenized_query <- papers_to_vector(query)
res <- top_matches(tokenized_query)
Sys.time() - start


## MOCK OUTPUT
output1 <- data.frame(Author = papers$Author[res$id],
                      Similaridade = res$sim, 
                      Afiliação = papers$Affiliation[res$id], 
                      Query = paste0(featnames(query), collapse = " "))

write.csv(output1, file = "output3.csv")
source("preprocess.R")
source("top_matches.R")

library(readr)

query <- "machine learning"

query <- papers_to_vector(query)

papers <- read_csv("../../data/dados.csv")

tokenized_dfm <- papers_to_vector(papers$Text)

save(tokenized_dfm, file = "database.RData")

load("database.RData")

## REAL TEST CASE
start <- Sys.time()
tokenized_query <- papers_to_vector(query)
top_matches(tokenized_query)
Sys.time() - start
source("preprocess.R")
source("top_matches.R")

mapreduce_paper <- "MapReduce is a programming model and an associated implementation for processing and generating 
large datasets that is amenable to a broad variety of real-world tasks. Users specify the computation in terms of a 
map and a reduce function, and the underlying runtime system automatically parallelizes the computation across 
large-scale clusters of machines, handles machine failures, and schedules inter-machine communication to make efficient
use of the network and disks. Programmers find the system easy to use: more than ten thousand distinct MapReduce 
programs have been implemented internally at Google over the past four years, and an average of one hundred thousand 
MapReduce jobs are executed on Google's clusters every day, processing a total of more than twenty petabytes of data 
per day."

tokenized_paper <- papers_to_vector(mapreduce_paper)

papers <- read.csv("../../data/scopus.csv", stringsAsFactors = FALSE)

tokenized_dfm <- papers_to_vector(papers$Abstract)

top_matches(tokenized_paper)


## REAL TEST CASE
start <- Sys.time()
tokenized_paper <- papers_to_vector(mapreduce_paper)
top_matches(tokenized_paper)
Sys.time() - start
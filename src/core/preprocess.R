library(quanteda)

papers_to_vector <- function(papers){
    papers_tokens <- dfm(papers,
                        remove_numbers = TRUE,
                        remove_punct = TRUE,
                        remove_symbols = TRUE,
                        remove_twitter = TRUE,
                        remove_url = TRUE,
                        remove = stopwords("english"))
    papers_tokens
}
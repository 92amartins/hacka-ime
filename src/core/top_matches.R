library(corrplot)
library(lsa)

top_matches <- function(query){
    n <- ndoc(tokenized_dfm)
    
    corrs <- c()
    
    reduced_tokenized_dfm <- dfm_select(tokenized_dfm, features = query)
    
    for(i in 1:n){
        corrs[i] <- cosine(as.vector(query), as.vector(reduced_tokenized_dfm[i]))
    }
    
    similarities <- sort(corrs, decreasing = TRUE, index.return = TRUE)
    
    head(data.frame(id = similarities$ix, 
                    sim = similarities$x), 5)
}
corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations


    sulfates = vector(mode = "numeric", length = 0)
    nitrates = vector(mode = "numeric", length = 0)
    correlations = vector(mode = "numeric", length = 0)
    
    files <- list.files(directory)

    for (i in 1:length(files)) {

        filename <- paste(directory, "/", files[i], sep = "")
        
        data_raw <- read.csv(filename)

        num_complete <- sum(!is.na(data_raw[,"nitrate"] + data_raw[,"sulfate"]))


        if (num_complete >= threshold & num_complete > 0) {
            sulfates <- as.numeric(data_raw[ ,"sulfate"])
            nitrates <- as.numeric(data_raw[ ,"nitrate"])
            
            correlations <- append(correlations, cor(sulfates, nitrates, use = "pair"))
            
            
        }
    } 
    correlations

}

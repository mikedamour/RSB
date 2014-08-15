pollutantmean <- function(directory, pollutant, id = 001:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    pollut_vec = numeric(length = 0)
    for (i in id) {
        idchar <- sprintf("%03d", i)
        filename <- paste(directory, "/", idchar, ".csv", sep = "")
        pollut_raw <- read.csv(filename)        
        pollut_vec <- append(pollut_vec, as.numeric(pollut_raw[ ,pollutant]))
    } 
    mean(pollut_vec, na.rm = TRUE)
}
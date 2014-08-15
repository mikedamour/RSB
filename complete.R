complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    complete_matrix = matrix(, nrow = 0, ncol = 2)
    
    for (i in id) {
        idchar <- sprintf("%03d", i)
        filename <- paste(directory, "/", idchar, ".csv", sep = "")
        data_raw <- read.csv(filename)        
        num_complete <- sum(!is.na(data_raw[,"nitrate"] + data_raw[,"sulfate"]))
        complete_matrix <- rbind(complete_matrix, c(i, num_complete))
        
    } 
    complete_data <- data.frame(id = complete_matrix[,1], nobs = complete_matrix[,2])
    
}
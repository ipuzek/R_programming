pollutantmean <- function(directory, pollutant, id = 1:332) {

  dat <- data.frame()

  for (i in id) {
    
    idF <- formatC(i,width=3,format="d",flag="0")
    print(paste(directory, "/", idF, ".csv", sep=""))
    data.temp <- read.csv(file = paste(directory, "/", idF, ".csv", sep=""))
    dat <- rbind (dat,data.temp)
    
  }
  
  mean(dat[[pollutant]], na.rm = TRUE)
  
}

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!


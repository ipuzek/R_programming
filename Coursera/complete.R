complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  dat <- data.frame()
  
  for (i in id) {
  
  #formatiranje ID-ja - da 1 postane 001.csv, a 10 da postane 010.csv
  idF <- formatC(i,width=3,format="d",flag="0")
  
  #  print(paste(directory, "/", idF, ".csv", sep=""))
  data.temp <- read.csv(file = paste(directory, "/", idF, ".csv", sep=""))
  
  notNA.sulfate <- !is.na(data.temp$sulfate)
  notNA.nitrate <- !is.na(data.temp$nitrate)
  nobs <- sum(notNA.sulfate & notNA.nitrate)
  #  print(nobs)
  
  df.temp <- data.frame(i, nobs)
  #  print(df.temp)
  
  dat <- rbind(dat, df.temp)
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of COMPLETE CASES
  }
  
  dat
  
}

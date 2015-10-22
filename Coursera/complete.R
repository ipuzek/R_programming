complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  #petlja: for (i in id) {
  
  #formatiranje ID-ja - da 1 postane 001.csv, a 10 da postane 010.csv
  idF <- formatC(i,width=3,format="d",flag="0")
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}

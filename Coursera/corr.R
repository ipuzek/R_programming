corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
 
  #ovaj put se radi sa SVIM fajlovima!
  #iščitaj complete observations
  #if > threshold then corr else 0
   
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}



#SAMPLE OUTPUT (corr("specdata", 150))

# head
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
# summary
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
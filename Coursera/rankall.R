setwd("R/assignment_3/")

dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")


dat[,11] <- as.numeric(dat[,11])
dat[,17] <- as.numeric(dat[,17])
dat[,23] <- as.numeric(dat[,23])

dat$State <- as.factor(dat$State)

#rename varijabli
names(dat)[11] <- "heartattack"
names(dat)[17] <- "heartfailure"
names(dat)[23] <- "pneumonia"


dat.HA <- aggregate(dat$heartattack ~ dat$State, dat, rank, na.action = na.omit, simplify = TRUE)

names(dat.HA)[1] <- "HAstates"
names(dat.HA)[2] <- "HAlist"

ke <- dat.HA$HAlist
attributes(ke) <- NULL

znj <- data.frame(t(sapply(ke,c)))
#str(znj)

empty <- matrix(nrow=227, ncol=1)

for (i in 1:54) {
vec <- unlist(znj[,i], use.names=FALSE)
length(vec) <- 227

empty <- cbind(empty,vec)
}

full <- as.data.frame(empty[,-1])
names(full) <- dat.HA$HAstates

full$AK == 1
class(dat$Hospital.Name[full$AK == 1])


rankall <- function(outcome, num = "best") {
  
  ## Read outcome data
  
  
  
  ## Check that state and outcome are valid
  
  
  ## For each state, find the hospital of the given rank
  
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  
}

## S3 method for class 'data.frame'
aggregate(x, by, FUN, ..., simplify = TRUE)
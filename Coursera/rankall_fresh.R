setwd("R/assignment_3/")

rankall <- function(outcome, num = "best") {
  
  ## Read outcome data
  
  master <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  master <- subset(master, select=colnames(master)[c(2,7,11,17,23)])
  names(master)[c(3,4,5)] <- c("HA","HF","Pne")
  
  master$HA <- as.numeric(master$HA) 
  master$HF <- as.numeric(master$HF) 
  master$Pne <- as.numeric(master$Pne)
  
  master$State <- as.factor(master$State)
  
  master.subs <- subset(master, select=colnames(master)[c(1,2,3,4,5)], na.rm = TRUE)
  
  
  ## Check that state and outcome are valid

  #objekt za check imena
  valid.names <- c("heart attack","heart failure", "pneumonia")
  
  #checking number # možda ni ne treba formalni check, vidjet ćemo
  
  
  #formatiram number
  if (num=="best"){
    num <- 1
  } else if (num=="worst") {
    num <- 1
    numworst <- 1
  } else {
    num <- num
  }
  
  
  #checking outcome
  if (!is.element(outcome, valid.names)){
    stop("invalid outcome")
  }

  #formatiram outcome  
  if (outcome=="heart attack"){
    outcome <- "HA"
  } else if (num=="heart failure") {
    outcome <- "HF"
  } else {
    outcome <- "Pne"
  }
  
  ## For each state, find the hospital of the given rank

  if (numworst==1){
  master.ord <- master.subs[-order(master.subs[[outcome]], master.subs$Hospital.Name),]  
  } else {
  master.ord <- master.subs[order(master.subs[[outcome]], master.subs$Hospital.Name),]
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  ### SPLIT ###
  
  master.ord.split <- split(master.ord, f = master.ord$State, drop = TRUE)
  
  lap <- lapply(master.ord.split, function(x) x[num,1])
  lap.df <- as.data.frame(unlist(lap))
  
  #zadnji tweak konačnog frejma
  
  lap.df$state <- rownames(lap.df)
  names(lap.df) <- c("hospital","state")
  
  print(lap.df)
}





#sortiram prema outcomeu pa prema imenu ## u funkciji zamijeniti outcome!!



#master.rank <- aggregate(master$HA ~ master$State, master, rank, na.action = na.omit, simplify = TRUE)






## S3 method for class 'data.frame'
aggregate(x, by, FUN, ..., simplify = TRUE)
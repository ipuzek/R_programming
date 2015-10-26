
### ASSIGNMENT 3 ###

setwd("~/R/assignment_3/")

best <- function(state, outcome) {
  
  ## Read outcome data
  
  outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  outcome.data[,11] <- as.numeric(outcome.data[,11])
  outcome.data[,17] <- as.numeric(outcome.data[,17])
  outcome.data[,23] <- as.numeric(outcome.data[,23])
  
  #rename varijabli
  names(outcome.data)[11] <- "heart attack"
  names(outcome.data)[17] <- "heart failure"
  names(outcome.data)[23] <- "pneumonia"
  
  #objekt za check imena
  valid.names <- c("heart attack","heart failure", "pneumonia")
  
  ## Check that state and outcome are valid
  
  #checking state
  outcome.data$State <- as.factor(outcome.data$State)
  if (!is.element(state, unique(outcome.data$State))){
    stop("invalid state")
  }
  
  #checking outcome
  if (!is.element(outcome, valid.names)){
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  #subsetiram prema stateu
  outcome.data.state <- subset(outcome.data, subset = outcome.data$State==state)  
  
  #sortiram prema outcomeu pa prema imenu
  ods.ordered <- outcome.data.state[order(outcome.data.state[[outcome]], 
                                          outcome.data.state$Hospital.Name),]
  
  ods.ordered$Hospital.Name[1]

  
}




# swirl - looking at data
# names(outcome.data)
# str(outcome.data)





# BITNO! newdata <- mtcars[order(mpg, -cyl),]

# class(ods.ordered)


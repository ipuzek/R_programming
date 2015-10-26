
### ASSIGNMENT 3 ###

setwd("~/R/assignment_3/")

best <- function(state, outcome) {
  
  ## Read outcome data
  
  outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #koje varijable? 30 day mortality
  
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
  
  
  
}


!is.element("AL", unique(outcome.data$State))
min(outcome.data$"heart attack")



outcome.data.state <- subset(outcome.data, subset = outcome.data$State=="AK")


# swirl - looking at data
names(outcome.data)
str(outcome.data)


ods.ordered <- outcome.data.state[order(outcome.data.state$'heart attack', outcome.data.state$Hospital.Name),]


# BTINO! newdata <- mtcars[order(mpg, -cyl),]

class(ods.ordered)


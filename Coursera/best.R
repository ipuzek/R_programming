
### ASSIGNMENT 3 ###

setwd("~/R/assignment_3/")

best <- function(state, outcome) {
  
  ## Read outcome data
  
  outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #koje varijable? 30 day mortality
  
  #rename varijabli#
  names(outcome.data)[11] <- "heart attack"
  names(outcome.data)[17] <- "heart failure"
  names(outcome.data)[23] <- "pneumonia"
  
  ## Check that state and outcome are valid
  
  
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}


# swirl - looking at data
names(outcome.data)
str(outcome.data)

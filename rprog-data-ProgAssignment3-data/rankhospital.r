rankhospital <- function(state, outcome, num = "best"){
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  outcomelist<-c("heart attack","heart failure", "pneumonia")
  if (num == "best"){
    num = 1
  }
  
  if (state %in% outcomes[,7] == FALSE){
    stop("invalid state")
  }
  if (outcome %in% outcomelist == FALSE){
    stop("invalid outcome")
  }
  if (outcome == "heart attack"){
    statelist <- subset(outcomes, outcomes[,7]==state & complete.cases(outcomes[,11]), select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
    sorted <- statelist[order(statelist[,2],statelist[,1]),]
    if (num == "worst"){
      num = nrow(sorted)
    }
    out <- sorted[num,]$Hospital.Name
    return(as.character(out))
  }
  else if (outcome == "heart failure"){
    statelist <- subset(outcomes, outcomes[,7]==state & complete.cases(outcomes[,17]), select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    sorted <- statelist[order(statelist[,2],statelist[,1]),]
    if (num == "worst"){
      num = nrow(sorted)
    }
    out <- sorted[num,]$Hospital.Name
    return(as.character(out))
  }
  else if (outcome == "pneumonia"){
    statelist <- subset(outcomes, outcomes[,7]==state & complete.cases(outcomes[,23]), select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
    sorted <- statelist[order(statelist[,2],statelist[,1]),]
    if (num == "worst"){
      num = nrow(sorted)
    }
    out <- sorted[num,]$Hospital.Name
    return(as.character(out))
  }  
}

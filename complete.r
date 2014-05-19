complete <- function(directory, id) {
  df <- data.frame()[numeric(0),]
  allfiles <- list.files(directory, pattern = "*.csv", full.names = TRUE)
  for (file in allfiles[id]) {
    file2 <- read.csv(file)
    file2mod <- na.omit(file2)
    df <- rbind(df, c(file2mod[1,4],nrow(file2mod)))
    }
  colnames(df) <- c("id","nobs")
  return(df)
}

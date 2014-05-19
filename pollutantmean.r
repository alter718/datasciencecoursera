pollutantmean <- function(directory, pollutant, id){
  df <- data.frame()
  allfiles <- list.files(directory, pattern = "*.csv", full.names = TRUE)
  for (file in allfiles[id]) {
    file2 <- read.csv(file)
    df <- rbind(df,file2)
  }
  return(mean(df[[pollutant]], na.rm = TRUE))     
}
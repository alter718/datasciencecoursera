corr <- function(directory, threshold = 0) {
  corrdf = data.frame()
  allfiles <- list.files(directory, pattern = "*.csv", full.names = TRUE)
  for (file in allfiles) {
    file2 <- read.csv(file)
    if (nrow(na.omit(file2)) > threshold) {
      file3 <- na.omit(file2)
      s <- na.omit(file3[,2])
      n <- na.omit(file3[,3])
      cr <- cor(s,n)
      corrdf <- rbind(corrdf, cr)
    }
  }  
  if (length(corrdf) == 0){
    corrdf <- numeric()
    return(corrdf)
  } else {
    colnames(corrdf) <- c("corr")
    return(corrdf[["corr"]])
}
}


require(plyr)
#read in subject_test and subject_train and row bind
s_test<-read.table("subject_test.txt")
s_train<-read.table("subject_train.txt")
s<-rbind(s_test,s_train)
#read in y_test and y_train and row bind
y_test<-read.table("y_test.txt")
y_train<-read.table("y_train.txt")
y<-rbind(y_test,y_train)
#change column names
colnames(s)<- "UserID"
colnames(y)<- "ActivityID"
#Column bind s and y to create labels df
labels<-cbind(s,y)
#remap values for ActivityID from #s to descriptions
labels$ActivityID<-as.factor(labels$ActivityID)
labels$ActivityID<-mapvalues(labels$ActivityID, c(1,2,3,4,5,6), c("Walking","Walking Upstairs", "Walking Downstairs","Sitting","Standing","Laying"))
#read in x_test and x_train. Keep only columns with means and stdevs
x_test<-read.table("x_test.txt")
x_test<-x_test[,c(1:6,41:46,81:86,121:126,161:166,201,202,
                  214,215,227,228,240,241,253,254,266:271,
                  345:350,424:429,503,504,516,517,529,530,
                  542,543)]
x_train<-read.table("x_train.txt")
x_train<-x_train[,c(1:6,41:46,81:86,121:126,161:166,201,202,
                  214,215,227,228,240,241,253,254,266:271,
                  345:350,424:429,503,504,516,517,529,530,
                  542,543)]
#Row bind x data
x<-rbind(x_test,x_train)

#create column names for x_test
colnames(x)<- c("tBodyAccXmean","tBodyAccYmean","tBodyAccZmean",
                     "tBodyAccXstd","tBodyAccYstd","tBodyAccZstd",
                     "tGravAccXmean","tGravAccYmean","tGravAccZmean",
                     "tGravAccXstd","tGravAccY std","tGravAccZstd",
                     "tBodyAccJerkXmean","tBodyAccJerkYmean","tBodyAccJerkZmean",
                     "tBodyAccJerkXstd","tBodyAccJerkYstd","tBodyAccJerkZstd",
                     "tBodyGyroXmean","tBodyGyroYmean","tBodyGyroZmean",
                     "tBodyGyroXstd","tBodyGyroYstd","tBodyGyroZstd",
                     "tBodyGyroJerkXmean","tBodyGyroJerkYmean","tBodyGyroJerkZmean",
                     "tBodyGyroJerkXstd","tBodyGyroJerkYstd","tBodyGyroJerkZstd",
                     "tBodyAccMagmean","tBodyAccMagstd","tGravAccMagmean","tGravAccMagstd",
                     "tBodyAccJerkMagmean","tBodyAccJerkMagstd","tBodyGyroMagmean","tBodyGyroMagstd",
                     "tBodyGyroJerkMagmean","tBodyGyroJerkMagstd",
                     "fBodyAccXmean","fBodyAccYmean","fBodyAccZmean",
                     "fBodyAccXstd","fBodyAccYstd","fBodyAccZstd",
                     "fBodyAccJerkXmean","fBodyAccJerkYmean","fBodyAccJerkZmean",
                     "fBodyAccJerkXstd","fBodyAccJerkYstd","fBodyAccJerkZstd",
                     "fBodyGyroXmean","fBodyGyroYmean","fBodyGyroZmean",
                     "fBodyGyroXstd","fBodyGyroYstd","fBodyGyroZstd",
                     "fBodyAccMagmean","fBodyAccMagstd",
                     "fBodyAccJerkMagmean","fBodyAccJerkMagstd","fBodyGyroMagmean","fBodyGyroMagstd",
                     "fBodyBodyGyroJerkMagmean","fBodyBodyGyroJerkMagstd")

#bind together labels(userIDs and activities) and x(actual data)
data<-cbind(labels, x)
#run ddply from plyr package to calculate averages for each Activity within
#each UserID. numcolwise calcs the mean for each column.
out<-ddply(data, c("UserID","ActivityID"), numcolwise(mean))
write.table(out, "Samsung_data_analysis_tidy_data.txt", sep="\t", row.names = FALSE)

###CODEBOOK - Samsung Wearable Data

####UserID - The number assigned to each participant in the study

####ActivityID - self-explanatory. A description of the activity the user was doing when the data was collected.

####All other columns follow the rule set outlined below.

All column headings that begin with _bold_t(time) were captured at a constant rate of 50hz. 
Those that begin with f had a fast fourier transform applied.

They were partitioned into body(BodyAcc) and gravity(GravAcc) signals, Jerk signals (BodyAccJerk or BodyGyroJerk) and magnitude (…Mag) signals. 
XYZ endings indicate axis of measurement.
The endings mean and std indicate whether the values are means or standard deviations.

Some examples follow:

####tBodyAccXmean - mean body acceleration in the X axis
####tGravAccZstd - standard deviation of gravity acceleration in the Z axis
####tBodyGyroJerkYstd - stdev of jerk signal from gyroscope in Y axis
####fBodyAccZmean - fast fourier transformed mean body acceleration in the Z axis.


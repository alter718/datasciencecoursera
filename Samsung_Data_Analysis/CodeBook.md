###CODEBOOK - Samsung Wearable Data

####UserID - The number assigned to each participant in the study

####ActivityID - self-explanatory. A description of the activity the user was doing when the data was collected.

####All other columns follow the rule set outlined below.

All column headings that begin with __t__(time) were captured at a constant rate of 50hz. 
Those that begin with __f__ had a fast fourier transform applied.

They were partitioned into body(__BodyAcc__) and gravity(__GravAcc__) signals, Jerk signals (__BodyAccJerk__ or __BodyGyroJerk__) and magnitude (__...Mag__) signals. 
__XYZ__ endings indicate axis of measurement.
The endings __mean__ and __std__ indicate whether the values are means or standard deviations.

Some examples follow:

####tBodyAccXmean - mean body acceleration in the X axis
####tGravAccZstd - standard deviation of gravity acceleration in the Z axis
####tBodyGyroJerkYstd - stdev of jerk signal from gyroscope in Y axis
####fBodyAccZmean - fast fourier transformed mean body acceleration in the Z axis.


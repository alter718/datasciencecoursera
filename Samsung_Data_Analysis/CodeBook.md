###CODEBOOK - Samsung Wearable Data

####UserID - The number assigned to each participant in the study

####ActivityID - self-explanatory. A description of the activity the user was doing when the data was collected.

####All other columns follow the rule set outlined below.

All column headings that begin with _t(time)_ were captured at a constant rate of 50hz. 
Those that begin with _f_ had a fast fourier transform applied.

They were partitioned into body(_BodyAcc_) and gravity(_GravAcc_) signals, Jerk signals (_BodyAccJerk_ or _BodyGyroJerk_) and magnitude (…_Mag_) signals. 
_XYZ_ endings indicate axis of measurement.
The endings _mean_ and _std_ indicate whether the values are means or standard deviations.

Some examples follow:

####tBodyAccXmean - mean body acceleration in the X axis
####tGravAccZstd - standard deviation of gravity acceleration in the Z axis
####tBodyGyroJerkYstd - stdev of jerk signal from gyroscope in Y axis
####fBodyAccZmean - fast fourier transformed mean body acceleration in the Z axis.


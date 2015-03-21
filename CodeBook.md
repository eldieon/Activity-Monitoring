All variables in this dataset have been taken from the UCI HAR dataset; many of the variables in the original HAR dataset have been excluded from this version. This version contains only measures of mean and standard deviation. 

From the HAR dataset codebook:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

There are 17 patterns in the dataset; each pattern measures X, Y and Z axis, and the final HAR dataset includes measurements of mean and standard deviation from the signals, among many other variables.  

This analysis only includes variables measuring mean and standard deviation from the HAR dataset, averaged over all measurements of a subject-activity pairing. 

There are thus 82 variables in the run_analysis dataset:

Subject: numbered from 1-30, indicates which subject performed the activity using the activity monitor. 

Activity: Factor variable with six levels: Walking, Walking upstairs, walking downstairs, standing, sitting, and laying, indicating the activity the subject was doing when the measurements were taken.

Group: Factor variable with two levels: “test” and “train”, indicates which group the subject belonged to. 

79 variables are each an average of the mean and standard deviation measurements over subject-activity pairings from the original dataset. The original measurements have been standardized, and these therefore have no units.

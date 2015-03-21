# Activity-Monitoring

The data set was constructed using the files contained in the UCI HAR data set, from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Code will run as long as the files in this zip file are in your working directory

test and train data were initially dealt with separately; subject, activity, and the X variables (measurements detailed in the HAR readme) were combined column-wise, and a column was added to denote which group each observation belonged to ("test" or "train"). After combining the two data sets row-wise, the group variable was converted to factor, and the stringr package was used to replace the numbers in the activity column, with their corresponding activities (as detailed in the activity code book)

The column index of variables which measured either mean or standard deviation ("mean" or "std") were identified (using grep()) and a new data set was subset using these indices. 
The remaining column names were then tidied by converting all hyphens("-") to underscores("_"), and removing empty parentheses. 

A new table was then created, which reported only the means of each observation. ("Each observation" here signifies an instance of a subject performing an activity.) Thus the final data set has 180 rows, with one measurement of each variable for 30 subjects and 6 activities. 

The measurements in the final data set are the average of all instances of a subject doing an activity. This was achieved using data.table package, taking the mean by "subject" and "activity"



==================================================================
Senem Yuzbasioglu - Getting and Cleaning Data Project
==================================================================
SUMMARY

This document summarizes:
- which files are used to obtain clean data and why
- how the data is transformed to clean data in each part
- what the columns in the final data means

The document is broken down in five sections. Each section describes how data is transformed at the current step. At the end, the document also includes a detailed description of the variables that can be found in the final data set.

Files that are used to obtain the final merged data are:

- activity_labels.txt: contains measurement types such as walking, laying etc.
- X_test.txt: contains all test measurements 
- y_test.txt: contains test activities for each measurement
- X_train.txt: contains all training measurements 
- y_train.txt: contains training activities for each measurement
- subject_test.txt: contains test subjects 
- subject_train.txt contains training subjects

Note that features.txt and the files in the Internial Signals subfolder are not used for this analysis. features.txt is omitted, however we'll use its content for extracting and renaming columns at part two and four.

Also note that the script expects the data files to be in the same folder as the script itself.

==================================================================
PART ONE

This section explains in detail how one data set is obtained from the given test and training data sets. The processing can be broken down to these steps:

1- Read test data frames from the given files.
2- Merge test data frames to obtain one data frame for all test data.
3- Cleanup irrelevant data frames introduced at intermediate steps.
4- Read training data from the given files.
5- Merge training data frames to obtain one data frame for all training data.
6- Cleanup irrelevant data introduced at intermediate steps.
7- Append training data to test data. After this point, we have one merged data frame.
8- Cleanup intermediate test and training data frames.

==================================================================
PART TWO

This section explains how columns are selected from the merged data set. Detailed description of the variables can be found at the end.

1- Investigate the features.txt file to find out the columns that contain mean and standard deviation of measurements.
2- Load dplyr package.
3- Select necessary columns using select() command.

==================================================================
PART THREE

This section explains how descriptive activity names are used in the merged data set. 

Implementation of this requirement is done in part one by merging content of activity_labels.txt with y_test.txt and y_train.txt respectively.

==================================================================
PART FOUR

This section explains how descriptive column names are used in the merged data set. 

Column names in feature.txt correspond to the selected columns of the merged data frame. Their names are taken from this file. To make the names more self-explanatory, following renaming operations were carried out:

- "-std()" is replaced via ".StdDev".
- "-std()-" is replaced via ".StdDev.".
- "-mean()" is replaced via ".Mean".
- "-mean()-" is replaced via ".Mean.".
- Columns whose names start with "t" got ".Time.Domain" at the end. "t" is removed.
- Columns whose names start with "f" got ".Freq.Domain" at the end. "f" is removed.
- "Mag" is replaced via ".Magnitude." .

Renaming of the columns is carried out with the rename() command in dplyr package.

==================================================================
PART FIVE

This section explains how the final data set is created from the merged data set. What is done at this stage, can be broken down to the following steps:

1- Group the data according to activity and subject id. This is done using the group_by() command of the dplyr package.
2- Feed the grouped data into the summarize() command of the dplyr package. When summarizing, take the average of each selected column using the mean() command.
3- Assign the obtained data frame to a new variable
4- Finally, write this data frame to a txt file using write.table() command.

==================================================================
VARIABLE DESCRIPTIONS

Note that all signals are measured in Hz.

- Activity.Type: Type of the activity carried out during test or training
- Subject.Id: Id of the person who delivered test or training data
- BodyAcc.Mean.X.Time.Domain: Mean of the mean of the body linear acceleration on x-axis in time domain
- BodyAcc.Mean.Y.Time.Domain: Mean of the mean of the body linear acceleration on y-axis in time domain
- BodyAcc.Mean.Z.Time.Domain: Mean of the mean of the body linear acceleration on z-axis in time domain
- BodyAcc.StdDev.X.Time.Domain: Mean of the standard deviation of the body linear acceleration on x-axis in time domain
- BodyAcc.StdDev.Y.Time.Domain: Mean of the standard deviation of the body linear acceleration on y-axis in time domain
- BodyAcc.StdDev.Z.Time.Domain: Mean of the standard deviation of the body linear acceleration on z-axis in time domain
- GravityAcc.Mean.X.Time.Domain: Mean of the mean of the gravity acceleration on the x-axis in the time domain
- GravityAcc.Mean.Y.Time.Domain :	Mean of the mean of the gravity acceleration on the y-axis in the time domain
- GravityAcc.Mean.Z.Time.Domain :	Mean of the mean of the gravity acceleration on the z-axis in the time domain
- GravityAcc.StdDev.X.Time.Domain: Mean of the standard deviation of the gravity acceleration on the x-axis in the time domain
- GravityAcc.StdDev.Y.Time.Domain: Mean of the standard deviation of the gravity acceleration on the y-axis in the time domain
- GravityAcc.StdDev.Z.Time.Domain: Mean of the standard deviation of the gravity acceleration on the z-axis in the time domain
- BodyAccJerk.Mean.X.Time.Domain: Mean of the mean of the Jerk signal calculated from the body linear acceleration on x-axis in time domain
- BodyAccJerk.Mean.Y.Time.Domain: Mean of the mean of the Jerk signal calculated from the body linear acceleration on y-axis in time domain
- BodyAccJerk.Mean.Z.Time.Domain: Mean of the mean of the Jerk signal calculated from the body linear acceleration on z-axis in time domain
- BodyAccJerk.StdDev.X.Time.Domain: Mean of the standard deviation of the Jerk signal calculated from the body linear acceleration on x-axis in time domain
- BodyAccJerk.StdDev.Y.Time.Domain: Mean of the standard deviation of the Jerk signal calculated from the body linear acceleration on y-axis in time domain
- BodyAccJerk.StdDev.Z.Time.Domain: Mean of the standard deviation of the Jerk signal calculated from the body linear acceleration on z-axis in time domain
- BodyGyro.Mean.X.Time.Domain: Mean of the mean of the Jerk signal calculated from the gravity acceleration on x-axis in time domain
- BodyGyro.Mean.Y.Time.Domain: Mean of the mean of the Jerk signal calculated from the gravity acceleration on y-axis in time domain
- BodyGyro.Mean.Z.Time.Domain: Mean of the mean of the Jerk signal calculated from the gravity acceleration on z-axis in time domain
- BodyGyro.StdDev.X.Time.Domain: Mean of the standard deviation of the Jerk signal calculated from the gravity acceleration on x-axis in time domain
- BodyGyro.StdDev.Y.Time.Domain: Mean of the standard deviation of the Jerk signal calculated from the gravity acceleration on y-axis in time domain
- BodyGyro.StdDev.Z.Time.Domain: Mean of the standard deviation of the Jerk signal calculated from the gravity acceleration on z-axis in time domain
- BodyGyroJerk.Mean.X.Time.Domain: Mean of the mean of the angular velocity on x-axis in time domain
- BodyGyroJerk.Mean.Y.Time.Domain: Mean of the mean of the angular velocity on y-axis in time domain
- BodyGyroJerk.Mean.Z.Time.Domain: Mean of the mean of the angular velocity on z-axis in time domain
- BodyGyroJerk.StdDev.X.Time.Domain: Mean of the standard deviation of the angular velocity on x-axis in time domain
- BodyGyroJerk.StdDev.Y.Time.Domain: Mean of the standard deviation of the angular velocity on y-axis in time domain
- BodyGyroJerk.StdDev.Z.Time.Domain: Mean of the standard deviation  of the angular velocity on z-axis in time domain
- BodyAcc.Magnitude.Mean.Time.Domain: Mean of the mean of the magnitude of the body linear acceleration in time domain
- BodyAcc.Magnitude.StdDev.Time.Domain: Mean of the standard deviaton of the magnitude of the body linear acceleration in time domain
- GravityAcc.Magnitude.Mean.Time.Domain: Mean of the mean of the magnitude of the gravity acceleration in time domain
- GravityAcc.Magnitude.StdDev.Time.Domain: Mean of the standard deviation of the magnitude of the gravity acceleration in time domain
- BodyAccJerk.Magnitude.Mean.Time.Domain: Mean of the mean of the magnitude of Jerk signal calculated from the body linear acceleration in time domain
- BodyAccJerk.Magnitude.StdDev.Time.Domain: Mean of the standard deviation of the magnitude of Jerk signal calculated from the body linear acceleration in time domain
- BodyGyroJerk.Magnitude.Mean.Time.Domain: Mean of the mean of the magnitude of the angular velocity in time domain
- BodyGyroJerk.Magnitude.StdDev.Time.Domain: Mean of the standard deviation of the magnitude of the angular velocity in time domain
- BodyAcc.Mean.X.Freq.Domain: Mean of the mean of the body linear acceleration on x-axis in frequency domain
- BodyAcc.Mean.Y.Freq.Domain: Mean of the mean of the body linear acceleration on y-axis in frequency domain
- BodyAcc.Mean.Z.Freq.Domain: Mean of the mean of the body linear acceleration on z-axis in frequency domain
- BodyAcc.StdDev.X.Freq.Domain: Mean of the standard deviation of the body linear acceleration on x-axis in frequency domain
- BodyAcc.StdDev.Y.Freq.Domain: Mean of the standard deviation of the body linear acceleration on y-axis in frequency domain
- BodyAcc.StdDev.Z.Freq.Domain: Mean of the standard deviation of the body linear acceleration on z-axis in frequency domain
- BodyAccJerk.Mean.X.Freq.Domain: Mean of the mean of the Jerk signal calculated from the body linear acceleration on x-axis in frequency domain
- BodyAccJerk.Mean.Y.Freq.Domain: Mean of the mean of the Jerk signal calculated from the body linear acceleration on y-axis in frequency domain
- BodyAccJerk.Mean.Z.Freq.Domain: Mean of the mean of the Jerk signal calculated from the body linear acceleration on z-axis in frequency domain
- BodyAccJerk.StdDev.X.Freq.Domain: Mean of the standard deviation of the Jerk signal calculated from the body linear acceleration on x-axis in frequency domain
- BodyAccJerk.StdDev.Y: Mean of the standard deviation of the Jerk signal calculated from the body linear acceleration on y-axis in frequency domain
- BodyAccJerk.StdDev.Z: Mean of the standard deviation of the Jerk signal calculated from the body linear acceleration on z-axis in frequency domain
- BodyGyro.Mean.X: Mean of the mean of the Jerk signal calculated from the gravity acceleration on x-axis in time domain
- BodyGyro.Mean.Y: Mean of the mean of the Jerk signal calculated from the gravity acceleration on y-axis in time domain
- BodyGyro.Mean.Z: Mean of the mean of the Jerk signal calculated from the gravity acceleration on z-axis in time domain
- BodyGyro.StdDev.X: Mean of the standard deviation of the Jerk signal calculated from the gravity acceleration on x-axis in time domain
- BodyGyro.StdDev.Y: Mean of the standard deviation of the Jerk signal calculated from the gravity acceleration on y-axis in time domain
- BodyGyro.StdDev.Z: Mean of the standard deviation of the Jerk signal calculated from the gravity acceleration on z-axis in time domain
- BodyAcc.Magnitude.Mean:	Mean of the mean of the magnitude of the body linear acceleration in frequency domain
- BodyAcc.Magnitude.StdDev: Mean of the standard deviaton of the magnitude of the body linear acceleration in frequency domain
- BodyAccJerk.Magnitude.Mean: Mean of the mean of the magnitude of Jerk signal calculated from the body linear acceleration in frequency domain
- BodyAccJerk.Magnitude.StdDev: Mean of standard deviation of the magnitude of Jerk signal calculated from the body linear acceleration in frequency domain
- BodyGyro.Magnitude.Mean of the mean: Mean of the magnitude of Jerk signal calculated from the gravity acceleration in frequency domain
- BodyGyro.Magnitude.StdDev: Mean of the standard deviation of the Jerk signal calculated from the gravity acceleration in frequency domain
- BodyGyroJerk.Magnitude.Mean of the mean: Mean of the magnitude of the angular velocity in frequency domain
- BodyGyroJerk.Magnitude.StdDev: Mean of the standard deviation of the magnitude of the angular velocity in frequency domain

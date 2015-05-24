### PART ONE: Merge the training and the test sets to create one data set.###
# read "common data"
activityTypes <- read.table("activity_labels.txt")

# TEST DATA OPERATIONS
# read data
testMeasurements <- read.table("X_test.txt")
testActivities <- read.table("y_test.txt")
testSubjects <- read.table("subject_test.txt")

# merge activities
testActivities <- merge(testActivities, activityTypes, by.x="V1", by.y="V1", all=TRUE)

# append id column to both data sets to simplify the final merge
id <- 1:nrow(testMeasurements)
testMeasurements <- cbind(id, testMeasurements)

id <- 1:nrow(testActivities)
testActivities <- cbind(id, testActivities)

# do a last merge to obtain merged data
mergedTestData <- merge(testActivities, testMeasurements, by.x="id", by.y="id", all=TRUE)

# and append the test subjects column
mergedTestData <- cbind(mergedTestData, testSubjects)

# remove irrelevant data frames 
rm(testActivities)
rm(testMeasurements)
rm(testSubjects)

# TRAINING DATA OPERATIONS
# read data
trainMeasurements <- read.table("X_train.txt")
trainActivities <- read.table("y_train.txt")
trainSubjects <- read.table("subject_train.txt")

# merge activities
trainActivities <- merge(trainActivities, activityTypes, by.x="V1", by.y="V1", all=TRUE)

# append id column to both data sets to simplify the final merge
id <- 1:nrow(trainMeasurements)
trainMeasurements <- cbind(id, trainMeasurements)

id <- 1:nrow(trainActivities)
trainActivities <- cbind(id, trainActivities)

# do a last merge to obtain merged data
mergedTrainData <- merge(trainActivities, trainMeasurements, by.x="id", by.y="id", all=TRUE)
mergedTrainData <- cbind(mergedTrainData, trainSubjects)

# remove irrelevant data 
rm(trainActivities)
rm(trainMeasurements)
rm(trainSubjects)

# remove other irrelevant data
rm(id)
rm(activityTypes)

# LAST MODIFICATIONS AND CLEANUP
# at this point, we have two relevant data frames: mergedTestData and mergedTrainData.
# which we'll merge together

# finally we append one table after another
mergedData <- rbind(mergedTestData, mergedTrainData)

# and remove the test and train data sets
rm(mergedTestData)
rm(mergedTrainData)

### PART TWO: Extracts only the measurements on the mean and standard deviation for each measurement. ###
library(dplyr)
mergedData <- select(mergedData, 
                     id, V1, V2.x:V6, V41:V46, V81:V86, V121:V126,
                     V161:V166, V201:V202, V214:V215, V227:V228,
                     V240:V241, V253:V254, V266:V271, V345:V350,
                     V424:V429, V503:V504, V516:V517, V529:V530,
                     V542:V543)
  
### PART THREE: Uses descriptive activity names to name the activities in the  data set ### 
# @12, @34 show the implementation details

### PART FOUR: Appropriately labels the data set with descriptive variable names. ### 
mergedData <- rename(mergedData,
                     Measurement.Id = id,
                     Subject.Id = V1,
                     Activity.Type = V2.x,
                     BodyAcc.Mean.X.Time.Domain = V1.y,
                     BodyAcc.Mean.Y.Time.Domain = V2.y,
                     BodyAcc.Mean.Z.Time.Domain = V3,
                     BodyAcc.StdDev.X.Time.Domain = V4,
                     BodyAcc.StdDev.Y.Time.Domain = V5,
                     BodyAcc.StdDev.Z.Time.Domain = V6,
                     GravityAcc.Mean.X.Time.Domain = V41,  
                     GravityAcc.Mean.Y.Time.Domain = V42,
                     GravityAcc.Mean.Z.Time.Domain = V43,
                     GravityAcc.StdDev.X.Time.Domain = V44,
                     GravityAcc.StdDev.Y.Time.Domain = V45,
                     GravityAcc.StdDev.Z.Time.Domain = V46,
                     BodyAccJerk.Mean.X.Time.Domain = V81,
                     BodyAccJerk.Mean.Y.Time.Domain = V82,
                     BodyAccJerk.Mean.Z.Time.Domain = V83,
                     BodyAccJerk.StdDev.X.Time.Domain = V84,
                     BodyAccJerk.StdDev.Y.Time.Domain = V85,
                     BodyAccJerk.StdDev.Z.Time.Domain = V86,
                     BodyGyro.Mean.X.Time.Domain = V121,
                     BodyGyro.Mean.Y.Time.Domain = V122,
                     BodyGyro.Mean.Z.Time.Domain = V123,
                     BodyGyro.StdDev.X.Time.Domain = V124,
                     BodyGyro.StdDev.Y.Time.Domain = V125,
                     BodyGyro.StdDev.Z.Time.Domain = V126,
                     BodyGyroJerk.Mean.X.Time.Domain = V161,
                     BodyGyroJerk.Mean.Y.Time.Domain = V162,
                     BodyGyroJerk.Mean.Z.Time.Domain = V163,
                     BodyGyroJerk.StdDev.X.Time.Domain = V164,
                     BodyGyroJerk.StdDev.Y.Time.Domain = V165,
                     BodyGyroJerk.StdDev.Z.Time.Domain = V166,
                     BodyAcc.Magnitude.Mean.Time.Domain = V201,
                     BodyAcc.Magnitude.StdDev.Time.Domain = V202,
                     GravityAcc.Magnitude.Mean.Time.Domain = V214,
                     GravityAcc.Magnitude.StdDev.Time.Domain = V215,
                     BodyAccJerk.Magnitude.Mean.Time.Domain = V227,
                     BodyAccJerk.Magnitude.StdDev.Time.Domain = V228,
                     BodyGyroJerk.Magnitude.Mean.Time.Domain = V253,
                     BodyGyroJerk.Magnitude.StdDev.Time.Domain = V254,
                     BodyAcc.Mean.X.Freq.Domain = V266,
                     BodyAcc.Mean.Y.Freq.Domain = V267,
                     BodyAcc.Mean.Z.Freq.Domain = V268,
                     BodyAcc.StdDev.X.Freq.Domain = V269,
                     BodyAcc.StdDev.Y.Freq.Domain = V270,
                     BodyAcc.StdDev.Z.Freq.Domain = V271,
                     BodyAccJerk.Mean.X.Freq.Domain = V345,
                     BodyAccJerk.Mean.Y.Freq.Domain = V346,
                     BodyAccJerk.Mean.Z.Freq.Domain = V347,
                     BodyAccJerk.StdDev.X.Freq.Domain = V348,
                     BodyAccJerk.StdDev.Y.Freq.Domain = V349,
                     BodyAccJerk.StdDev.Z.Freq.Domain = V350,
                     BodyGyro.Mean.X.Freq.Domain = V424,
                     BodyGyro.Mean.Y.Freq.Domain = V425,
                     BodyGyro.Mean.Z.Freq.Domain = V426,
                     BodyGyro.StdDev.X.Freq.Domain = V427,
                     BodyGyro.StdDev.Y.Freq.Domain = V428,
                     BodyGyro.StdDev.Z.Freq.Domain = V429,
                     BodyAcc.Magnitude.Mean.Freq.Domain = V503,
                     BodyAcc.Magnitude.StdDev.Freq.Domain = V504,
                     BodyAccJerk.Magnitude.Mean.Freq.Domain = V516,
                     BodyAccJerk.Magnitude.StdDev.Freq.Domain = V517,
                     BodyGyro.Magnitude.Mean.Freq.Domain = V529,
                     BodyGyro.Magnitude.StdDev.Freq.Domain = V530,
                     BodyGyroJerk.Magnitude.Mean.Freq.Domain= V542,
                     BodyGyroJerk.Magnitude.StdDev.Freq.Domain = V543
                     )

### PART FIVE: From the data set in step 4, creates a second, independent tidy data set with the average of ###
### each variable for each activity and each subject. ### 

groupedData <- mergedData %>% group_by(Activity.Type, Subject.Id) %>% 
                          summarize(BodyAcc.Mean.X.Time.Domain = mean(BodyAcc.Mean.X.Time.Domain),
                            BodyAcc.Mean.Y.Time.Domain = mean(BodyAcc.Mean.Y.Time.Domain),
                            BodyAcc.Mean.Z.Time.Domain = mean(BodyAcc.Mean.Z.Time.Domain),
                            BodyAcc.StdDev.X.Time.Domain = mean(BodyAcc.StdDev.X.Time.Domain),
                            BodyAcc.StdDev.Y.Time.Domain = mean(BodyAcc.StdDev.Y.Time.Domain),
                            BodyAcc.StdDev.Z.Time.Domain = mean(BodyAcc.StdDev.Z.Time.Domain),
                            GravityAcc.Mean.X.Time.Domain = mean(GravityAcc.Mean.X.Time.Domain),  
                            GravityAcc.Mean.Y.Time.Domain = mean(GravityAcc.Mean.Y.Time.Domain),
                            GravityAcc.Mean.Z.Time.Domain = mean(GravityAcc.Mean.Z.Time.Domain),
                            GravityAcc.StdDev.X.Time.Domain = mean(GravityAcc.StdDev.X.Time.Domain),
                            GravityAcc.StdDev.Y.Time.Domain = mean(GravityAcc.StdDev.Y.Time.Domain),
                            GravityAcc.StdDev.Z.Time.Domain = mean(GravityAcc.StdDev.Z.Time.Domain),
                            BodyAccJerk.Mean.X.Time.Domain = mean(BodyAccJerk.Mean.X.Time.Domain),
                            BodyAccJerk.Mean.Y.Time.Domain = mean(BodyAccJerk.Mean.Y.Time.Domain),
                            BodyAccJerk.Mean.Z.Time.Domain = mean(BodyAccJerk.Mean.Z.Time.Domain),
                            BodyAccJerk.StdDev.X.Time.Domain = mean(BodyAccJerk.StdDev.X.Time.Domain),
                            BodyAccJerk.StdDev.Y.Time.Domain = mean(BodyAccJerk.StdDev.Y.Time.Domain),
                            BodyAccJerk.StdDev.Z.Time.Domain = mean(BodyAccJerk.StdDev.Z.Time.Domain),
                            BodyGyro.Mean.X.Time.Domain = mean(BodyGyro.Mean.X.Time.Domain),
                            BodyGyro.Mean.Y.Time.Domain = mean(BodyGyro.Mean.Y.Time.Domain),
                            BodyGyro.Mean.Z.Time.Domain = mean(BodyGyro.Mean.Z.Time.Domain),
                            BodyGyro.StdDev.X.Time.Domain = mean(BodyGyro.StdDev.X.Time.Domain),
                            BodyGyro.StdDev.Y.Time.Domain = mean(BodyGyro.StdDev.Y.Time.Domain),
                            BodyGyro.StdDev.Z.Time.Domain = mean(BodyGyro.StdDev.Z.Time.Domain),
                            BodyGyroJerk.Mean.X.Time.Domain = mean(BodyGyroJerk.Mean.X.Time.Domain),
                            BodyGyroJerk.Mean.Y.Time.Domain = mean(BodyGyroJerk.Mean.Y.Time.Domain),
                            BodyGyroJerk.Mean.Z.Time.Domain = mean(BodyGyroJerk.Mean.Z.Time.Domain),
                            BodyGyroJerk.StdDev.X.Time.Domain = mean(BodyGyroJerk.StdDev.X.Time.Domain),
                            BodyGyroJerk.StdDev.Y.Time.Domain = mean(BodyGyroJerk.StdDev.Y.Time.Domain),
                            BodyGyroJerk.StdDev.Z.Time.Domain = mean(BodyGyroJerk.StdDev.Z.Time.Domain),
                            BodyAcc.Magnitude.Mean.Time.Domain = mean(BodyAcc.Magnitude.Mean.Time.Domain),
                            BodyAcc.Magnitude.StdDev.Time.Domain = mean(BodyAcc.Magnitude.StdDev.Time.Domain),
                            GravityAcc.Magnitude.Mean.Time.Domain = mean(GravityAcc.Magnitude.Mean.Time.Domain),
                            GravityAcc.Magnitude.StdDev.Time.Domain = mean(GravityAcc.Magnitude.StdDev.Time.Domain),
                            BodyAccJerk.Magnitude.Mean.Time.Domain = mean(BodyAccJerk.Magnitude.Mean.Time.Domain),
                            BodyAccJerk.Magnitude.StdDev.Time.Domain = mean(BodyAccJerk.Magnitude.StdDev.Time.Domain),
                            BodyGyroJerk.Magnitude.Mean.Time.Domain = mean(BodyGyroJerk.Magnitude.Mean.Time.Domain),
                            BodyGyroJerk.Magnitude.StdDev.Time.Domain = mean(BodyGyroJerk.Magnitude.StdDev.Time.Domain),
                            BodyAcc.Mean.X.Freq.Domain = mean(BodyAcc.Mean.X.Freq.Domain),
                            BodyAcc.Mean.Y.Freq.Domain = mean(BodyAcc.Mean.Y.Freq.Domain),
                            BodyAcc.Mean.Z.Freq.Domain = mean(BodyAcc.Mean.Z.Freq.Domain ),
                            BodyAcc.StdDev.X.Freq.Domain = mean(BodyAcc.StdDev.X.Freq.Domain),
                            BodyAcc.StdDev.Y.Freq.Domain = mean(BodyAcc.StdDev.Y.Freq.Domain),
                            BodyAcc.StdDev.Z.Freq.Domain = mean(BodyAcc.StdDev.Z.Freq.Domain),
                            BodyAccJerk.Mean.X.Freq.Domain = mean(BodyAccJerk.Mean.X.Freq.Domain),
                            BodyAccJerk.Mean.Y.Freq.Domain = mean(BodyAccJerk.Mean.Y.Freq.Domain),
                            BodyAccJerk.Mean.Z.Freq.Domain = mean(BodyAccJerk.Mean.Z.Freq.Domain),
                            BodyAccJerk.StdDev.X.Freq.Domain = mean(BodyAccJerk.StdDev.X.Freq.Domain),
                            BodyAccJerk.StdDev.Y.Freq.Domain = mean(BodyAccJerk.StdDev.Y.Freq.Domain),
                            BodyAccJerk.StdDev.Z.Freq.Domain = mean(BodyAccJerk.StdDev.Z.Freq.Domain),
                            BodyGyro.Mean.X.Freq.Domain = mean(BodyGyro.Mean.X.Freq.Domain),
                            BodyGyro.Mean.Y.Freq.Domain = mean(BodyGyro.Mean.Y.Freq.Domain),
                            BodyGyro.Mean.Z.Freq.Domain = mean(BodyGyro.Mean.Z.Freq.Domain),
                            BodyGyro.StdDev.X.Freq.Domain = mean(BodyGyro.StdDev.X.Freq.Domain),
                            BodyGyro.StdDev.Y.Freq.Domain = mean(BodyGyro.StdDev.Y.Freq.Domain),
                            BodyGyro.StdDev.Z.Freq.Domain = mean(BodyGyro.StdDev.Z.Freq.Domain),
                            BodyAcc.Magnitude.Mean.Freq.Domain = mean(BodyAcc.Magnitude.Mean.Freq.Domain),
                            BodyAcc.Magnitude.StdDev.Freq.Domain = mean(BodyAcc.Magnitude.StdDev.Freq.Domain),
                            BodyAccJerk.Magnitude.Mean.Freq.Domain = mean(BodyAccJerk.Magnitude.Mean.Freq.Domain),
                            BodyAccJerk.Magnitude.StdDev.Freq.Domain = mean(BodyAccJerk.Magnitude.StdDev.Freq.Domain),
                            BodyGyro.Magnitude.Mean.Freq.Domain = mean(BodyGyro.Magnitude.Mean.Freq.Domain),
                            BodyGyro.Magnitude.StdDev.Freq.Domain = mean(BodyGyro.Magnitude.StdDev.Freq.Domain),
                            BodyGyroJerk.Magnitude.Mean.Freq.Domain= mean(BodyGyroJerk.Magnitude.Mean.Freq.Domain),
                            BodyGyroJerk.Magnitude.StdDev.Freq.Domain = mean(BodyGyroJerk.Magnitude.StdDev.Freq.Domain))

# write the new data frame to a txt file
write.table(groupedData, "output.txt", row.name=FALSE)

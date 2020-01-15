# Getting and Cleaning Data
# Course Project
library(dplyr)


# Download and unzip the data
if(!file.exists(".\\Data")){dir.create(".\\Data")}
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest <- ".\\Data\\Dataset.zip"
if(!file.exists(dest)){download.file(Url, destfile = dest)}
if(!file.exists(".\\UCI HAR Dataset")){unzip(dest, exdir = ".\\Data")}

# Read features and activity labels
features <- read.table(".\\Data\\UCI HAR Dataset\\features.txt", stringsAsFactors = FALSE, col.names = c("n", "feat"))
actLabels <- read.table(".\\Data\\UCI HAR Dataset\\activity_labels.txt", stringsAsFactors = FALSE, col.names = c("class", "activity"))

# Read Test data
x_test <- read.table(".\\Data\\UCI HAR Dataset\\test\\X_test.txt", col.names = features$feat)
y_test <- read.table(".\\Data\\UCI HAR Dataset\\test\\y_test.txt", col.names = "classLabel")
s_test <- read.table(".\\Data\\UCI HAR Dataset\\test\\subject_test.txt", col.names = "subject")

# Read Train data
x_train <- read.table(".\\Data\\UCI HAR Dataset\\train\\X_train.txt", col.names = features$feat)
y_train <- read.table(".\\Data\\UCI HAR Dataset\\train\\y_train.txt", col.names = "classLabel")
s_train <- read.table(".\\Data\\UCI HAR Dataset\\train\\subject_train.txt", col.names = "subject")

# 1. Merge data
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(s_test, s_train)
mergedData <- cbind(subject, x, y)

# 2. Extracting measurements on mean and sd
mean_sd <- mergedData %>%
  select(subject, classLabel, contains("mean"), contains("std"))

# 3. Assign descriptive activity names
mean_sd$classLabel <- actLabels[mean_sd$classLabel, 2]

# 4. Label dataset with descriptive variable names
names(mean_sd)
# According to the features_info.txt file:
# - t stands for Time
# - Acc stands for Accelerometer
# - Gyro stands for Gyroscope
# - f stands for frequency
# Each different word will start with caps to differentiate

names(mean_sd)[1] = "Subject"
names(mean_sd)[2] = "Activity"
names(mean_sd) <- gsub("^t", "Time", names(mean_sd))
names(mean_sd) <- gsub("^f", "Frequency", names(mean_sd))
names(mean_sd) <- gsub("Acc", "Accelerometer", names(mean_sd))
names(mean_sd) <- gsub("Gyro", "Gyroscope", names(mean_sd))
names(mean_sd) <- gsub("mean", "Mean", names(mean_sd))
names(mean_sd) <- gsub("std", "Std", names(mean_sd))
names(mean_sd) <- gsub("angle", "Angle", names(mean_sd))
names(mean_sd) <- gsub("\\.", "", names(mean_sd))
names(mean_sd) <- gsub("X$", "\\-X", names(mean_sd))
names(mean_sd) <- gsub("Y$", "\\-Y", names(mean_sd))
names(mean_sd) <- gsub("Z$", "\\-Z", names(mean_sd))

# 5. Tidy data set with average of each variable for each activity
# and each subject
Tidy <- group_by(mean_sd, Activity, Subject)
Tidy_mean <- summarize_all(Tidy, mean)
write.table(Tidy_mean, "Tidy_mean.txt", row.name=FALSE)

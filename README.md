# Getting and Cleaning Data Coursera Project
Course Project for the Getting and Cleaning Data course in Coursera, from the John Hopkins University specialization in Data Science.
------
The project makes use of the "Human Activity Recognition Using Smartphones Dataset. Version 1.0", from Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto.
The original data set contained:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The data was provided in 8 different data sets, each one providing either the observations, or the labels for the subjects or the variables. The data sets with the observations were divided by the training set, for observations of individuals generating the training data (70%), and the test sets, for individuals generating the test data (30%). The 8 data sets were:
- features.txt: List of all 561 features, corresponding to the observations on time and frequency domain.
- activity_labels.txt: Links the class labels with their activity name, for the six activities performed by the individuals: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.
- X_train.txt: Training set with 7,352 observations for all 561 features (variables) for the train subjects.
- y_train.txt: Variable containing the activity labels for the training set.
- subject.txt: Variable containing the subject id for the training set (21 unique subjects).
- X_test.txt: Test set with 2,947 observations for all 561 features (variables) for the train subjects.
- y_test.txt: Variable containing the activity labels for the test set.
- subject_test.txt: Variable containing the subject id for the training set (9 unique subjects).

These 8 data sets were provided in a txt format, and had to be merged and organized in order to create a tidy data set. This was done as follows:

## 1. Merging the training and the data set
The training data set (X_train) and the test data set (X_test) were first read, assigning the features list as column names. Then, both were combined by rows using the `rbind()` command in R. The same merging done for the activity labels of both data sets (y_train and y_test), and for the subject's id (subject_train and subject_test).
The result was the following three data sets, respectively:
- A data set of 10,299 observations of all 561 features.
- A data set with a variable of activity labels for the 10,299 observations.
- A data set with a varibale of subject id for the 10,299 observations.
The previous data sets could then be merged togehter using the `cbind()` command in R. This would result in one single data base containing the subject id, the activity label, and the observation for all 561 features.

## 2. Extract only the measurements on the mean and standard deviation for each measurement
From the features variables of our data set, we can observe that these include mean and standard deviation, as well as other descriptive measures such as maximum, minimum, among other.
We just want to maintain the features which include either "mean" or "std" in their name. For these, we use the `select()` function from the `dplyr` package, and select only the subject id and activity label columns, as well as the columns containing either "mean" or "std" using the `contain()` function.

## 3. Uses descriptive activity names to name the activities in the data set
This basically means substituting the labels 1-6 with the corresponding activity (WALKING,...). This can be done with defining the activity label column to be equal to the matching activity in the activity labels data set (activity_labels.txt).

## 4. Appropriately labels the data set with descriptive variable names
The idea here is to substitute the variable names with something more readable and understandable. For example, a t at the beggining of the feature name ("^t") stands for Time, whereas an f ("^f") stands for frequency.
The substitution can be done using the `names()` and the `gsub()` functions. First, for selecting the names of the variables, and then for substituting an abbreviation with the full description.

## 5. Create a second tidy data set with the average of each variable for each activity and each subject
In order to do this easily, we use the `group_by()` function, again, from the `dplyr` package, to group by activity and subject, so that when we create another table with summary data, the function applies by activity and subject.
This table can be used by using the `summarize_all()` function, stating the `mean` function as an argument.
This final table is saved using the `write.table` command

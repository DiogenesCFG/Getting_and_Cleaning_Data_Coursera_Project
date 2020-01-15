# CODE BOOK: Getting and Cleaning Data
This code book refers to the file `Tidy_mean.txt` on this repository. The `README.md` file contains more information on this data set.

The `Tidy_mean.txt` file is a data set in a space-separated values format. The first row contains the variables stating the subject id and activity identifiers, followed by the average of measurements, as will be described.

## Variables
The data set consists of 180 observations, describing the average of the features of each of the 30 subjects, for each of the 6 activities.

### Identifiers:
#### `Subject`
An id for each of the 1-30 subjects of the experiment.
#### `Activity`
One of the following activities for which the data was collected on the subjects:
- `WALKING`: Subject was walking
- `WALKING_UPSTAIRS`: Subject was walking upstairs
- `WALKING_DOWNSTAIRS`: Subject was walking downstairs
- `SITTING`: Subject was sitting
- `STANDING`: Subject was standing
- `LAYING`: Subject was laying

### Features
The features correspond to the average observation for each identifier pair (subject-activity). A total of 86 features exist in the data base, corresponding to the mean and standard deviation from the original data base.
All measurements are normalised within the [-1, 1] value.
To read each variable name, it's only necessary to divide the name each time a capital letter comes by, following these rules:

#### Domains
Each variable starts with the domain. This can be either `Time`, `Frequency` or `Angle`.
Examples are:
- `TimeBodyAccelerometerMean-X`
- `FrequencyBodyAccelerometerMean-X`
- `AngletBodyAccelerometerMeanGravity

#### Item
Each variable is followed by the item for which the observation is made, which can be a measurement of the `Body`or of the `Gravity`
Examples are:
- `TimeBodyAccelerometerMean-X`
- `TimeGravityAccelerometerMean-X`

#### Instrument
The name is followed by the instrument from which the measurement comes, which can be the `Accelerometer` or the `Gyroscope`.
Examples are:
- `TimeBodyAccelerometerMean-X`
- `TimeBodyGyroscopeMean-X`

#### Direction
Variables most of the times end with either `-X`, `-Y`, or `-Z` (or have it following `Angle`), meaning the measurement corresponds to said axis of the instrument. However, sometimes the measurement does not correspond to a given axis, but to the total magnitud using the Euclidian Norm, in which case, the instrument identifier will be followed by `Magnitude`.
Examples are:
- `TimeBodyAccelerometerMean-X`
- `TimeBodyAccelerometerMean-Y`
- `TimeBodyAccelerometerMean-Z`
- `TimeBodyAccelerometerMagnitudeMean`

#### Jerk
In some variables, `Jerk` is added to tha name, meaning the jerk (deviation of the accesleration in time) ise measured.
Examples are:
- `TimeBodyGyroscopeMean-X`
- `TimeBodyGyroscopeJerkMean-X`

#### Statistic
Finally, variables may include either `Mean` or `Std` if the observation represents the average mean or the average standard deviation for each identifier pair.
Examples are:
- `TimeBodyAccelerometerMean-X`
- `TimeBodyAccelerometerStd-X`

#### List of all features:
The previous serves to be able to interpret the meaning of the variable names. Following is the list of all feature variables in the data set:
- `TimeBodyAccelerometerMean-X`
- `TimeBodyAccelerometerMean-Y`
- `TimeBodyAccelerometerMean-Z`
- `TimeGravityAccelerometerMean-X`
- `TimeGravityAccelerometerMean-Y`
- `TimeGravityAccelerometerMean-Z`
- `TimeBodyAccelerometerJerkMean-X`
- `TimeBodyAccelerometerJerkMean-Y`
- `TimeBodyAccelerometerJerkMean-Z`
- `TimeBodyGyroscopeMean-X`
- `TimeBodyGyroscopeMean-Y`
- `TimeBodyGyroscopeMean-Z`
- `TimeBodyGyroscopeJerkMean-X`
- `TimeBodyGyroscopeJerkMean-Y`
- `TimeBodyGyroscopeJerkMean-Z`
- `TimeBodyAccelerometerMagnitudeMean`
- `TimeGravityAccelerometerMagnitudeMean`
- `TimeBodyAccelerometerJerkMagnitudeMean`
- `TimeBodyGyroscopeMagnitudeMean`
- `TimeBodyGyroscopeJerkMagnitudeMean`
- `FrequencyBodyAccelerometerMean-X`
- `FrequencyBodyAccelerometerMean-Y`
- `FrequencyBodyAccelerometerMean-Z`
- `FrequencyBodyAccelerometerMeanFreq-X`
- `FrequencyBodyAccelerometerMeanFreq-Y`
- `FrequencyBodyAccelerometerMeanFreq-Z`
- `FrequencyBodyAccelerometerJerkMean-X`
- `FrequencyBodyAccelerometerJerkMean-Y`
- `FrequencyBodyAccelerometerJerkMean-Z`
- `FrequencyBodyAccelerometerJerkMeanFreq-X`
- `FrequencyBodyAccelerometerJerkMeanFreq-Y`
- `FrequencyBodyAccelerometerJerkMeanFreq-Z`
- `FrequencyBodyGyroscopeMean-X`
- `FrequencyBodyGyroscopeMean-Y`
- `FrequencyBodyGyroscopeMean-Z`
- `FrequencyBodyGyroscopeMeanFreq-X`
- `FrequencyBodyGyroscopeMeanFreq-Y`
- `FrequencyBodyGyroscopeMeanFreq-Z`
- `FrequencyBodyAccelerometerMagnitudeMean`
- `FrequencyBodyAccelerometerMagnitudeMeanFreq`
- `FrequencyBodyBodyAccelerometerJerkMagnitudeMean`
- `FrequencyBodyBodyAccelerometerJerkMagnitudeMeanFreq`
- `FrequencyBodyBodyGyroscopeMagnitudeMean`
- `FrequencyBodyBodyGyroscopeMagnitudeMeanFreq`
- `FrequencyBodyBodyGyroscopeJerkMagnitudeMean`
- `FrequencyBodyBodyGyroscopeJerkMagnitudeMeanFreq`
- `AngletBodyAccelerometerMeanGravity`
- `AngletBodyAccelerometerJerkMeanGravityMean`
- `AngletBodyGyroscopeMeanGravityMean`
- `AngletBodyGyroscopeJerkMeanGravityMean`
- `AngleXGravityMean`
- `AngleYGravityMean`
- `AngleZGravityMean`
- `TimeBodyAccelerometerStd-X`
- `TimeBodyAccelerometerStd-Y`
- `TimeBodyAccelerometerStd-Z`
- `TimeGravityAccelerometerStd-X`
- `TimeGravityAccelerometerStd-Y`
- `TimeGravityAccelerometerStd-Z`
- `TimeBodyAccelerometerJerkStd-X`
- `TimeBodyAccelerometerJerkStd-Y`
- `TimeBodyAccelerometerJerkStd-Z`
- `TimeBodyGyroscopeStd-X`
- `TimeBodyGyroscopeStd-Y`
- `TimeBodyGyroscopeStd-Z`
- `TimeBodyGyroscopeJerkStd-X`
- `TimeBodyGyroscopeJerkStd-Y`
- `TimeBodyGyroscopeJerkStd-Z`
- `TimeBodyAccelerometerMagnitudeStd`
- `TimeGravityAccelerometerMagnitudeStd`
- `TimeBodyAccelerometerJerkMagnitudeStd`
- `TimeBodyGyroscopeMagnitudeStd`
- `TimeBodyGyroscopeJerkMagnitudeStd`
- `FrequencyBodyAccelerometerStd-X`
- `FrequencyBodyAccelerometerStd-Y`
- `FrequencyBodyAccelerometerStd-Z`
- `FrequencyBodyAccelerometerJerkStd-X`
- `FrequencyBodyAccelerometerJerkStd-Y`
- `FrequencyBodyAccelerometerJerkStd-Z`
- `FrequencyBodyGyroscopeStd-X`
- `FrequencyBodyGyroscopeStd-Y`
- `FrequencyBodyGyroscopeStd-Z`
- `FrequencyBodyAccelerometerMagnitudeStd`
- `FrequencyBodyBodyAccelerometerJerkMagnitudeStd`
- `FrequencyBodyBodyGyroscopeMagnitudeStd`
- `FrequencyBodyBodyGyroscopeJerkMagnitudeStd`

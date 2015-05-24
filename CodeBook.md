## About the setup

Wearable computing is a very active data science right now. Many companies are competing to develop new technology to appeal to new users.

The data used in this study, from the uman Activity Recognition database, has been obtained from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone (Samsung Galaxy S) with embedded inertial sensors (accelerometers).

## Raw data

- Features are normalized and bounded within [-1,1]. 
- Each feature vector is a row on the text file.

### Feature Labels

The data labels for each feature have a very specific format related with how the measurements were obtained. The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

Here the prefix 't' denotes time as they are signals in the time domain that were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

So in this set:

* t -> denotes time
* Gyro -> denotes that the measurement comes from the gyroscope
* Acc -> denotes that the measurement comes from the accelerometer
* X, Y, Z -> denotes the axis from which the signal came
* Jerk -> denotes Jerk signals
* Body -> denotes body acceleration
* Gravity -> denotes gravity acceleration
* Mag -> denotes magnitude

The set of variables that were estimated from all the signals described above are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

This notation has been kept as they are in the resulting data set. They are deemed sufficiently clear and using longer names will make the management of the data frames messier.

### Activity Labels

These labels are explained in the activity_labels.txt file and are also used without further modification.

* 1 -> WALKING
* 2 -> WALKING_UPSTAIRS
* 3 -> WALKING_DOWNSTAIRS
* 4 -> SITTING
* 5 -> STANDING
* 6 -> LAYING

### Subject Labels

The subjects included in the study are contained in two separate files. One file (subject_test.txt) contains the subjects in the 'test' set and the other file (subject_train.txt) contains the subjects from the 'train' set.

The subjects are described as a number, an id that will be kept as a number in the final data set as a numerical id is a good approach for identifying subjects in a set that contains values between 1 and 30.

## Procedure followed to produce the final data set

Considerations: as the data in the Inertial folders is unlabelled data and this data is asked to be eliminated in step 2, it will not be processed since the beginning.

1. The data coming from the test and train sets is first combined into a unified data frame in which the train data is appended to the test data frame resulting in a unified data frame with 10299 rows.

2. The second step is to label the data set with descriptive labels. The labels are taken from the file containing these labels (features.txt) and applied to the complete data frame. When studying the labels some duplicated labels are detected but as in the following steps the columns associated with these labels will be dispossed of, they are left there and eliminated afterwards. 

3. The measurements on the mean and standard deviation are extracted from the data. To do this a subset of the labels containing the mean() and std() strings is constructed. meanFreq() is not considered as its definition is not considered as fitting with the mean of the direct measurements. With this subset of the variables a new data frame consisting of a subset of the original data frame derived from the previous steps is created.

4. The following step is to apply descriptive activity names to name the activities in the data set to do this a column labelled 'activities' is added at the start of the data frame with the activities for each row detailed by name. Additionally and with the purpose of a more descriptive data set, another column is added containig the id of the test/train subject labelled 'subject_id ' and with values between 1 and 30.

5. From the data set in step 4, an independent tidy data set with the average of each variable for each activity and each subject. 

6. The data set is finally stored as a txt file created with write.table() using row.name=FALSE



describes the variables, the data, and any transformations or work that you performed to clean up the data

## About the setup

Wearable computing is a very active data science right now. Many companies are competing to develop new technology to appeal to new users.

The data used in this study, from the uman Activity Recognition database, has been obtained from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone (Samsung Galaxy S) with embedded inertial sensors (accelerometers).

## Raw data

### Labels

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

This notation has been kept as they are in the resulting data set as they are deemed sufficiently clear and using longer names will make the management of the data frames messier



* 1 -> WALKING
* 2 -> WALKING_UPSTAIRS
* 3 -> WALKING_DOWNSTAIRS
* 4 -> SITTING
* 5 -> STANDING
* 6 -> LAYING

## Main goals

The business wants to assign ID# to the dogs, and codewords to the address to make this data anonymous. There isn't anything to do to the comments--since free text is all over the place.

## Codebook

As the data in the Inertial folders is unlabelled data and this data is asked to be eliminated in step 2, it will not be processed since the beginning.

The data coming from the test and train sets is first combined into a unified data frame in which the train data is appended to the test data frame.



The dog's name was transformed into an IDNumber (unique) (1-50), the address was transformed into a factor, OwnerName (levels Alice, Bob, Charlie, Deborah, Ernest and Fred), time and date walked were counted to make WalksPerWeek1, WalksPerWeek2, and WalksPerWeek3. Week1 begins at 00:01UTC on July1, 2014, Week2 begins at 00:01UTC on July8, 2014, Week3 begins at 00:01UTC on July15, 2014. Health was summarized as HealthWeek1, HealthWeek2, and HealthWeek3. It is a factor with two levels, Well and Sick. If the dog was sick at any walk during that week, dog was marked sick, else dog was marked well. Dog Size was converted into a factor: Large, Medium and Small are the levels. Comments are dropped. Pay is transformed into PayWeek1, PayWeek2, PayWeek3, which is a factor that has two levels (Yes, and No) for correct pay paid during that week.

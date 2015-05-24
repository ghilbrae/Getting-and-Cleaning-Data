# Getting-and-Cleaning-Data
This repository contains the code for the assignment for the Course Getting and Cleaning Data

## General considerations

1. The repository also contains the original data files. Although it was not needed for the exercise they have been included for completitude.
2. As the data in the Inertial folders is unlabelled data and this data is asked to be eliminated in step 2, it will not be processed since the beginning.
3. For the purpose of obtaining the mean and standard deviation, only the data which specifically stated *mean()* and *std()* has been taken into account.

The repository contains:

* run_analysis.R -> The script that performs the processing of the raw data and generates the final tidy data set.
* README.md -> This readme file
* CodeBook.md -> File describing the process followed to clean and process the raw data.
* tidy_data.txt -> The resulting file from the processing. Contains a clean data set.
* UCI HAR Dataset -> directory containing the data
* UCI HAR Dataset/test -> directory containing the test data
* UCI HAR Dataset/test/subject_test.txt -> directory containing the test activities for each measurement
* UCI HAR Dataset/test/X_test.txt -> directory containing the test data
* UCI HAR Dataset/test/y_test.txt -> directory containing the test subjects ids for each measurement
* UCI HAR Dataset/train -> directory containing the train data
* UCI HAR Dataset/train/subject_train.txt -> directory containing the train activities for each measurement
* UCI HAR Dataset/train/X_train.txt -> directory containing the train data
* UCI HAR Dataset/train/y_train.txt -> directory containing the train subjects ids for each measurement
* UCI HAR Dataset/features_info.txt -> Shows information about the variables used on the feature vector.
* UCI HAR Dataset/features.txt -> List of all features.
* UCI HAR Dataset/activity_labels.txt -> Links the class labels with their activity name.

## Procedure followed to produce the final data set

Considerations: as the data in the Inertial folders is unlabelled data and this data is asked to be eliminated in step 2, it will not be processed since the beginning.

1. The data coming from the test and train sets is first combined into a unified data frame in which the train data is appended to the test data frame resulting in a unified data frame with 10299 rows.

2. The second step is to label the data set with descriptive labels. The labels are taken from the file containing these labels (features.txt) and applied to the complete data frame. When studying the labels some duplicated labels are detected but as in the following steps the columns associated with these labels will be dispossed of, they are left there and eliminated afterwards. 

3. The measurements on the mean and standard deviation are extracted from the data. To do this a subset of the labels containing the mean() and std() strings is constructed. meanFreq() is not considered as its definition is not considered as fitting with the mean of the direct measurements. With this subset of the variables a new data frame consisting of a subset of the original data frame derived from the previous steps is created.

4. The following step is to apply descriptive activity names to name the activities in the data set to do this a column labelled 'activities' is added at the start of the data frame with the activities for each row detailed by name. Additionally and with the purpose of a more descriptive data set, another column is added containig the id of the test/train subject labelled 'subject_id ' and with values between 1 and 30.

5. From the data set in step 4, an independent tidy data set with the average of each variable for each activity and each subject. 

6. The data set is finally stored as a txt file created with write.table() using row.name=FALSE

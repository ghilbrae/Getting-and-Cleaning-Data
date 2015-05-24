# This script is used to do the following tasks:
# 
# 1. Merge the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
# 
# It contains a set of helper functions that perform smaller tasks like opening 
# files, creating labels, merging data sets, etc.
# 
# At the end of the file is the code that performs all the operations required 
# to solve the tasks described above, not in the same order.
# 
# All the operations leading to a final set combining the test and train sets 
# will be done so that the first set will always be the test one and the appended
# one will be the train set. This is done for the set themselves as well as for
# the correct labelling of the rows.

## Get the data from source
get_data <- function(filename){
    # This function is used to obtain a dataframe from a text file with no
    # headers 
    # 
    # Args: a character vector containing the file name (or path to)
    # Returns: a data frame
    read.table(filename)
}

get_collabels <- function(filename){
    # This function is used to obtain a dataframe from the text file that contains
    # information on the column labels of the data set (features.txt)
    # 
    # Args: a character vector containing the file name (or path to)
    # Returns: a factor vector
    labels_set <- read.table(filename)
    labels_set$V2
}

get_rowlabels <- function(filename){
    # This function is used to obtain a dataframe from the text file that contains
    # information on the row labels of the data set (Y_test.txt, Y_train.txt, 
    # subject_test.txt)
    # 
    # Args: a character vector containing the file name (or path to)
    # Returns: a data frame
    read.table(filename)
}

## To merge the training and test sets
merge_set <- function(dataframe1, dataframe2){
    # This function is used to merge two data frames that contain the same number 
    # of columns into one set.
    # 
    # Args: two data frames
    # Returns: a data frame
    rbind(dataframe1, dataframe2)
}

## To label the data set with descriptive names 
get_activity <- function(activity_id){
    as.character(activity_data[activity_id, 2])
}

set_collabels <- function(dataframe, labeldata){
    # This function is used to label the data in a data frame using a vector of
    # factors containing the labels
    # 
    # Args: a data frame and a factor vertor
    # Returns: a data frame with labelled columns
    names(dataframe) <- labeldata
    dataframe
}

set_rowlabels <- function(dataframe, labeldata){
    # This function is used to label the measurements in a data frame using a 
    # vector of factors containing the labels
    # 
    # Args: a data frame and a character vector
    # Returns: a data frame with labelled rows
    rownames(dataframe) <- labeldata
    dataframe
}


## Script that processes all the data resulting in the final data set

# Data files - Load the data from the data files

# Test
test_datafile <- 'UCI HAR Dataset/test/X_test.txt'
subject_testfile <- 'UCI HAR Dataset/test/subject_test.txt'
activity_testfile <- 'UCI HAR Dataset/test/y_test.txt'
# Train
train_datafile <- 'UCI HAR Dataset/train/X_train.txt'
subject_trainfile <- 'UCI HAR Dataset/train/subject_train.txt'
activity_trainfile <- 'UCI HAR Dataset/train/y_train.txt'
# Common
variable_labels <- 'UCI HAR Dataset/features.txt'
activity_labels <- 'UCI HAR Dataset/activity_labels.txt'

# End Data files - Load the data from the data files

# 1. Merge the training and the test sets to create one data set.
test_set <- get_data(test_datafile)
train_set <- get_data(train_datafile)
complete_data <- merge_set(test_set, train_set)

# 4. Appropriately labels the data set with descriptive variable names. 
features_labels <- get_collabels(variable_labels)
complete_data_withcollabels <- set_collabels(complete_data, features_labels)


# 2. Extracts only the measurements on the mean and standard deviation for each 
means_and_stds <- sort(c(grep('mean()', names(play_set), fixed = TRUE), grep('std()', names(play_set), fixed = TRUE)))
means_and_stds_set <- ready_data[,means_and_stds]

# 3. Uses descriptive activity names to name the activities in the data set
# To do this a column labelled 'activities' will be added at the start of the 
# data frame with the activities for each row detailed by name. Additionally and
# with the purpose of a more descriptive data set, another column will be added
# containig the id of the test/train subject labelled 'subject_id ' and with 
# values between 1 and 30.
test_subjects <- get_data(subject_testfile)
train_subjects <- get_data(subject_trainfile)
test_activities <- get_data(activity_testfile)
train_activities <- get_data(activity_trainfile)
activity_data <- get_data(activity_labels)

# Create a data frame with all the subjects test followed by train
subjects <- rbind(test_subjects, train_subjects)
names(subjects) <- 'subject_id'

# Create a data frame with all the activities test followed by train
activity_ids <- rbind(test_activities, train_activities)
# Switch the activity numbers for the descriptive name as shown in file activity_labels.txt
number_of_rows <- nrow(activity_ids)
activities <- character(number_of_rows)
for(i in 1:number_of_rows){
    activity_id <- activity_ids[i,]
    activity_name <- get_activity(activity_id)
    activities[i] <- activity_name
}
activities <- as.factor(activities)
names(activities) <- 'activity'

# Tidy data set with labelled columns and two extra rows detailing the subject 
# and the activity performed
tidy_data <- cbind(subjects, activities, means_and_stds_set)

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# The data set is also stored as a txt file created with write.table() using 
# row.name=FALSE
end_data <- group_by(tidy_data, subject_id, activities) %>% summarise_each(funs(mean))
write.table(end_data, 'tidy_data.txt', row.name = FALSE)


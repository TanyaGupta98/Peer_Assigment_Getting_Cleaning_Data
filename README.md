# Intro
This is my Peer-Graded Assignment for Getting and Cleaning the data. 

## Data Source
Data source is the same as the in the assigment brief.

## Analysis File Description
The working directory for this assignment is the UCI HAR Dataset folder. Dplyr package was required to run this script.

1.Merge data - training and test data to create as one data set

2. Extract only measurment on mean and standard deviation for each measurment.

3.Using activity name in the data set

4.Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Analysis would read all test and train data, thus merging them. Each Variable were named as per the features based on the feature.txt file.

Using the merged data, idependent tidy data set with average of each variable, each activity and each subject is written into tidy.txt


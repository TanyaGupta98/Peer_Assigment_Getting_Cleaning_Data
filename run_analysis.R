
# Library used
library(data.table)
library(dplyr)

#Read Material
feature_names <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Training Data
subj_trn <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
y_trn <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
x_trn <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

#Test data
subj_tst <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
y_tst <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
x_tst<- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

#Combine as one data set
subject <- rbind(subj_trn, subj_tst)
activity <- rbind(y_trn, y_tst)
features <- rbind(x_trn, x_tst)

colnames(features) <- t(feature_names[2])

#Merging data
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
complete_data <- cbind(features,activity,subject)

columns_mean_std <- grep(".*Mean.*|.*Std.*", names(complete_data), ignore.case=TRUE)

requiredColumns <- c(columns_mean_std, 562, 563)
dim(complete_data)

extracted_data <- complete_data[,requiredColumns]

#Allocating activity name in data set and proper labels

extracted_data$Activity <- as.character(extracted_data$Activity)
for (i in 1:6){
    extracted_data$Activity[extracted_data$Activity == i] <- as.character(activityLabels[i,2])
}
extracted_data$Activity <- as.factor(extracted_data$Activity)
names(extracted_data)

# Name changed for activity names
names(extracted_data)<-gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data)<-gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data)<-gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data)<-gsub("Mag", "Magnitude", names(extracted_data))

#Creating tidy data set 
extracted_data$Subject <- as.factor(extracted_data$Subject)
extracted_data <- data.table(extracted_data)
tidyData <- aggregate(. ~Subject + Activity, extracted_data, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

##this script is for "Getting and Cleaning Data Course Project", and does the following:
##1.read the training and the test sets from the working directory and merge them to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement.
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names.
##5.From the data set in step 4, creates a second, independent tidy data set with the average of 
##each variable for each activity and each subject.


##read activity_labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

##read features
features <- read.table("./UCI HAR Dataset/features.txt")

##read the test sets
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

##read the training sets
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

##merge the two data sets to one data set
subject_merge <- rbind(subject_train, subject_test)
x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)

##rename the varible names of x_merge
features_names <- gsub("[-\\(\\),]", "", features[,2])
names(x_merge) <- features_names

#name the activities in the data set y_merge by add a column
y_merge$V2 <- activity_labels[y_merge$V1, 2]

#Extracts only the measurements on the mean and standard deviation for each measurement
x_merge_extract <- x_merge[,features[grepl("(mean\\(\\))|(std\\(\\))", features$V2), 1]]

#merge the subjects, features, activities to one data set
data_merge <- cbind(subjectID = subject_merge$V1, activity = y_merge$V2, x_merge_extract)

##calculate the average of each variable for each activity and each subject
library(dplyr)
data_merge_group <- group_by(data_merge, subjectID, activity)
data_result <- summarise_each(data_merge_group, funs(mean))

##write the result to the file "analysis_result.txt"
write.table(data_result, file = "./analysis_result.txt", row.name = FALSE)





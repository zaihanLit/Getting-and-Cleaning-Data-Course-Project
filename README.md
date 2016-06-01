---
title: "README.md"
author: "zaihan"
date: "2016年5月31日"
---

---

## Script File

run_analysis.R

---

## Writer

[Tian Li](mailto: zaihan_lit@163.com)

---

## What does this script do?

This script is for "Getting and Cleaning Data Course Project", and does the following:

1.Read the training and the test sets from the working directory and merge them to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

---

## Input

The input data set is the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The download link is "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

A full description is available at the site where the data was obtained: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones". 

The data set should be put in the working directory.

---

## Output

The result is written to the file "./analysis_result.txt".

---

## How does this script work?

The script works as the followings:

1.read activity_labels from the file "./UCI HAR Dataset/activity_labels.txt"

2.read the features from the file "./UCI HAR Dataset/features.txt"

3.read the test sets from the files: "./UCI HAR Dataset/test/subject_test.txt" "./UCI HAR Dataset/test/X_test.txt" "./UCI HAR Dataset/test/y_test.txt"

4.read the training sets from the files: "./UCI HAR Dataset/train/subject_train.txt" "./UCI HAR Dataset/train/X_train.txt" "./UCI HAR Dataset/train/y_train.txt"

5.merge the two data sets(the test set and training set) to one data set by rbind()

6.rename the varible names of x_merge using the values of the features set

7.name the activities in the data set y_merge using the values of the activity_labels

8.Extracts only the measurements on the mean and standard deviation for each measurement

9.merge the subjects, features, activities to one data set

10.calculate the average of each variable for each activity and each subject, using group_by() and summarise_each(), package "dplyr" is loaded at the first.

11.the final step, writing the result to the file "./analysis_result.txt"

---

## Something you should know before running this script

* This script has been tested on R version 3.2.4, x86_64-apple-darwin13.4.0.

* Package "dplyr" should be installed before you run it.

* The input of the script is the specific data set as the project requires. If you want to use this script to analyze other data sets, make sure that you understand this script well and know how to make some adjustments to this script.


---

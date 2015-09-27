# Getting-and-Cleaning-Function
This repo contains the course project for the Coursera course Getting and Cleaning Data. It contains a the code of a function run_analysis.r that transforms data about accelerometers into a tidy data set containing values of interest. 

# The Data for this function:
The data came from a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.The data is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# The Function:
To execute the function download the data, unzip in, and make the resulting folder your working directory. Function performs the following actions to the raw data set:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Requirements 
In order for this function to work you need to install the Data.Table and reshape2 R packages.

# Thank You!
I'm super excited about all this. Thanks a lot for taking the time to read this!

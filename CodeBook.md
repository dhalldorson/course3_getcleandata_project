---
title: "CodeBook.md"
author: "David Halldorson"
date: "February 18, 2018"
output: html_document
---

## Getting and Cleaning Data Course Project

This document contains a description of the variables, data, and transformations that were 
performed on for this course project. The overall objective of this project was to take
an existing set of data and manipulate it into a new tidy set of data that can be used
for subsequent analysis.


## Data set 1: combinedMeanStd.csv

This file contains values for the mean and standard deviation for the recorded observations
of the subjects. 

### Data Dictionary 
* Subject - Identifier for the subject (1-30)
* Activity - activity being performed (STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
* {48 Observations of either the average (mean) or standard deviation (std) of the measurement}  
tBodyAcc_mean_X, tBodyAcc_mean_Y, tBodyAcc_mean_Z,  
tBodyAcc_std_X, tBodyAcc_std_Y, tBodyAcc_std_Z,  
tGravityAcc_mean_X, tGravityAcc_mean_Y, tGravityAcc_mean_Z,  
tGravityAcc_std_X, tGravityAcc_std_Y, tGravityAcc_std_Z,  
tBodyAccJerk_mean_X, tBodyAccJerk_mean_Y, tBodyAccJerk_mean_Z,  
tBodyAccJerk_std_X, tBodyAccJerk_std_Y, tBodyAccJerk_std_Z,  
tBodyGyro_mean_X, tBodyGyro_mean_Y, tBodyGyro_mean_Z,  
tBodyGyro_std_X, tBodyGyro_std_Y, tBodyGyro_std_Z,  
tBodyGyroJerk_mean_X, tBodyGyroJerk_mean_Y, tBodyGyroJerk_mean_Z,  
tBodyGyroJerk_std_X, tBodyGyroJerk_std_Y, tBodyGyroJerk_std_Z,  
fBodyAcc_mean_X, fBodyAcc_mean_Y, fBodyAcc_mean_Z,  
fBodyAcc_std_X, fBodyAcc_std_Y, fBodyAcc_std_Z,  
fBodyAccJerk_mean_X, fBodyAccJerk_mean_Y, fBodyAccJerk_mean_Z,  
fBodyAccJerk_std_X, fBodyAccJerk_std_Y, fBodyAccJerk_std_Z,  
fBodyGyro_mean_X, fBodyGyro_mean_Y, fBodyGyro_mean_Z,  
fBodyGyro_std_X, fBodyGyro_std_Y, fBodyGyro_std_Z  

## Data set 2: combinedMeanStd_groupAvgs.csv

This file contains a summarization of the previous data set. For each Subject/Activity combination
an average (mean) has been calculated for each variable.  

### Data Dictionary 
 * Subject - Identifier for the subject (1-30)
 * Activity - activity being performed (STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
 * {48 Observations of either the average (mean) or standard deviation (std) of the measurement have then been averaged}  
tBodyAcc_mean_X_average, tBodyAcc_mean_Y_average, tBodyAcc_mean_Z_average,  
tBodyAcc_std_X_average, tBodyAcc_std_Y_average, tBodyAcc_std_Z_average,  
tGravityAcc_mean_X_average, tGravityAcc_mean_Y_average, tGravityAcc_mean_Z_average,  
tGravityAcc_std_X_average, tGravityAcc_std_Y_average, tGravityAcc_std_Z_average,  
tBodyAccJerk_mean_X_average, tBodyAccJerk_mean_Y_average, tBodyAccJerk_mean_Z_average,  
tBodyAccJerk_std_X_average, tBodyAccJerk_std_Y_average, tBodyAccJerk_std_Z_average,   
tBodyGyro_mean_X_average, tBodyGyro_mean_Y_average, tBodyGyro_mean_Z_average,   
tBodyGyro_std_X_average, tBodyGyro_std_Y_average, tBodyGyro_std_Z_average,   
tBodyGyroJerk_mean_X_average, tBodyGyroJerk_mean_Y_average, tBodyGyroJerk_mean_Z_average,  
tBodyGyroJerk_std_X_average, tBodyGyroJerk_std_Y_average, tBodyGyroJerk_std_Z_average,   
fBodyAcc_mean_X_average, fBodyAcc_mean_Y_average, fBodyAcc_mean_Z_average,   
fBodyAcc_std_X_average, fBodyAcc_std_Y_average, fBodyAcc_std_Z_average,   
fBodyAccJerk_mean_X_average, fBodyAccJerk_mean_Y_average, fBodyAccJerk_mean_Z_average,  
fBodyAccJerk_std_X_average, fBodyAccJerk_std_Y_average, fBodyAccJerk_std_Z_average,   
fBodyGyro_mean_X_average, fBodyGyro_mean_Y_average, fBodyGyro_mean_Z_average,   
fBodyGyro_std_X_average, fBodyGyro_std_Y_average, fBodyGyro_std_Z_average


### Tranformation steps
Two sets of data were provided in the original data set. One was a training set and the other was a testing set. Labels for the features, activities, and subject were all stored in separate files. 

The script created performs the following transformation steps:   
 * Combines the training and test sets of data  
 * Using the feature file attach meaningful names to the variables in the data set  
 * Only select out the variables that calculate a mean or a std  
 * Attach the subject identifier and description of the activity being performed

## Original data source

The original set of data came from a human activity recognition database that stores 
recordings of 30 subjects performing activities while carrying smartphones with accelerometers 
and gyroscopes. The full description can be found here <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The original data set can be found here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


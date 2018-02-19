run_Analysis <- function(){
##******************************************************************************     
##Getting and Cleaning Data - Final Project
##
##This function will perform several steps to extract and reorganize data 
##from two data sets "training" and "test" as follows: 
##1. Merge them into one data set
##2. Extract measurements for the mean and standard deviation only
##3. Use descriptive activity names within the data set
##4. Label data set with descriptive variable names
##5. From result of 4. create another data set with average of each variable for
##   each activity and each subject.
##
##Returned: 
##    Result of the function will be the final tidy data set from step 5
##Outputs:
##   Two files are created in the current working directory 
##        "combinedMeanStd.txt" 
##        "combinedMeanStd_groupAvgs.txt"
##Dependencies:
##   The following libraries must be installed: plyr, dplyr, stringr
##   The current working directory this is called from must contain an unzipped
##   set of subfolders in the folder ".\UCI HAR Dataset" 
##******************************************************************************
     ##0:
     ##Load libraries that are needed
     library(plyr)
     library(dplyr)
     library(stringr)
     
     ##1:
     ##Read in the data files that contain the information on each observation
     ##that will be needed
     test<-read.table('./UCI HAR Dataset/test/X_test.txt')
     testlab<-read.table('./UCI HAR Dataset/test/y_test.txt')
     testsub<-read.table('./UCI HAR Dataset/test/subject_test.txt')
     train<-read.table('./UCI HAR Dataset/train/X_train.txt')
     trainlab<-read.table('./UCI HAR Dataset/train/y_train.txt')
     trainsub<-read.table('./UCI HAR Dataset/train/subject_train.txt')
          
     ##combine into 3 data frames
     comb<-bind_rows(test,train)
     comblab<-bind_rows(testlab,trainlab)
     combsub<-bind_rows(testsub,trainsub)
     rm(test,train,testlab,trainlab,testsub,trainsub) ##clean unneeded data frames
     
     #2:
     ##Read in the feature file, give names to that data frame 
     feat<-read.table('./UCI HAR Dataset/features.txt')
     names(feat)<-c('colnum', 'desc')
     ##Next two steps are to edit the names of the variables to make analysis easier later
     feat[,2]<-sub("\\(\\)", "", feat[,2])  ##Remove the "paranthesis"()" from the variable name
     feat[,2]<-str_replace_all(feat[,2], "-", "_")  ##Change "-" to "an underscore"_"
     
     ##filter for the mean and standard deviation items only 
     featfilter<-feat[grep("mean\\_|std\\_", feat[,2]),]  
     combMSD<-select(comb, select(featfilter, colnum)[,1])
     rm(comb) ##cleanup unneeded data frame

     ##4(initial):
     ##Rename the variables to be descriptive
     ##Note Performed this step out of order intentially top get the column
     ##names labeled first before binding on additional columns to the data frame
     names(combMSD)<-select(featfilter, desc)[,1]
     names(combsub)<-c('Subject')
          
     #3:
     ##Get the activity labels from the file and give meaningful names to the columns 
     actlab<-read.table('./UCI HAR Dataset/activity_labels.txt')
     names(actlab) <- c('labid', 'Activity')
     names(comblab)<- c('labid')
     ##Perform a join to get the label descriptions
     comblab<-join(comblab,actlab)
     
     ##Next append the columns for the subject id and activity labels 
     combMSD<-bind_cols(combsub, select(comblab, Activity), combMSD)
     
     ##4(completed):
     ##save the data set to a new file
     write.table(combMSD, "combinedMeanStd.txt", row.name=FALSE)
     
     ##5:
     ##Group Subject and Activity
     gb<-group_by_at(combMSD, vars(Subject, Activity))
     combMSDavgs<-summarize_all(gb, funs(average=mean))
     ##save the data set to a new file
     write.table(combMSDavgs, "combinedMeanStd_groupAvgs.txt", row.name=FALSE)
     combMSDavgs
}
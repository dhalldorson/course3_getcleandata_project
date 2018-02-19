## README.MD
### Data Science Course 3 - Getting and Cleaning Data - Project  
### Description of files included
 * CodeBook.md - Contains data dictionary of the files provided, summary of steps performed, and original source.  
 * run_analysis.R - Script that performed the collection of data, cleanup, and generation of new data sets.  
      + The current working directory must contain an unzipped set of subfolders in the folder ".\UCI HAR Dataset" 
      + Call the script res<-run_analyis()  
      + The two files below will be created as a result of the script  
      + Read the documentation within the script for more information  
 * combinedMeanStd.txt - This file contains values for the mean and standard deviation for the recorded observations of the subjects.  
 * combinedMeanStd_groupAvgs.txt - This file contains a summarization of the previous data set. For each Subject/Activity combination an average (mean) has been calculated for each variable. 

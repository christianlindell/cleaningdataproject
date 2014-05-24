



Summary statistics from the Human Activity Recognition Using Smartphones Dataset Version 1.0
============================================================================================


The aim of the r script run_analysis.R is to produce summary statistics from the dataset Human Activity Recognition Using Smartphones,that can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

How to use the scipt:

To run the script the data set must be downloaded and unzipt and placed in the same directory as run_analysis.R. The unzipt data set should be in the directory 'UCI HAR Dataset'. You will find detailed information of the full dataset in the 'README.txt' and the features_info.txt' in the directory ´UCI HAR Dataset´ A brief description of the study design and the variables is in the file 'Codebook.md' that is in the same directory as the run_analysis.R script.

The script does the following thing:
1. Merge each of the training and data sets with the activity names and the subject ids used in the study.
2. Merge the training and test set into one table.
3. Change the variable names so that they follow naming conventions used in R (no capital letter, underscores, hyphens or parenthesis).
4. Select all columns that contain the word ?mean? or ?std?, thus reducing the number of variables from 561 to 86. 
5. Calculate the mean for all variables divided by subject and activity.
6. Save the aggregated tidy dataset to the active directory as a tab separated text file named ?signaldata_mean.txt?




# CleaningProject
The final project for Getting and Cleaning Data

run_analysis.R will take data the data from the Samsung smartphone and:
a. merge training and test sets into one data set
b. add descriptive labels to variables
c. extract the mean (as mean()) and standard deviation (as std()) for each measurement
d. Add appropriate activity names to the data sets
e. create a second tidy data set with the mean and standard deviation for each activity

This is all assuming that the zip file is present in your working directory.
This script does use the dplyr package.

#final.txt
subject - numeric
  There were 30 subjects in the study.  This column represents the identifier for the participant.
  
activity - factor
  This was the activity that the subject was undergoing while the measurements were taken.  There are 6 activites:
  -walking
  -walking_upstairs
  -walking_downstairs
  -sitting
  -standing
  -laying
  
The remainder of the variables are numeric data type.  They are means and standard deviations (suffixed by mean() or std()) of various measurements.  This is explained in detail in the text files located within the zip file (see README.txt and features_info.txt for more details).

More information can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

*ENJOY!*

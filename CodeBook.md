# Getting and Cleaning Data Course Project Code Book

## Data Source
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Identifiers
Subject_id - The ID number of the test or trial subject ranging form 1 to 30
Activity - The type of activity performed when the corresponding measurements were taken

### Activity Labels

WALKING (value 1): subject was walking during the test
WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
SITTING (value 4): subject was sitting during the test
STANDING (value 5): subject was standing during the test
LAYING (value 6): subject was laying down during the test

## R script: 

The R script run_analysis.R does the following things:

1. Download the dataset if it does not already exist in the working directory.

Check if zip has already been downloaded in ./projectData directory?
Check if zip has already been unzipped?
List all the files of UCI HAR Dataset folder The files that will be used to load data are listed as follows: test/subject_test.txt test/X_test.txt test/y_test.txt train/subject_train.txt train/X_train.txt train/y_train.txt

2. Load the training and the test sets as well as the activity, subject and feature info. 
Read the Activity files.
Read the Subject files.
Read Features files.

3. Merges the training and the test sets to create one dataset.

4. Appropriately label the merged dataset with descriptive variable names.

5. Extracts only the measurements on the mean and standard deviation for each measurement.

6. Uses descriptive activity names to name the activities in the data set.
Read descriptive activity names from activity_labels.txt
Factorize variable activity in the data frame Data using descriptive activity names.
Appropriately labels the data set with descriptive variable names.

7. Creates a independent tidy dataset that consists of the average value of each variable for each subject and activity pair.

8. Final output file is tidydata.txt

## tidy.txt

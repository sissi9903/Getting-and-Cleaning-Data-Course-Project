# Getting and Cleaning Data Course Project Code Book

## Data Source
The row dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which is avaiable at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For detailed information about data collection and feature selection, please refer to the README and features.txt files in the original dataset.  An extract from the authors' description is reported below:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Subjects have been randomly partitioned into two sets, 70% of the volunteers were selected for generating the training data and 30% the test data. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration (tAcc-XYZ) and 3-axial angular velocity (tGyro-XYZ) were captured at a constant rate of 50Hz."

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)." 

### Original Dataset Signals
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

### Original Dataset Variables
The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

Note1: Features are normalized and bounded within [-1,1].
Note2: Each feature vector is a row on the text file.

## R script
The R script, run_analysis.R, creates the desired tidy dataset by implementing the following steps:

1. Download and unzip the source data if it does not already exist in the working directory
2. Read source data
3. Add in Test and Training dataframes Subject ID and Activity specifics as 1st and 2nd columns, respectively
4. Label the dataset with descriptive variable names
5. Extract only the measurements of the mean and standard deviation for each variable
6. Name the activities in the dataset with descriptive activity names 
7. Create an independent tidy dataset that consists of the average value of each variable for each subject and activity pair
8. Write the tidy dataset to tidy.txt file.

## Tidy Dataset
### Identifiers
- Subject_id - The ID number of the test or trial subject ranging form 1 to 30
- Activity - The type of activity performed when the corresponding measurements were taken

### Activity Labels
- WALKING (value 1): subject was walking during the test
- WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
- WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
- SITTING (value 4): subject was sitting during the test
- STANDING (value 5): subject was standing during the test
- LAYING (value 6): subject was laying down during the test

### Tidy Dataset Variables
The set of variables that were estimated in this assignment from all the original dataset signals are only:

- mean(): Mean value
- std(): Standard deviation 

The other estimates have been removed for the purpose of this project.



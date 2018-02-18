# Getting and Cleaning Data: Course Project

## Introduction 

This repository contains my work for the Getting and Cleaning Data course project, including:
- an R script (run_analysis.R) to create a tidy dataset from data collected from the accelerometers of the Samsung Galaxy S smartphone
- a code book (CodeBook.md file), providing information about row and processed data, variables and all the transformations performed to create a tidy dataset 
- the resulting tidy dataset (tidy.txt)

## R script

The R script, run_analysis.R, creates the desired tidy dataset by implementing the following steps:

1. Download and unzip the source data if it does not already exist in the working directory
2. Read source data
3. Add in Test and Training dataframes Subject ID and Activity specifics as 1st and 2nd columns, respectively
4. Label the dataset with descriptive variable names
5. Extract only the measurements on the mean and standard deviation for each variable
6. Name the activities in the dataset with descriptive activity names 
7. Create an independent tidy dataset that consists of the average value of each variable for each subject and activity pair
8. Write the tidy dataset to tidy.txt file.


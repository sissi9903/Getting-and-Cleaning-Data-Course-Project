#Load Packages
library(plyr)

# Download Data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./Dat.zip")
dateDownloaded <- date()

# Unzip Data
unzip("Dat.zip")

# Load Features info
Features <- read.table("./UCI HAR Dataset/features.txt")

# Load Test Data, Subject ID and Activity specifics 
TestX <- read.table("./UCI HAR Dataset/test/X_test.txt")
Act_Test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Sub_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load Train Data, Subject ID and Activity specifics
TrainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
Act_Train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Sub_Train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Create integer vector for Test and Train Subject IDs
Sub_id_Test <- as.vector(t(Sub_Test))
Sub_id_Train <- as.vector(t(Sub_Train))

# Convert Test and Train Activity specifics into factors
Activity_Test <- as.factor(t(Act_Test))
Activity_Train <- as.factor(t(Act_Train))

# Add as 1st and 2nd columns in Test dataframe Subject ID and Activity specifics, respectively
TestX <- cbind(Activity = Activity_Test, TestX)
TestX <- cbind(Subject_id = Sub_id_Test, TestX)

# Add as 1st and 2nd columns in Train dataframe Subject ID and Activity specifics, respectively
TrainX <- cbind(Activity = Activity_Train, TrainX)
TrainX <- cbind(Subject_id = Sub_id_Train, TrainX)

# Merge the training and the test sets to create one data set
MergedData <- merge(TrainX, TestX, all = TRUE)

MergedData <- arrange(MergedData, Subject_id)
# Label the data set with descriptive variable names
colnames(MergedData)[3: ncol(MergedData)] <- as.vector(t(Features[[2]]))

# Extract only the measurements on the mean and standard deviation for each variable
MergedData <- MergedData[ , grepl("id|Activity|mean|std" , names(MergedData))]

# Name the activities in the data set with descriptive activity names
levels(MergedData$Activity) <- c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING")

# Create an independent tidy data set with the average of each variable for each activity and each subject
TidyData <- aggregate(MergedData[3:ncol(MergedData)], by = list(Subject_id = MergedData$Subject_id, Activity = MergedData$Activity), mean)
TidyData <- arrange(TidyData, Subject_id)
# Create tidy.txt file
write.table(TidyData, "tidy.txt", row.name=FALSE, sep="\t")
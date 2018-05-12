## GETTING AND CLEANING DATA COURSE PROJECT
##
## Coursework:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
##

## Step 1: Download zip file and unzipped file

if(!file.exists("./data/UCI")){dir.create("./data/UCI")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCI/UCIData.zip")
unzip("./data/UCI/UCIData.zip", exdir = "C:/Users/Osanna/Desktop/Coursera/Course 3/data/UCI")
dataPath <- "C:/Users/Osanna/Desktop/Coursera/Course 3/data/UCI/UCI HAR Dataset"


## Step 2: Read data 

## 2.1 Read data from "activity_labels"
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

## 2.2 Read data from "features"
features <- read.table(file.path(dataPath, "features.txt"))
features[,2] <- as.character(features[,2])

## 2.3 Read data from "test" folder
testSubject <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testValues <- read.table(file.path(dataPath, "test", "X_test.txt"))
testLabel <- read.table(file.path(dataPath, "test", "y_test.txt"))

## 2.4 Read data from "train" folder
trainSubject <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainValues <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainLabel <- read.table(file.path(dataPath, "train", "y_train.txt"))


## Step 3: Merge "test" and "train" data and assign column names

## 3.1 Merge "test" and "train" datasets
test <- cbind(testSubject, testValues, testLabel)
train <- cbind(trainSubject, trainValues, trainLabel)
allData <- rbind(test, train)

## 3.2 Assign column names to "allData" (Note: total no. of col is 563)
colnames(allData) <- c("subject", features[,2], "activity")


## Step 4: Extract data that measures mean and standard deviation

colKeep <- grepl("mean|std|activity|subject", colnames(allData))
allData <- allData[, colKeep]


## Step 5: Uses descriptive activity names to name the activities in the data set

allData$activity <- factor(allData$activity, levels = activities[,1], labels = activities[,2])


## Step 6: Label data set with descriptive variable names

allDataCol <- colnames(allData)

## 6.1 Remove symbols
allDataCol <- gsub("[\\(\\)-]", "", allDataCol)

## 6.2 Expand abbreiations
allDataCol <- gsub("^f", "frequencyDomain", allDataCol)
allDataCol <- gsub("^t", "timeDomain", allDataCol)
allDataCol <- gsub("Acc", "Accelerometer", allDataCol)
allDataCol <- gsub("Gyro", "Gyroscope", allDataCol)
allDataCol <- gsub("Freq", "Frequency", allDataCol)
allDataCol <- gsub("Mag", "Magnitude", allDataCol)
allDataCol <- gsub("mean", "Mean", allDataCol)
allDataCol <- gsub("std", "StandardDeviation", allDataCol)
allDataCol <- gsub("BodyBody", "Body", allDataCol)

## 6.3 Replace col names with expanded col names
colnames(allData) <- allDataCol


## Step 7: Create a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

## 7.1 Summarise data
library(dplyr)
allDataMean <- allData %>% group_by(subject, activity) %>% summarise_all(funs(mean))

## 7.2 Export output and save file as "tidy_data.txt"
write.table(allDataMean, "tidy_data.txt", row.names = FALSE, quote = FALSE)
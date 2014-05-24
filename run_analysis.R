# To run this scrip it has to be placed in the same directry as the 
# directory "UCI HAR Dataset", containing the unzipet dataset from 
# "the Human Activity Recognition Using Smartphones Dataset Version 1.0" 


# Cleaning variable names
cleanvariablename <- function(x) {
    x <- gsub("[(]|[)]|-|","",x,)
    x <- gsub(",","to",x,)
    x <- tolower(x)
    return(x)
}

# Read the tables from the UCI HAR Dataset

# Reading in the names of the activities and the different variables that have been messured
# that are common for both the train set and the test set
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt") # names of activities
features <- read.table("UCI HAR Dataset/features.txt") # messures in the database

# Reading the train set
trainset <- read.table("UCI HAR Dataset/train/X_train.txt") # values
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt") # subjects
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt") # activities

# Building a dataframe for the train set complete with subjects, activities and colnames
names(trainset) <- as.character(features$V2) # change from factor to char
trainset <- cbind(subjecttrain, ytrain, trainset) # combine data with subject and activities
names(trainset)[1:2] <- c("subject", "activity") # set colnamnes for col 1-2

# Reading in the test set
testset <- read.table("UCI HAR Dataset/test/X_test.txt") # values
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt") # subjects
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")

# Building a dataframe for the test set complete with subjects, activities and colnames
names(testset) <- as.character(features$V2) # change from factor to char
testset <- cbind(subjecttest, ytest, testset) # combine data with subject and activities
names(testset)[1:2] <- c("subject", "activity") # set colnamnes for col 1-2

# Combining the test set and the train set to one dataframe
fullset <- rbind(testset, trainset)

names(activitylabels) <- c("activity", "activitylabel")
fullset <- merge(activitylabels, fullset) # Merge labels with readable names to the activitynumbers

# Cleaning colnames so they follow naming conventions used i R
names(fullset) <- cleanvariablename(names(fullset))

# Creating a subset containing the means and standard deviation for each messure
index <- grep("mean|std", names(fullset))
meanstdset <- fullset[, c(1:3, index)]

# Calculate means for all variables in meanstdset for all combinations of subject and activity
attach(meanstdset)
aggdata <-aggregate(meanstdset, by=list(activitylabel,subject),
                    FUN=mean, na.rm=TRUE)
detach(meanstdset)

aggdata <- aggdata[-c(2,3,4)]
names(aggdata)[1] <- "activitylabel"

# Write the aggdata to disc
write.table(aggdata, file="signaldata_mean.txt", sep="\t", col.names=NA)




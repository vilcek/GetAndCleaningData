## run_analysis.R
## Author: Alexandre Vilcek

## read features from train and test data into the X.data dataframe
X.data <- read.table("./train/X_train.txt")
X.data <- rbind(X.data, read.table("./test/X_test.txt"))

## read activity data from train and test data into the y.data dataframe
y.data <- read.table("./train/y_train.txt")
y.data <- rbind(y.data, read.table("./test/y_test.txt"))

## read subject data from train and test data into the subject.data dataframe
subject.data <- read.table("./train/subject_train.txt")
subject.data <- rbind(subject.data, read.table("./test/subject_test.txt"))

## read activity labels into the activities dataframe
activities <- read.table("activity_labels.txt")

## read feature data into the features dataframe
features <- read.table("features.txt")

## rename activity labels according to the naming convention "activityName"
activities$V2 <- tolower(activities$V2)
activities$V2 <- gsub("([[:punct:]])([[:alpha:]])", "\\1\\U\\2", activities$V2, perl=T)
activities$V2 <- gsub("([[:punct:]])", "", activities$V2)

## find feature names containing "mean()" and "std()" and get them into the feature.names vector
feature.index <- c(grep("mean()", features[,2], fixed=T), grep("std()", features[,2], fixed=T))
feature.names <- as.character(features[feature.index,2])

## normalize the content in feature.names according to the naming convention "variable.name"
## from_prefixes vector holds original parts of feature names to be modified
## to_prefixes vector holds the corresponding modifications to be made
from.prefixes <- c("BodyBody","Body","Gravity","Acc","Gyro","Jerk","Mag","-mean()","-std()","-X","-Y","-Z")
to.prefixes <- c(".body",".body",".gravity",".acc",".gyro",".jerk",".mag",".mean",".std",".x",".y",".z")
for(i in 1:length(from.prefixes)) {
  feature.names <- gsub(from.prefixes[i], to.prefixes[i], feature.names,fixed=T)
}

## build the tidy.data dataframe by appending both subjects (subject.data) and activities (y.data) to the left of the features (X.data) dataframe
## from the X.data dataframe, pick only the features whose position is given by the feature.index vector
tidy.data <- cbind(subject.data, y.data, X.data[,feature.index])

## rename the variables in tidy.data using "subject" for the subject data, "activity" for the activity labes, and the values in feature.names for the features
names(tidy.data) <- c("subject","activity",feature.names)

## build the tidy.data.mean dataframe containing the mean of all features, aggregated by activity and subject
attach(tidy.data)
tidy.data.mean <- aggregate(tidy.data, by=list(activity,subject), FUN=mean, na.rm=T)[,c(-1,-2)]

## rearrange the columns in tidy.data.mean in alphabetical order, except for "subject" and "activity"
order.index <- order(names(tidy.data.mean)[c(-1,-2)]) + 2
tidy.data.mean <- cbind(tidy.data.mean[,1:2], tidy.data.mean[,order.index])

## replace activity numbers in tidy.data.mean by their respective labels as in activities dataframe
tidy.data.mean$activity <- sapply(tidy.data.mean$activity, function(x) gsub(x, activities[x,2], tidy.data.mean$activity[x]))

## save tidy.data.mean to a file named "tidy_data_mean.csv" in the working directory
write.csv(tidy.data.mean, file="tidy_data_mean.csv")

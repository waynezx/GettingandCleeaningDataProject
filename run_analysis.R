#download and unzip the dataset
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./DataUCI/DataUCI.zip", method="curl")
unzip ("DataUCI.zip", exdir = "./dataUCI")

#step 1 Import the data file
subtest <- read.table("./dataUCI/UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./dataUCI/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./dataUCI/UCI HAR Dataset/test/y_test.txt")
subtrain <- read.table("./dataUCI/UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./dataUCI/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./dataUCI/UCI HAR Dataset/train/y_train.txt")
features <- read.table("./dataUCI/UCI HAR Dataset/features.txt", head=FALSE)
activity <- read.table("./dataUCI/UCI HAR Dataset/activity_labels.txt")

#conbine data
dataSubject <- rbind(subtrain, subtest)
data_y<- rbind(ytrain, ytest)
data_x<- rbind(xtrain, xtest)

# step 2 Extracts only the measurements on the mean and standard deviation for each measurement.

features_mean_std <- grep ("-(mean|std)\\(\\)", features[,2])

#set names to variables

data_x <- data_x[,features_mean_std]
names(data_x) <- features[features_mean_std,2]

# step 3 Use descriptive activity names to name the activities in the data set
data_y[, 1] <- activity[data_y[, 1], 2]
names(data_y) <- "activity"

#merge columns
data1 <- cbind(dataSubject, dataActivity)
Datatotal <- cbind(dataFeatures, data1)


# step 4 Appropriately label the data set with descriptive variable names
names(dataSubject) <- "subject"

# merge all the data into one single data set
finaldata <- cbind(data_x, data_y, dataSubject)

#step 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
Datatidy<-aggregate(. ~subject + activity, finaldata, mean)

write.table(Datatidy, file = "Datatidy.txt",row.name=FALSE)


##run_analysis.R will take data the data from the Samsung smartphone and:
##a. merge training and test sets into one data set
##b. add descriptive labels to variables
##c. extract the mean (as mean()) and standard deviation (as std()) for each measurement
##d. Add appropriate activity names to the data sets
##e. create a second tidy data set with the mean and standard deviation for each activity

#Only the zip file needs to be in the working directory

##Pull in the data from the zip file, assuming it's in the working directory

zipfile <- "getdata-projectfiles-UCI HAR Dataset.zip"
##get the lables
activities <- read.table(unz(zipfile, "UCI HAR Dataset/activity_labels.txt"))
features <- read.table(unz(zipfile, "UCI HAR Dataset/features.txt"))
##get the people
trainsubs <- read.table(unz(zipfile, "UCI HAR Dataset/train/subject_train.txt"))
testsubs <-  read.table(unz(zipfile, "UCI HAR Dataset/test/subject_test.txt"))
##Training Data
x_train <- read.table(unz(zipfile, "UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(unz(zipfile, "UCI HAR Dataset/train/y_train.txt"))
##Testing data
x_test <- read.table(unz(zipfile, "UCI HAR Dataset/test/X_test.txt"))
y_test <- read.table(unz(zipfile, "UCI HAR Dataset/test/y_test.txt"))

##a. combine test and data sets
data <- rbind(x_test, x_train)
train <- cbind(trainsubs, y_train)
test <- cbind(testsubs, y_test)
ids <- rbind(test, train)

##b. add lables to variables
names(data) <- features$V2

##c. extract the mean and standard deviation
cols1 <- grep("mean()", names(data), fixed=TRUE)
cols2 <- grep("std()", names(data), fixed=TRUE)
my_cols <- sort(c(cols1, cols2))
final <- data[,my_cols]

##d. add activity names
suppressWarnings(ids <- merge(ids, activities, by.x=2, by.y=1))
ids <- ids[,2:3]
colnames(ids) <- c("subject", "activity")
final <- cbind(ids, final)
#sort it up a bit
library(dplyr)
final <- arrange(final, subject, activity)
##write out full table
write.table(final, "final.csv", sep = ",", row.name=FALSE)

##e. summarize data
mylist <- names(final[,3:68])
finalSum <- aggregate(final[mylist], by=final[c("subject", "activity")], FUN=mean)
write.table(finalSum, "finalSum.csv", sep=",", row.name=FALSE)


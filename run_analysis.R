###### R code for "Getting and Cleaning Data" Project
###### Christopher Claassen


# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)

# Get data

setwd("/Users/christopherclaassen/Documents/Online courses/Coursera, Getting and Cleaning Data/UCI HAR Dataset")

x.train <- data.table(read.table("train/X_train.txt"))
y.train <- data.table(read.table("train/y_train.txt"))
subject.train <- data.table(read.table("train/subject_train.txt"))

x.test <- data.table(read.table("test/X_test.txt"))
y.test <- data.table(read.table("test/y_test.txt"))
subject.test <- data.table(read.table("test/subject_test.txt"))

features <- as.character(read.table("features.txt")[,2])
activity.labels <- as.character(read.table("activity_labels.txt")[,2])

# Name variables

setnames(x.train, features) 
setnames(x.test, features)
setnames(subject.train, "subjects")
setnames(subject.test, "subjects")
setnames(y.test, "activity")
setnames(y.train, "activity")

# Merge datasets

train <- x.train
train$subjects <- subject.train
train$activity <- y.train

test <- x.test
test$subjects <- subject.test
test$activity <- y.test

data <- data.frame(rbind(train, test))

rm(x.train, x.test, test, train) # remove junk

# Select relevant variables

dat2 <- data[, c(562, 563, grep("mean|std", names(data))) ]
dat2 <- dat2[ , - c(grep("meanFreq", names(dat2))) ]

rm(data) # remove junk

# Rename variables

varnam <- names(dat2)

varnam <- gsub("...", "", varnam, fixed = TRUE)
varnam <- gsub("..", "", varnam, fixed = TRUE)
varnam <- gsub(".", "", varnam, fixed = TRUE)
varnam <- gsub("^t", "time.", varnam)
varnam <- gsub("^f", "freq.", varnam)
varnam <- gsub("Body", "body.", varnam)
varnam <- gsub("Gravity", "gravity.", varnam)
varnam <- gsub("Jerk", "jerk.", varnam)
varnam <- gsub("Acc", "accel.", varnam)
varnam <- gsub("Gyro", "gyrom.", varnam)
varnam <- gsub("Mag", "magnit.", varnam)
varnam <- gsub("std", "stdev", varnam)
varnam <- gsub("Y$", ".dimy", varnam)
varnam <- gsub("X$", ".dimx", varnam)
varnam <- gsub("Z$", ".dimz", varnam)
varnam <- gsub("body.body", "body", varnam, fixed = TRUE)

setnames(dat2, varnam)

# Label activities

dat2$activity <- factor(dat2$activity, labels = activity.labels)

# Create new dataset with means by subject and activity

sub.new <- rep(1:30, times = 6)
act.new <- rep(1:6, each = 30)
new.dat <- matrix(NA, ncol = 68, nrow = 180)
new.dat[ ,1:2] <- cbind(sub.new, act.new)
for (i in 3:68) {
  new.dat[,i] <- as.vector(by(dat2[,i], INDICES = list(dat2$subjects, dat2$activity), FUN = mean))
}

new.dat <- data.frame(new.dat)
setnames(new.dat, varnam)
new.dat$activity <- factor(new.dat$activity, labels = activity.labels)

# Write data

write.table(new.dat, "project_data.txt", row.name = FALSE)



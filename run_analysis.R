# Install library pylr and data.table

install.packages("plyr")

install.packages("data.table")

# Load library pylr and data.table

library("plyr")

library("data.table")

# Create URL location

dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download file to working directory

download.file(dataset_url, "UCI_HAR_Dataset.zip")

# Unzip file to folder

unzip("UCI_HAR_Dataset.zip", exdir = "UCI_HAR_Dataset")

# Read activity_labels.txt

activity_labels <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/activity_labels.txt")

# Add names "activity_id" and "activity_name"  to activity_labels

names(activity_labels) <- c("activity_id","activity_name")

# Read subject_test.txt

subject_test <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/test/subject_test.txt")

# Add name "Subject_id" to subject_test

names(subject_test) <- c("Subject_id")

# Read X_test.txt

X_test <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/test/X_test.txt")

# Add features.txt as names to X_test

names(X_test) <- features$V2

# Find pattern matching std and mean

names_combine_1 <- grepl("mean|std", names(X_test))

# Subset X_test using names_combine

X_test <- X_test[,names_combine_1]

# Read y_test.txt

y_test <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/test/y_test.txt")

# Add name "activity_id" to y_test.txt

names(y_test) <- c("activity_id")

# Read subject_train.txt

subject_train <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/train/subject_train.txt")

# Add name "Subject_id" to subject_train

names(subject_train) <- c("Subject_id")

# Read X_train.txt

X_train <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/train/X_train.txt")

# Add features.txt as names to X_train

names(X_train) <- features$V2

# Find pattern matching std and mean

names_combine_2 <- grepl("mean|std", names(X_train))

# Subset X_test using names_combine

X_train <- X_train[,names_combine_2]

# Read y_train.txt

y_train <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/train/y_train.txt")

# Add name "activity_id" to y_train.txt

names(y_train) <- c("activity_id")

# Read features.txt

features <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/features.txt")

# Coloumn bind test datasets

test_bind <- cbind(subject_test,X_test,y_test)

# Coloumn bind train datasets

train_bind <- cbind(subject_train,X_train,y_train)

# Row bind test_bind and train_bind datasets

combine <- rbind(test_bind,train_bind)

# Making activity_id numeric

combine$activity_id <- as.numeric(combine$activity_id)

activity_labels$activity_id <- as.numeric (activity_labels$activity_id)

# Making subject_id and activity_name as factors

combine$activity_name <- as.factor(combine$activity_name)

combine$Subject_id <- as.factor(combine$activity_id)

# Merge activity labels with combine

combine <- merge(combine, activity_labels,by.x="activity_id")

# Covert combine into data.table

combine <-  data.table(combine)

# Create mean of the combine data.table

data_tidy <- aggregate(. ~Subject_id + activity_name, combine, mean)

# Order data_tidy by Subject_id and activity_name

data_tidy <- data_tidy[order(data_tidy$Subject_id,data_tidy$activity_name),]

# Export out data_tidy 

write.table(data_tidy, file = "data_tidy.txt", row.names = FALSE)












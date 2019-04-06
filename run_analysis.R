#-------------------------------------------------------
#Step 0. Set library, downloading and unzipping dataset
#-------------------------------------------------------

# 0.1 Set library and define directory

# 0.1.1. Set library
library(data.table)
library(dplyr)
library(tidyr)

# 0.1.2 Define work directory
setwd("D:\\1.Education\\1.R\\2.R_Coursera\\3_Getting_and_Cleaning_Data\\Exam")


# 0.1.3 Create data folder
if(!file.exists("./data")){dir.create("./data")}

# 0.2 Download data and save it into data directory

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#0.3 Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")



#-----------------------------------------------------------
#Step 1. Merges the training and the test sets to create one data set
#-----------------------------------------------------------

# 1.1 Read train/test/features/activity_labels data

# 1.1.1  Read train tables:

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")


# 1.1.2 Read test tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 Read feature vector and remove special character from column V2
features <- read.table('./data/UCI HAR Dataset/features.txt', stringsAsFactors = FALSE)
features$V2<-gsub('[()]', '', features$V2)
features$V2<-gsub('-', '_', features$V2)


# 1.1.4 Read activity labels:
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt',  stringsAsFactors = FALSE)



#1.3 Merge all data in one dataset:

colnames(y_train) <-"activity_id"
colnames(y_test) <- "activity_id"
colnames(subject_train) <- "subject_id"
colnames(subject_test) <- "subject_id"

train<-cbind(x_train, y_train,subject_train )
test<-cbind(x_test, y_test,subject_test )

UCI_HAR <- rbind(train, test)


str(UCI_HAR)
dim(UCI_HAR)


#----------------------------------------------------------------------------
#Step 2. Extracts only the measurements on the mean and standard 
#       deviation for each measurement.
#----------------------------------------------------------------------------


#2.1 Create vector for defining variable with mean and standard deviation labels
selectVar_features <- grepl(".*mean.*|.*std.*",features$V2)
table(selectVar_features)

# 2.3 Keep only the columns identified in the previous step
UCI_HAR_Mean_Std <- UCI_HAR[ , selectVar_features == TRUE]



#----------------------------------------------------------------------------------
#Step 3. Uses descriptive activity names to name the activities in the data set
#----------------------------------------------------------------------------------

colnames(activity_labels) <- c('activity_id','activity_type')

UCI_HAR_Mean_Std <- merge(UCI_HAR_Mean_Std, activity_labels,
                              by='activity_id',
                              all.x=TRUE)


#--------------------------------------------------------------------------------------------------
#Step 4. Appropriately labels the data set with descriptive variable names.
#        
#--------------------------------------------------------------------------------------------------


features_mean_std <-features[grepl(".*mean.*|.*std.*",features$V2),]

colnames(UCI_HAR_Mean_Std)[2:(ncol(UCI_HAR_Mean_Std)-2)] <- features_mean_std$V2


#------------------------------------------------------------------------------
#Step 5. Creating a second, independent tidy data set with the average of each 
#        variable for each activity and each subject
#------------------------------------------------------------------------------

# 5.1 Make second tidy data set: tidy_data
tidy_data <- UCI_HAR_Mean_Std %>%
             group_by(subject_id,activity_id, activity_type) %>%
             summarise_each(funs(if(is.numeric(.)) mean(., na.rm = TRUE) else first(.))) 

#5.2 Write tidy_data in txt file

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)




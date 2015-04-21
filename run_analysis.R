##  function run_analysis reads and merges the training and test data sets, computes and 
##    creates a tidy data set

##  Due to memory limitations, extracting only the first 40 columns of X_train and X_test

run_analysis <- function() {
    ## read the training data
    subject_train <- read.fwf(".\\UCI HAR Dataset\\train\\subject_train.txt", widths = c(2))
    x_train <- read.fwf(".\\UCI HAR Dataset\\train\\X_train.txt", widths = rep(16, 40))
    y_train <- read.fwf(".\\UCI HAR Dataset\\train\\Y_train.txt", widths = c(2))
    
    ## read the test data
    subject_test <- read.fwf(".\\UCI HAR Dataset\\test\\subject_test.txt", widths = c(2))
    x_test <- read.fwf(".\\UCI HAR Dataset\\test\\X_test.txt", widths = rep(16, 40))
    y_test <- read.fwf(".\\UCI HAR Dataset\\test\\Y_test.txt", widths = c(2))
    
    ## use descriptive activity names to name the activities
    activity_labels <- read.fwf(".\\UCI HAR Dataset\\activity_labels.txt", width = c(2, 25))
    y_train <- merge(y_train, activity_labels, x.by = y_train$V1, y.by = activity_labels$V1)
    y_test <- merge(y_test, activity_labels, x.by = y_test$V1, y.by = activity_labels$V1)
    rm(activity_labels)
    
    ## merge the data sets
    subject_merged <- rbind(subject_train, subject_test)
    x_merged <- rbind(x_train, x_test)
    y_merged <- rbind(y_train, y_test)
    rm("subject_train")
    rm("x_train")
    rm("y_train")
    rm("subject_test")
    rm("x_test")
    rm("y_test")
    
    ## extract measurements on mean and standard deviation for each measurement
    data <- cbind(subject_merged, x_merged[, 1:6], y_merged[, 2])
    rm(subject_merged)
    rm(x_merged)
    rm(y_merged)

    ## name the data set with variable names
    colnames(data) <- c("Subject", 
                        "BodyAcc_Mean_X", 
                        "BodyAcc_Mean_Y", 
                        "BodyAcc_Mean_Z", 
                        "BodyAcc_STD_X", 
                        "BodyAcc_STD_Y", 
                        "BodyAcc_STD_Z", 
                        "ActivityDescription")
  
    ## create tidy data set
    tidydata <- aggregate(data[, 2:7], list(data$Subject, data$ActivityDescription), mean)
    colnames(tidydata) <- c("Subject", 
                        "ActivityDescription", 
                        "BodyAcc_Mean_X", 
                        "BodyAcc_Mean_Y", 
                        "BodyAcc_Mean_Z", 
                        "BodyAcc_STD_X", 
                        "BodyAcc_STD_Y", 
                        "BodyAcc_STD_Z")

    tidydata
    
}

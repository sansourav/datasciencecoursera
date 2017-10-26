## Task 1
## import Test Value
Xtest <- 
  read.table("/UCI HAR Dataset/test/X_test.txt")
Ytest <- 
  read.table("/UCI HAR Dataset/test/y_test.txt")
Subtest <- 
  read.table("/UCI HAR Dataset/test/subject_test.txt")


## Import Train Values 
Xtrain <- 
  read.table("/UCI HAR Dataset/train/X_train.txt")
Ytrain <- 
  read.table("/UCI HAR Dataset/train/y_train.txt")
Subtrain <- 
  read.table("/UCI HAR Dataset/train/subject_train.txt")

## Merge test and train sets  

XFull <- rbind(Xtest,Xtrain)
YFull <- rbind(Ytest,Ytrain)
SubFull <- rbind(Subtest, Subtrain)


#Import features for Column Names

features <- 
  read.table("/UCI HAR Dataset/features.txt")

colnames(XFull) <- features[,2]
## Check for correct update 

head(XFull)

## select columns with names Mean and Std

#Create a logical vector to check which column names contain"mean()" or "std()"
col <- grepl("mean()",colnames(XFull)) | grepl("std()",colnames(XFull))

# select columns where logical vector is TRUE

XMeanSd <- XFull[,col]


# checking if previous step was successful

head(XMeanSd)

#import activity table
act <- 
  read.table("/UCI HAR Dataset/activity_labels.txt")

## checking Y data
str(YFull)

## Making factor of Y

Yfact <- as.factor(YFull[,1])

# checking for success
str(Yfact) ## result - factor with 6 levels.

# installing plyr package
#install.packages("plyr")

## loading the plyr package
library(plyr)

## updating Yfact with activity names from data table act

Yfact <- mapvalues(Yfact, from = as.character(act[,1]),to = as.character(act[,2]))

## checking success of previous step 



str(Yfact)
head(Yfact)
length(Yfact)

## adding column from Yfact to XMeansd 

XMeanSd <- cbind(Yfact,XMeanSd)

# checking if it worked 

head(XMeanSd) ## it did !!!

## changing name of Column name from Yfact too Activity

colnames(XMeanSd)[1] <- "Activity"

## inserting subject id on XMeanSd

XMeanSd <- cbind(SubFull,XMeanSd)
 #check for success 
head(XMeanSd)
# rename column 1 to Subject
colnames(XMeanSd)[1] <- "subject"

## check ## View(XMeanSd)

## Last step - Create tidy data 

## load package reshape
library(reshape2)



xms <- melt(XMeanSd, id.vars = c("subject","Activity"))
tidydata <- dcast(xms, subject + Activity ~ variable, mean)

# write the tidy data into a file called tidy data

write.table(tidydata,"tidydata.txt", row.names = F, quote = F)


## 


##This function uses the UCI HAR dataset. A data set that measures the accelleromiter data from Samsung Cellphones of people performing common tasks. It turns the disparate sets into a single set, 
## renames key columns such that they are easier to understand, and then returns a tidy data set of descriptive statistics related to the mean and standard deviation of the raw data.
## In order to run this function please download the data set from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## Unzip and make the folder UCI HAR Dataset your working directory.

## Step 1: Read In Data 
Xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subTest <- read.table("./test/subject_test.txt")
Xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
subTrain <- read.table("./train/subject_train.txt")
features <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")

## Step 2: Merge data sets
testBind <- cbind(subTest, ytest, Xtest)
trainBind <- cbind(subTrain, ytrain, Xtrain)
fullBind <- rbind(testBind, trainBind)


## Step 3: Name the measurement columns after the feature names, and give names to the id columns
features <- as.character(features[,2])
newCols <- c("subject", "activity", features)
colnames(fullBind) <- newCols

# 4. Create a new data frame whose measurement columns contain only mean and st. dev features

onlyMeans <- grep("mean()", colnames(fullBind))
onlyStDevs <- grep("std()", colnames(fullBind))
revisedColumns <- c(onlyMeans, onlyStDevs)
revisedColumns2 <- sort(revisedColumns) 
newDataFrame <- fullBind[, c(1,2,revisedColumns2)]
newDataFrame2 <- newDataFrame[, !grepl("Freq", colnames(newDataFrame))] #get rid of the meanFreq columns

# 5. Trim the rows to the 180 needed to show mean values for each subject-activity pair
tidyframe <- data.frame()
for (i in 1:30) {
  subj<- subset(newDataFrame2,subject==i)
  for (j in 1:6){
    actv<- subset(subj, activity==j)
    myresult<-as.vector(apply(actv,2,mean))
    tidyframe<-rbind(tidyframe,myresult) 
  }
  
}

# 6. Rename to follow rules of tidy data and output the data to "Samsung_Data.txt"
colnames(tidyframe)<-colnames(newDataFrame2) #rename the columns again, as the names get lost in the mix above
levels(tidyframe[,2])<-c('walk','upstairswalk','downstairswalk', 'sit','stand', 'lay')
write.table(tidyframe, "Samsung_Data.txt", sep = "")

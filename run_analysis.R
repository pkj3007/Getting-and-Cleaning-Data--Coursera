## considering zip file is downloaded and saved under working directory
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

## test data:
TestX<- read.table("UCI HAR Dataset/test/X_test.txt")
TestY<- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")

## train data:
TrainX<- read.table("UCI HAR Dataset/train/X_train.txt")
TrainY<- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")

## Features and Activity
Features<-read.table("UCI HAR Dataset/features.txt")
Activity<-read.table("UCI HAR Dataset/activity_labels.txt")

##Part1 - merges train and test data in one dataset (full dataset at the end)
X<-rbind(TestX, TrainX)
Y<-rbind(TestY, TrainY)
Subject<-rbind(SubjectTest, SubjectTrain)

##checking dimensions
dim(X)
dim(Y)
dim(Subject)

##Part2 - 
index<-grep("mean\\(\\)|std\\(\\)", Features[,2]) ##getting features indices which contain mean() and std() in their name
length(index) ## count of features

X<-X[,index] ## getting only variables with mean/st-dev
dim(X) ## checking dim of subset 

##Part3 -
Y[,1]<-activity[Y[,1],2] ## replacing numeric values with lookup value from activity.txt; won't reorder Y set
head(Y)

#Part4 - 
names<-Features[index,2] ## getting names for variables

names(X)<-names ## updating colNames for new dataset
names(Subject)<-"SubjectID"
names(Y)<-"Activity"

cleanseddata<-cbind(Subject, Y, X)
head(cleanseddata[,c(1:5)]) ## first 5 columns

##Part5 - 
cleanseddata<-data.table(cleanseddata)
tidydata <- cleanseddata[, lapply(.SD, mean), by = 'SubjectID,Activity'] ## features average by Subject and by activity
dim(tidydata)

write.table(tidydata, file = "Tidy.txt", row.names = FALSE)

head(tidydata[order(SubjectID)][,c(1:5), with = FALSE],12) 


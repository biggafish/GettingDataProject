#install the plyr & reshape packages.
install.packages("plyr")
install.packages("reshape2")
library("plyr")
library("reshape2")


#enter the root directory location of the data into the datadir string variable#
datadir<-"C:/Rdata/GettingData/projectfiles/UCI"
setwd(datadir)

#import features & labels
features<-read.table("features.txt")
activities<-read.table("activity_labels.txt")
#extract only the columns that are means and standard deviations of measurements, exluding meanfreq() function
meanStd<-grepl("mean..(-[XYZ])?$|std..(-[XYZ])?$",features$V2)
meanStdfeat<-features[meanStd,]

#change the working directory to the train subfolder
wd<-paste(datadir, "/train", sep = "")
setwd(wd)

#import training data
subject_train<-read.table("subject_train.txt")
y_train<-read.table("Y_train.txt")
x_train<-read.table("X_train.txt")

#change the working directory to the test subfolder
wd<-paste(datadir, "/test", sep = "")
setwd(wd)

#import test data
subject_test<-read.table("subject_test.txt")
y_test<-read.table("y_test.txt")
x_test<-read.table("X_test.txt")


#rename the sole column in subject tables as subjectID
subject_train<-rename(subject_train,c("V1"="subjectID"))
subject_test<-rename(subject_test,c("V1"="subjectID"))

#rename the sole column in Y value tables as activityID
y_train<-rename(y_train,c("V1"="activityID"))
y_test<-rename(y_test,c("V1"="activityID"))

#select only the columns that are mean and standard deviation measurements 
#excluding meanfreq() about which it seems un
x_train<-x_train[meanStdfeat$V1]
x_test<-x_test[meanStdfeat$V1]

#rename the columns as listed in features.txt
names(x_train)<-meanStdfeat$V2
names(x_test)<-meanStdfeat$V2

#combine tables,x,y and, subject
c_train<-cbind(subject_train,y_train,x_train)
c_test<-cbind(subject_test,y_test,x_test)

#put together training and test data
combined<-rbind(c_train,c_test)

# update data values in combined data set, so that activity ID is now,a 
# description of the activity rather than an integer.

combined$activityID<-as.character(activities$V2)[ match(combined$activityID,
                                                        activities$V1)]

#melt the combined data frame, keeping subjectID and activityID as id variables.
melt1<-melt(combined,c("subjectID","activityID"))

#cast the data frame into the required summary 
summary<-dcast(melt1,subjectID + activityID ~ variable, mean)

#export tidy summary data table to CSV.
write.csv(summary,"TidySummaryData.csv")

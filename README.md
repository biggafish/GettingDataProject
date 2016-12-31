
## README

**Testing the run_analysis.R file**
please ensure the below has been completed before trying to run the run_analysis.R file

1. ensure the project data has been downloaded and unzipped.

2. set the *datadir* variable in the run_analysis.R file to the correct location of the downloaded data.  

3. ensure that the plyr and reshape2 packages have been installed and loaded.

**Introduction**

This file explains the methods I have used to produce the tidy data set requested in the project instructions.

The three interrelated rules which make a dataset tidy are listed below*:

1. Each variable must have its own column

2. Each observation must have its own row

3. Each value must have its own cell.

*- Ref: R for Data Science by Hadley Wickham [website](http://r4ds.had.co.nz/),

The uploaded file *TidySummaryData.csv* created by the script run_analysis.R adheres to these rules by keeping all variables in seperate columns and observations in seperate rows. The format of this table is known as a wide form of tidy data. 

Please see the seperate codebook.md for a full description on the contents of the uploaded file *TidySummaryData.csv* .

To read the file into R and view it please use the below code snippet:

```
data<-read.table(filepath,header = TRUE,sep =",")
View(data)
```
Thw inclusion of this code snippet is derived from and inspired by the David Hoods advice notes on the Getting and Cleaning course Project as referenced and linked to in the discussion forums in week 4. This page was hugely helpful in understanding tidy data and assisting with this project assignment.

**Code Description**

The first part of the script sets the correct working directory, this piece of code will need updating to the correct local directory.
```
#enter the root directory location of the data into the datadir string variable
datadir<-"C:/Rdata/GettingData/projectfiles/UCI"
setwd(datadir)
```
Next the features and labels were imported using the below code

```{import}
#import features & labels
features<-read.table("features.txt")
activities<-read.table("activity_labels.txt")
```

at this point a datframe meanStdFeat was created to store only the measurements that are required by the instructions. There seemed to be some ambiguity about which features to include in this assignement, the explanation for my selection is as below:

My interpretation of the instructions was to include the *mean()* and *std()* evaluations of the time and frequency domain variables. The *meanfreq()* features were exlcuded as these were described as weighted averages in the **features_info.txt** rather than a standard mean, also there was not a paired std() feature. The same goes for the additional vectors applied to the angle() variable which were also excluded. this gave 66 measurement features. 
A Regular expression was used in combination with the *grepl* function to select the only the required features, the index columns and names were stored in the *meanStdfeat* dataframe. 

```{extract}
#extract only the columns that are means and standard deviations of measurements
meanStd<-grepl("mean..(-[XYZ])?$|std..(-[XYZ])?$",features$V2)
meanStdfeat<-features[meanStd,]
```

The training and Test data was loaded into R

```
#import training data
subject_train<-read.table("subject_train.txt")
y_train<-read.table("Y_train.txt")
x_train<-read.table("X_train.txt")

#import test data
subject_test<-read.table("subject_test.txt")
y_test<-read.table("y_test.txt")
x_test<-read.table("X_test.txt")
```
The column names on the imported data were set, and only the columns matching those located in *meanStdfeat* as above were kept

```
#rename the sole column in subject tables as subjectID
subject_train<-rename(subject_train,c("V1"="subjectID"))
subject_test<-rename(subject_test,c("V1"="subjectID"))

#rename the sole column in Y value tables as activityID
y_train<-rename(y_train,c("V1"="activityID"))
y_test<-rename(y_test,c("V1"="activityID"))

#keep only the columns that are mean and standard deviation measurements as stored in meanStdfeat 
x_train<-x_train[meanStdfeat$V1]
x_test<-x_test[meanStdfeat$V1]

#rename the columns as listed in features.txt
names(x_train)<-meanStdfeat$V2
names(x_test)<-meanStdfeat$V2
```

The imported data frames were combined using *rbind* and *cbind* as below:

```
#combine tables,x,y and, subject
c_train<-cbind(subject_train,y_train,x_train)
c_test<-cbind(subject_test,y_test,x_test)

#put together training and test data
combined<-rbind(c_train,c_test)
```

The *activityID* field was then updated with descriptive activity names as instructions point 3.

```
# update data values in combined data set, so that activity ID is now,a 
# description of the activity rather than an integer.
combined$activityID<-as.character(activities$V2)[ match(combined$activityID,
                                                        activities$V1)]
```
A second independent data set called *summary* was created by melting the combined data frame and casting it into the required format using the below commands

```
#melt the combined data frame, keeping subjectID and activityID as id variables.
melt1<-melt(combined,c("subjectID","activityID"))

#cast the data frame into the required summary 
summary<-dcast(melt1,subjectID + activityID ~ variable, mean)
```
This was then exported using the below commands:

```
#export tidy summary data table to CSV.
write.table(summary,file = "TidySummaryData.csv",row.name=FALSE,sep = ",")
```

End of ReadMe file

##Code Book for Getting and Cleaning Data course project

---
title: "Getting Data Project"
author: "Tim Jones"
date: "30 December 2016"
output: html_document
---

### Original feature codebook 
Human Activity Recognition Using Smartphones Data Set 
Download: Data Folder, Data Set Description
Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Data Description | Values
---|---
Data Set Characteristics| Multivariate, Time-Series
Number of Instances| 10299
Area| Computer
Attribute Characteristics| N/A
Number of Attributes| 561
Date Donated| 2012-12-10
Associated Tasks| Classification, Clustering
Missing Values? | N/A
Number of Web Hits| 430870

**Source:**
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 

**Data Set Information:**
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]

An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows. 

**Attribute Information:**
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. 

Relevant Papers:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care. Volume 19, Issue 9. May 2013

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Català. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 


Citation Request:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

## Original details of Features

**Feature Selection** 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

Variable name  |  Description
---  |  ---
mean()| Mean value
std()| Standard deviation
mad()| Median absolute deviation 
max()| Largest value in array
min()| Smallest value in array
sma()| Signal magnitude area
energy()| Energy measure. Sum of the squares divided by the number of values. 
iqr()| Interquartile range 
entropy()| Signal entropy
arCoeff()| Autorregresion coefficients with Burg order equal to 4
correlation()| correlation coefficient between two signals
maxInds()| index of the frequency component with largest magnitude
meanFreq()| Weighted average of the frequency components to obtain a mean frequency
skewness()| skewness of the frequency domain signal 
kurtosis()| kurtosis of the frequency domain signal 
bandsEnergy()| Energy of a frequency interval within the 64 bins of the FFT of each window.
angle()| Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


##Exported summary data table 

Details of the exported data table as uploaded file TidySummaryData.csv are below:


Column Name | Class | notes
--- | --- | ---
subjectID | integer | ID of the volunteer subject range is 1-30
activityID | character | Description of the activity, there are 6 activities in total
tBodyAcc-mean()-X | numeric  | mean value of the accelerometer feature data
tBodyAcc-mean()-Y | numeric  | mean value of the accelerometer feature data
tBodyAcc-mean()-Z | numeric  | mean value of the accelerometer feature data
tBodyAcc-std()-X | numeric  | mean value of the accelerometer feature data
tBodyAcc-std()-Y | numeric  | mean value of the accelerometer feature data
tBodyAcc-std()-Z | numeric  | mean value of the accelerometer feature data
tGravityAcc-mean()-X | numeric  | mean value of the accelerometer feature data
tGravityAcc-mean()-Y | numeric  | mean value of the accelerometer feature data
tGravityAcc-mean()-Z | numeric  | mean value of the accelerometer feature data
tGravityAcc-std()-X | numeric  | mean value of the accelerometer feature data
tGravityAcc-std()-Y | numeric  | mean value of the accelerometer feature data
tGravityAcc-std()-Z | numeric  | mean value of the accelerometer feature data
tBodyAccJerk-mean()-X | numeric  | mean value of the accelerometer feature data
tBodyAccJerk-mean()-Y | numeric  | mean value of the accelerometer feature data
tBodyAccJerk-mean()-Z | numeric  | mean value of the accelerometer feature data
tBodyAccJerk-std()-X | numeric  | mean value of the accelerometer feature data
tBodyAccJerk-std()-Y | numeric  | mean value of the accelerometer feature data
tBodyAccJerk-std()-Z | numeric  | mean value of the accelerometer feature data
tBodyGyro-mean()-X | numeric  | mean value of the accelerometer feature data
tBodyGyro-mean()-Y | numeric  | mean value of the accelerometer feature data
tBodyGyro-mean()-Z | numeric  | mean value of the accelerometer feature data
tBodyGyro-std()-X | numeric  | mean value of the accelerometer feature data
tBodyGyro-std()-Y | numeric  | mean value of the accelerometer feature data
tBodyGyro-std()-Z | numeric  | mean value of the accelerometer feature data
tBodyGyroJerk-mean()-X | numeric  | mean value of the accelerometer feature data
tBodyGyroJerk-mean()-Y | numeric  | mean value of the accelerometer feature data
tBodyGyroJerk-mean()-Z | numeric  | mean value of the accelerometer feature data
tBodyGyroJerk-std()-X | numeric  | mean value of the accelerometer feature data
tBodyGyroJerk-std()-Y | numeric  | mean value of the accelerometer feature data
tBodyGyroJerk-std()-Z | numeric  | mean value of the accelerometer feature data
tBodyAccMag-mean() | numeric  | mean value of the accelerometer feature data
tBodyAccMag-std() | numeric  | mean value of the accelerometer feature data
tGravityAccMag-mean() | numeric  | mean value of the accelerometer feature data
tGravityAccMag-std() | numeric  | mean value of the accelerometer feature data
tBodyAccJerkMag-mean() | numeric  | mean value of the accelerometer feature data
tBodyAccJerkMag-std() | numeric  | mean value of the accelerometer feature data
tBodyGyroMag-mean() | numeric  | mean value of the accelerometer feature data
tBodyGyroMag-std() | numeric  | mean value of the accelerometer feature data
tBodyGyroJerkMag-mean() | numeric  | mean value of the accelerometer feature data
tBodyGyroJerkMag-std() | numeric  | mean value of the accelerometer feature data
fBodyAcc-mean()-X | numeric  | mean value of the accelerometer feature data
fBodyAcc-mean()-Y | numeric  | mean value of the accelerometer feature data
fBodyAcc-mean()-Z | numeric  | mean value of the accelerometer feature data
fBodyAcc-std()-X | numeric  | mean value of the accelerometer feature data
fBodyAcc-std()-Y | numeric  | mean value of the accelerometer feature data
fBodyAcc-std()-Z | numeric  | mean value of the accelerometer feature data
fBodyAccJerk-mean()-X | numeric  | mean value of the accelerometer feature data
fBodyAccJerk-mean()-Y | numeric  | mean value of the accelerometer feature data
fBodyAccJerk-mean()-Z | numeric  | mean value of the accelerometer feature data
fBodyAccJerk-std()-X | numeric  | mean value of the accelerometer feature data
fBodyAccJerk-std()-Y | numeric  | mean value of the accelerometer feature data
fBodyAccJerk-std()-Z | numeric  | mean value of the accelerometer feature data
fBodyGyro-mean()-X | numeric  | mean value of the accelerometer feature data
fBodyGyro-mean()-Y | numeric  | mean value of the accelerometer feature data
fBodyGyro-mean()-Z | numeric  | mean value of the accelerometer feature data
fBodyGyro-std()-X | numeric  | mean value of the accelerometer feature data
fBodyGyro-std()-Y | numeric  | mean value of the accelerometer feature data
fBodyGyro-std()-Z | numeric  | mean value of the accelerometer feature data
fBodyAccMag-mean() | numeric  | mean value of the accelerometer feature data
fBodyAccMag-std() | numeric  | mean value of the accelerometer feature data
fBodyBodyAccJerkMag-mean() | numeric  | mean value of the accelerometer feature data
fBodyBodyAccJerkMag-std() | numeric  | mean value of the accelerometer feature data
fBodyBodyGyroMag-mean() | numeric  | mean value of the accelerometer feature data
fBodyBodyGyroMag-std() | numeric  | mean value of the accelerometer feature data
fBodyBodyGyroJerkMag-mean() | numeric  | mean value of the accelerometer feature data
fBodyBodyGyroJerkMag-std() | numeric  | mean value of the accelerometer feature data

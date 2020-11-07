### Getting-and-Cleaning-Data-Course-Project
# tidydataset.csv.zip : containts a tidy dataset version of traint and test datasets. it has four variables : subject,activity,feature,value.
# run_analysis.R: has all functions that generates the answeres of Getting and Cleaning Data Course Project questions.
 - readSubjectTrain: read subject file of train dataset and convert it to numeric
 - readSubjectTest: read subject file of test dataset and convert it to numeric
 - readActivityTrain: read activity file of train dataset and convert it to numeric
 - readActivityTest: read activity file of test dataset and convert it to numeric
 - readTrainDataSet: read train dataset and convert it to data.frame object
 - readTestDataSet: read test dataset and convert it to data.frame object
 - readFeature: read feature file and convert it to character vector
- createFinalTrainDataSet: combines subject,activity and train dataset into one dataset
- createFinalTestDataSet: combines subject,activity and test dataset into one dataset
- createFinalDataSet: merges the training and the test sets to create one data set.
- getMeanMeasurements: extracts only the measurements on the mean for each measurement.
- getStdMeasurements: extracts only the measurements on the standard deviation for each measurement.
- renameActivityValues: uses descriptive activity names to name the activities in the data set
- createTidyDataSet: creates a second, independent tidy data set.
- createActivityMeanForFeatures: calculates the average of each variable for each activity of tidy dataset
- createSubjectMeanForFeatures: calculates the average of each variable for each subject of tidy dataset


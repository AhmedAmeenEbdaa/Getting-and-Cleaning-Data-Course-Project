
readSubjectTrain <- function (){
	 as.numeric(readLines("train/subject_train.txt"))
}
readSubjectTest <- function (){
	 as.numeric(readLines("test/subject_test.txt"))
}
readActivityTrain <- function (){
as.numeric(readLines("train/y_train.txt"))
}
readActivityTest <- function (){
as.numeric(readLines("test/y_test.txt"))
}
readTrainDataSet <- function (){
	feature <- readFeature()
   read.table(file = "train/X_train.txt",col.names = feature, sep="",header = FALSE,dec = ".")
}
readTestDataSet <- function (){
		feature <- readFeature()

   read.table(file = "test/X_test.txt",col.names = feature,sep="",header = FALSE,dec = ".")
}
readFeature <- function (){
	tolower(as.vector(read.table(file = "features.txt",sep="",header = FALSE)[,2]))
}
createFinalTrainDataSet <- function(){
	subject <- readSubjectTrain()
	activity <- readActivityTrain()
	cbind(subject, activity,  readTrainDataSet())
}
createFinalTestDataSet <- function(){
	subject <- readSubjectTest()
	activity <- readActivityTest()
	cbind(subject, activity, readTestDataSet())
}
createFinalDataSet <- function(){
	rbind(createFinalTrainDataSet(), createFinalTestDataSet())
}
getMeanMeasurements <- function(dataset){
	meanMeasurements <- grep("mean",names(dataset))
	dataset[, meanMeasurements]
}
getStdMeasurements <- function(dataset){
	meanMeasurements <- grep("std",names(dataset))
	dataset[, meanMeasurements]
}
renameActivityValues <- function(dataset){
 dataset$activity = cut(dataset$activity, 6, labels=c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))
 dataset
}
createTidyDataSet <- function(dataset){
	newTidyDataSet <- gather(dataset,feature,value,-c('subject','activity'))
	write.table(newTidyDataSet,'tidydataset.txt',sep = " ", dec=".",col.names = TRUE,row.names = FALSE) 
	newTidyDataSet
}
createActivityMeanForFeatures <- function(tidyData){
	 summarise(group_by(tidyData,activity, feature),average = mean(value))
}
createSubjectMeanForFeatures <- function(tidyData){
	 summarise(group_by(tidyData,subject,feature),average = mean(value))
}
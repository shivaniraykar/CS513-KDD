##1) Problem 1
rm(list=ls())
#Read the data from the file
filepath<- file.choose();
dataset<- read.csv(filepath);
View(dataset)

#replace all the ? with NA
dataset[,1:11][dataset[,1:11]=="?"] <- NA
View(dataset)

#Summarize columns
summary(dataset)

#Identifying missing values
is.na(dataset)
View(dataset)

#Replacing the missing values with the “mean” of the column.
for(i in 1:ncol(dataset)){
  mean = mean(as.numeric(dataset[,i]),na.rm = TRUE)
  print(mean)
  dataset[is.na(dataset[,i]), i] <- mean
}
View(dataset)

#Displaying the frequency table of “Class” vs. F6
freqTable <- table(dataset$Class, dataset$F6)
ftable(freqTable)

#Displaying the scatter plot of F1 to F6, one pair at a time
pairs(dataset[c(2:6)], pch = 21, bg = c("blue", "green"))

#Show histogram box plot for columns F7 to F9
hist(dataset$F7, prob=TRUE, col="white", main="Histogram for F7", xlab="F7")
hist(dataset$F8, prob=TRUE, col="white", main="Histogram for F8", xlab="F8")
hist(dataset$F9, prob=TRUE, col="white", main="Histogram for F9", xlab="F9")
boxplot(dataset[8:10], main ="Histogram box plot for columns F7 to F9")


##Problem 2
#Delete all the objects from your R- environment. 
rm(list=ls())

#Reload the “breast-cancer-wisconsin.csv” from canvas into R. 
filepath<- file.choose();
dataset<- read.csv(filepath);
View(dataset)

#Remove any row with a missing value in any of the columns.
dataset[,1:11][dataset[,1:11]=="?"]<-NA
dataset <- na.omit(dataset)
View(dataset)

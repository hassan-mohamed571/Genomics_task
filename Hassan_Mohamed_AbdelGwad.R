
#Reading the dataset
data_set <- read.csv("G2_anthropometry.csv")
data_set
#viewing data
View(data_set)

#Im going to exploring the data

#get number of rows and columns 
print(nrow(data_set))
print(ncol(data_set))

#get structure of the data
print(str(data_set))

#knowing data dimensions 
dim(data_set)  

#knowing data summary and some statistics about it
print(summary(data_set))

#make preprocessing on thidis dataset

#convert "cm" into "M"which make date in better represntation
data_set$gender[data_set$gender == "cm"] = "M"

#i will round the age into integers number
data_set$age <- round(data_set$age)

#Dealing with missing :

#To get all locations of NA
complete.cases(data_set)

#Get all rows contain missing data
data_set[! complete.cases(data_set),] 

#converting height column into numeric
data_set$height <- as.numeric(data_set$height)

#check the new data type of height
class(data_set$height)

#Recoding for gender column
data_set$new_variable[data_set$gender == "M"] = "1"
data_set$new_variable[data_set$gender == "F"] = "2"
data_set

#Subset females who have foot_length greater than 200

s1<-data_set[data_set$Sex=="F" & data_set$foot_length >200 , ]
s1

#sort the data set ascending according to 2 variables
sorted<-data_set[order(data_set$age ,data_set$height) , ]
data_set
#sorting the data according to age
sort_age <- data_set[order(data_set$age), ]
data_set
##############################
#after making preprocessing the dataset is ready now for visualiztion

library(ggplot2)
#show the effect of the height on foot_length using scatter plot
fig1<-ggplot(data_set , aes(x=foot_length  , y= height))
fig1 + geom_point() + ggtitle("co relation between the Height and Foot_length")

#the distribution of footlength using histogram
fig2<-ggplot(data_set , aes(foot_length))
fig2 + geom_histogram(binwidth = 6)
fig2 + geom_histogram(fill = "orange")+ ggtitle("Child's foot length distribution")+labs(x="Foot Length" , y="Frequency")

#the distribution of Height using histogram
fig3<-ggplot(data_set , aes(height))
fig3 + geom_histogram(binwidth = 5)
fig3 + geom_histogram(fill = "red")+ ggtitle("distribution of height") 










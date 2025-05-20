#a)
college = read.csv("ML-LabWork/datasets/College.csv") #Load College.csv

#b)
rownames(college) = college[,1] #Adds new column with name of each university not part of data
View(college)

college = college[,-1] #Eliminates the first column
View(college)

#c)
#i) 
summary(college) #Summary of data set

#ii)
collegeM = college[,2:11] #Loading first ten numeric columns 
as.matrix(collegeM) #Converting it to matrix
pairs(collegeM , lower.panel = NULL) #pair plot with lower panel NULL

#iii)
boxplot(Outstate ~ Private , data = college , main = "OutState VS Private", xlab = "Private",ylab = "OutState", col = c('pink','lightblue'))

#iv)
Elite = rep("No",nrow(college))
Elite[college$Top10perc > 50] = "Yes"

 #Converts to categorical variable
college = data.frame(college,Elite)
college$Elite <- as.factor(college$Elite)

summary(college$Elite)
boxplot(Outstate ~ Elite,data = college,main = "Outstate VS Elite",xlab = "Elite",ylab = "Outstate", col = c('lightyellow','lightgreen'))

#v)
#Histogram of Applications Received 
op = par(mfrow = c(2,2))

hist(college$Apps,breaks = 15, main = "Applications Received")
rug(college$Apps)

hist(college$Apps,breaks = 25, main = "Applications Received")
rug(college$Apps)

hist(college$Apps,50, main = "Applications Received")
rug(college$Apps)

hist(college$Apps,'FD', main = "Applications Received")
rug(college$Apps)



#Histogram of New students enrolled
op = par(mfrow = c(2,2))

hist(college$Enroll,breaks = 15, main = "New students enrolled")
rug(college$Enroll)

hist(college$Enroll,breaks = 25, main = "New students enrolled")
rug(college$Enroll)

hist(college$Enroll,50, main = "New students enrolled")
rug(college$Enroll)

hist(college$Enroll,'FD', main = "New students enrolled")
rug(college$Enroll)



#Histogram of New students from top 10 % of high school class
op = par(mfrow = c(2,2))

hist(college$Top10perc,breaks = 2, main = "New students from top 10 % of high school class")
rug(college$Top10perc)

hist(college$Top10perc,breaks = 5, main = "New students from top 10 % of high school class")
rug(college$Top10perc)

hist(college$Top10perc,10, main = "New students from top 10 % of high school class")
rug(college$Top10perc)

hist(college$Top10perc,'FD', main = "New students from top 10 % of high school class")
rug(college$Top10perc)

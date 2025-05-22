#a.
library("ISLR2")
data = Boston  #load the data

data$chas = as.factor(data$chas)            #convert numeric to categorical
data$rad = factor(data$rad,ordered = TRUE)  #convert index of access to radial highways to ordinal categorical 

#b.Pair Wise Plot

#Eliminating categorical variable
q_data = data[,-4]
q_data$rad = NULL
#Eliminating predictor 
q_data$medv = NULL

n = ncol(q_data)
#c.
#Computing correlation interval with confidence interval
corr_table = NULL
for(i in 1:(n-1))
{
  for(j in (i+1):n)
  {
    test = cor.test(q_data[,i],q_data[,j])
    corr_table = rbind(corr_table,c(colnames(q_data[i]),colnames(q_data[j]),test$estimate,test$conf.int))
  }
}
colnames(corr_table) = c("V1","V2","cor","conf.intl","conf.intu")

#No pair of predictors have zero in their confidence interval


cor_crim = cor(q_data[,1],q_data[,-which(names(q_data) == "crim")])
#indus , nox , tax and lstat are positively correlated with crime
#1.census tracts with high crime rates tend to have high pollution
#2.high crime areas tend to have high tax rates
#3.high crime area tend to have large lower-status population
plot(data$rad,data$crim)
#4.high highway access have large crime rates comparatively
boxplot(data$crim ~ data$chas)

#d.
range = NULL
for(i in 1:n)
{
  range = rbind(range,range(q_data[,i]))
}
rownames(range) = colnames(q_data)
#large range high variation
#small range low variation

#e.
river = table(data$chas)
#31 census tracts set bound the Charles river

#f.
p_median = median(data$ptratio)
#Approximately 1 teacher for 19 students

#g.
lowest_median = which.min(q_data$mdev)
data[lowest_median,]


#h.
greater_seven = data[data$rm >7,]
greater_eight = data[data$rm > 8,]
#crime rates and lower where number room are greater than 7 
#crime rates reduce more when number of rooms greater than 8

sum(greater_eight$nox > 0.4)
sum(greater_seven$nox > 0.4)

range(greater_eight$medv)
range(greater_seven$medv)



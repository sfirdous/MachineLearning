auto = read.csv('SC562-ML I/datasets/Auto.csv')
View(auto)

n = length(auto[,1])

Y = auto[1]
X = rep(1,n)

predictors = seq(3,6,by =1)

p = length(predictors)

for(i in predictors)
{
  X = cbind(X,auto[,i])
}

as.matrix(X)

library("ISLR2")
data = Boston

#a.
#For each predictor, fit a simple linear regression model.
linear_reg = NULL
for(i in 2:ncol(data))
{
  summary = summary(lm(data$crim ~ data[,i]))
  linear_reg = rbind(linear_reg,c(colnames(data)[i],summary$coefficients[2,1],summary$coefficients[2,3],summary$coefficients[2,4]))
}
colnames(linear_reg) = c("Predictor","Coefficient","t","p-value")

model = lm(data$crim ~ data$zn+data$indus+data$chas+data$nox+data$rm+data$age+data$dis+data$rad+data$tax+data$ptratio+data$lstat+data$medv,data = data)

univariate_coeff = as.numeric(linear_reg[,2])
multivariate_coeff = summary(model)$coefficients[,4]
plot(univariate_coeff,multivariate_coeff[-1],xlab = "univariate",ylab = "multiple",pch = 19)

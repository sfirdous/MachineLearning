auto = read.csv("ALL CSV FILES - 2nd Edition/Auto.csv") #load data

#removing rows have ?
auto[auto == "?"] = NA
auto = na.omit(auto)

#converting horespower to numeric
auto$horsepower = as.numeric(auto$horsepower)
#a.
fit = lm(mpg ~ horsepower,data = auto)
summary(fit)
#i.   There is relationship between mpg and horsepower as we have very small p-value 
#ii.  There is a weak relation
#iii. There is negative relation

#iv.
test_data = data.frame(horsepower = 98)

con_pred = predict(fit,newdata = test_data,interval= "confidence")
pre_pred = predict(fit,newdata = test_data,interval = "prediction")

#b.
plot(test_data$horsepower,con_pred[1,1],col = "black",pch = 19)
abline(fit,col = "red",lwd =2)

#c.
par(mfrow = c(2,2))
plot(fit)
#1.Residual Vs Fitted 
#  There is a curve patter suggesting non-linearity
#  The linear model would not fully capture the relationship between mpg and horespowe
#  A polynomial or non-linear model may be more appropriate.

#2.QQ Residuals
#  The points deviate from diagonal from both ends,specially upper end
#  Residuals are not perfectly normal,but slight deviation is acceptable

#4. Residuals Vs Leverage
# There are point identified as influential points
# They can affect the regression line.





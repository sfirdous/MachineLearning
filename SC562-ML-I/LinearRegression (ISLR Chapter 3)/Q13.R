set.seed(1)                  #for consistent results
n = 100                      #no of observations
x = rnorm(n,mean=0,sd=1)     #observations drawn from a N(0, 1) distribution.
eps = rnorm(n,mean=0,sd=0.5) #drawn from a N(0, 0.25) distribution
y = (-1 + 0.5*x) + eps
length(y)
#linear regression
model = lm(y~x)
summary(model)

plot(x,y)
abline(model,col = 'red',lwd =2)
abline(-1,0.5,col = 'blue',lwd = 2)
legend("topleft",
       legend = c("Predicted","Actual"),
       col = c("red","blue"),
       lty = c(1,1),
       bty = "o")

#quadratic fit
pol_model = lm(y~x+I(x^2))
summary(pol_model)

#x^2 coeff can be considered as zero as p-value is large
#since there is no much difference in linear and polynomial but ofcourse
#linear model is slightly better 


#repeating the process with less noise by reducing the variance in error 
eps1 = rnorm(n,mean = 1,sd = 0.09)
y1 = (-1+0.5*x)  +eps1
model1 = lm(y1~x)
summary(model1)

plot(x,y1,pch =19)
abline(model1,col = 'red',lwd = 2)

#fit is quite good as error is low

#repeat the process with more noise
eps2 = rnorm(n,mean = 0,sd = 2)
y2 = (-1+0.5*x) + eps2

model2 = lm(y2~x)
summary(model2)

plot(x,y2,pch =19)
abline(model2,col = 'red',lwd = 2)
#as noise increases line does not fits data properly

#checking conf interval of every model
confint(model)
confint(model1)
confint(model2)
#Insigts 
#with normal noise intercept and slope are significant 
#with less noise intercept is not not significant since interval contains a zero
#with more noise slope interval contains a zero making is not significant
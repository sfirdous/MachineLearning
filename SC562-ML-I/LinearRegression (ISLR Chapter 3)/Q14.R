set.seed(1) #for consitent results
n = 100
#a.
x1 = runif(n)
x2 = 0.5 * x1 + rnorm(n) / 10
y <- (2 + 2 * x1 + 0.3 * x2) + rnorm(100)

data = data.frame(x1,x2,y)
plot(x1,x2)

model = lm(y~x1+x2,data=data)
summary(model)
#beta and betahat are close to each other 
#but difference between predicted b1 and b2 and autual b1 and b2 is large
#for h0: b1 = 0 we accept the null hypothesis
#for h0: b2 = 0 we accept the null hypothesis

modelx1 = lm(y~x1)
summary(modelx1)
#h0: b1 = 0 we reject null hypothesis

modelx2 = lm(y~x2)
summary(modelx2)
#h0: b2 = 0 we rejcet null hypothesis


#The results appear contradictory; 
#due to collinearity among the predictors, 
#individual variables are not statistically significant, 
#even though they may collectively influence the response.


x1 <- c(x1, 0.1)
x2 <- c(x2, 0.8)
y <- c(y, 6)

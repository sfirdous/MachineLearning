set.seed(1)
x = rnorm(100)
y = 2 *x +rnorm(100)

#a.
#simple linear regression of y onto x,
model = lm(y ~ x)
summary(model)
#H0 : Beta = 0
#Estimate = -0.03769
#t value -0.389
#p 0.698
#p value is > 0.1 so we accept the null hypothesis

#b.simple linear regression of x onto y
modelx = lm(x ~ y)
summary(modelx)
#p value > 0.1 so we accept the null hypothesis
#t-statistics is close to zero likely not significant 

#d.
beta_hat = modelx$coefficients[1]
stan_error = (sqrt(99)*sum(x*y))/ sqrt(sum(x**2)*sum(y**2) - (sum(x*y))**2)
tstats = beta_hat / stan_error 

#e.
# t-statistics is same for regression for y on x and x on y

#f.
y1 = (2 * x + 5) + rnorm(100)
model_with_intercept = lm(y1~x)
summary(model_with_intercept)

model_with_interceptx = lm(x~y1)
summary(model_with_interceptx)
#when regression is performed with an intercept,
#the t-statistic for H0 : β1 = 0 is the same for the regression of y
#onto x as it is for the regression of x onto y.
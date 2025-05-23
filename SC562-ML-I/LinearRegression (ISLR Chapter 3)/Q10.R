carseats = read.csv("ALL CSV FILES - 2nd Edition/Carseats.csv")

#a.
model = lm(Sales ~ Price+Urban+US,data = carseats)
summary(model)

#b.
#Price(-0.054459) for increase in sales the prices decreses by -0.05549
#UrbanYes has a negative effect but it is not statistically significant 
#USYes has a positive effect that is statistically significant 

#Price and US origin are strong predictors of outcome
#UrbanYes can be omitted

#c.
#Sales = 13.043 - 0.0544*Price + 1.2*USYes -0.0291UrbanYes

#d.
#For Price and USYes the null hypothesis can be rejected

#e.
smodel = lm(Sales ~ Price+US,data=carseats)
summary(smodel)

#f.
#small model fits the in e has slightly better fit

#g.
confint(model,level = 0.95)
#Intercept - Statistically Significant
#Price - Statistically Significant
#Urban - Statistically Significant
#US - Contains zero not statistically significant

#h.
plot(smodel)
#few points have high leverage but low residuals 
#no outliers 
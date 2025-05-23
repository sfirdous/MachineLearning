auto = read.csv("ALL CSV FILES - 2nd Edition/Auto.csv") #load data

#removing ? from all rows
auto[auto == "?"] = NA
auto = na.omit(auto)

#converting horsepower to numeric
auto$horsepower = as.numeric(auto$horsepower)

#a.
pairs(auto[,1:8],lower.panel = NULL)
#cylinders , year and origin can be used to group other predictors

#b.
correlation = cor(auto[,1:8])

#c.
model = lm(mpg ~ cylinders+displacement+horsepower+weight+acceleration+year+origin,data = auto[,1:8] )
summary(model)
#i. cylinders,year and origin have relatively high relation
#   relation with cylinder is not statistically significant
#   displacement,horsepower,weight and acceleration have weak relation
#   horsepower and weight are negatively related estimate for horsepower is not statistically significant

#ii. displacement,weight,acceleration ,year and origin are statistically significant
#iii. with increase in year mgp increases steadily 

#d.
par(mfrow = c(2,2))
plot(model)

#i.   There is slight curve in residual plot suggests that the relationship is not perfectly linear
#ii.  The points deviate from diagonal at upper ends, deviation is likely due to outlier
#iii. Points form almost a horizontal band that suggests that variance is constant.
#     Residual plot identifies some observation as outlier
#     the leverage plot identify one observation with unusually high leverage

#e.
#Statistically significant interactions
inter_1 = lm(mpg ~ cylinders * horsepower,data = auto )
summary(inter_1)

inter_2 = lm(mpg ~ cylinders * weight,data =auto)
summary(inter_2)

inter_3 = lm(mpg ~ cylinders * acceleration,data=auto)
summary(inter_3)

inter_4 = lm(mpg ~ displacement * horsepower,data =auto)
summary(inter_4)

#f.
model1 = lm(mpg ~ horsepower , data = auto)
model2 = lm(mpg ~ horsepower + I(horsepower^2),data=auto)

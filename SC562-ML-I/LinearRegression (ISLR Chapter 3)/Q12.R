#b.
n = 100   

set.seed(1)
x = rnorm(n)
y = (2*x)+rnorm(n)

modely_on_x = lm(y~x)
modelx_on_y = lm(x~y)
coef(modely_on_x)
coef(modelx_on_y)

set.seed(2)
x1 = rnorm(n)
y1 = x1

sum(x1^2)
sum(y1^2)

modely1_on_x1 = lm(y1~x1)
modelx1_on_y1 = lm(x1~y1)
coef(modely1_on_x1)
coef(modelx1_on_y1)

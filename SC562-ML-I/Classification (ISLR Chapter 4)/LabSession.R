library("ISLR2")
smarket = Smarket
names(smarket)
dim(smarket)
summary(smarket)
pairs(smarket)
View(cor(smarket[,-9]))

glm.fit = glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data = smarket,family = "binomial")
summary(glm.fit)

glm.predict = predict(glm.fit,type="response")
glm.label = rep("Down",1250)
glm.label[glm.predict > .5] = "Up"


#Splitting to test and train
train = smarket$Year < 2005
smarket.2005 = smarket[!train,]

subset.fit = glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=smarket,family = "binomial",subset = train)
summary(subset.fit)

test.prob = predict(subset.fit,smarket.2005,type = "response") 
test.label = rep("Down",252)

test.label[test.prob > .5] = "Up" 
table(test.label,smarket.2005$Direction)

mean(test.label == smarket.2005$Direction)
mean(test.label != smarket.2005$Direction)

#including variables that have relatively small p-value
fit = glm(Direction ~ Lag1+Lag2 , data = smarket,subset = train,family = "binomial")
summary(fit)

probs = predict(fit,smarket.2005,type = "response")
label = rep("Down",252)
label[probs > .5] = "Up"
table(label,smarket.2005$Direction)
mean(label == smarket.2005$Direction)
mean(label != smarket.2005$Direction)
                 
slope = 5                            #Actual Slope
intercept = 10                       #Actual Intercept

x = seq(-10,10,by = 0.2)             #Independent Variable
n = length(x)

f = function(x){                     #Actual Line
  slope*x + intercept
}
y = f(x) + rnorm(n,mean= 0,sd = 20)  #Dependent Variable with noise

plot(x,y,main = "Actual VS Predicted",xlab = "Independent Varibale",ylab = "Dependent Varibable")
curve(f(x),add = T , col = 'red',lwd = 2)

p_slope = (sum(x*y) - n*mean(y)*mean(x)) / sum(x^2) - n*(mean(x)^2)
p_intercept = mean(y) - p_slope*mean(x)

predicted_f = function(x){
  p_slope*x + p_intercept
}

curve(predicted_f(x),add = T,col = 'blue',lwd = 2) #Predicted Line

legend("topleft",legend = c("Actual Line","Predicted Line"),col = c("red","blue"),lwd = 2,lty = 1)

 
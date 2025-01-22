op = par(mfrow = c(2,4))
for(i in 1:(ncol(iris)-1)){
  x = iris[,i]
  for(j in  (i+1):(ncol(iris)-1)){
   if(i!=j){
     y = iris[,j]
     plot(x,y,main = paste(names(iris)[i] ," VS ",names(iris)[j]),xlab= names(iris)[i],ylab = names(iris)[j],col = as.numeric(iris$Species),pch = 16)
   }
  }
}


#black-setosa
#pink - versicolor
#green - virginica


auto = read.csv("./ALL CSV FILES - 2nd Edition/Auto.csv") 
View(auto)


#a.
# Response Variable - mpg
# Quantitative predictors - displacement,horsepower,weight,acceleration
# Qualitative  predictors - cylinders,year,origin,name

range = NULL
quantitative_p = c(3,4,5,6)

#removing rows having "?"
auto[auto == "?"] = NA
auto = na.omit(auto)

#Converting horespower to numeric column
auto$horsepower = as.numeric(auto$horsepower)

#b.
#append range of every qualitative predictor to range
for (i in 3:6){
  range = cbind(range,range(auto[,i]))}

colnames(range) = colnames(auto[,3:6])
rownames(range) = c("min","max") 

#c.
#statistics of each qualitative predictor
stats = NULL
for (i in 3:6){
  stats = cbind(stats,c(mean(auto[,i]),sd(auto[,i])))}

colnames(stats) = colnames(auto[,3:6])
rownames(stats) = c("mean","sd") 

#d.
#subset of dataset
subset_auto = auto[-(10:85),]

#calculate range for subset
s_range = NULL
for (i in 3:6){
  s_range = cbind(s_range,range(subset_auto[,i]))}

colnames(s_range) = colnames(subset_auto[,3:6])
rownames(s_range) = c("min","max") 

#statistics of each qualitative predictor of subset
s_stats = NULL
for (i in 3:6){
  s_stats = cbind(s_stats,c(mean(subset_auto[,i]),sd(subset_auto[,i])))}

colnames(s_stats) = colnames(subset_auto[,3:6])
rownames(s_stats) = c("mean","sd") 

#e.
#plot mpg against all other predictors
par(mfrow= c(2,2))
for(i in 3:6)
{
  plot(auto[,i],auto$mpg,xlab = colnames(auto[i]),ylab = "MPG",main = paste("MPG VS" , colnames(auto[i])),col = "salmon")
}

#relationship between predictors
pairs(auto[,3:6],lower.panel = NULL)

correlation_matrix = NULL
for(i in 3:5)
{
  for(j in (i+1):6){
    corr = cor.test(auto[,i],auto[,j])
    correlation_matrix = rbind(correlation_matrix,c(corr$estimate,corr$conf.int))
  }
}

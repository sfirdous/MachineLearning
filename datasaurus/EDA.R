#EDA on Datasaurus


options(digitis = 3)
#read the data from csv and store it into variable data
data = read.csv("d:/data-science/datasaurus/datasaurusdozen-wide.csv")
data = data[-1,]  #remove the 1st row

ncols = length(data[1,])

# Data Exploration 
summary = summary(data)

op = par(mfrow = c(3,5))

stats = NULL

for(i in seq(1,ncols,by = 2)){
  x = as.numeric(data[,i])
  y = as.numeric(data[,i+1])
  corr = cor.test(x,y)
  stats = rbind(stats,c(colnames(data)[i],mean(x),mean(y),sd(x),sd(y),corr$estimate,corr$conf.int[1],corr$conf.int[2]))
  
  plot(x,y,main = colnames(data)[i])
  lf = lm(y ~ x)
  abline(coef(lf))
}


dev.new()
op = par(mfrow = c(3,5))
for(i in seq(1,ncols,by=2)){
  x = as.numeric(data[,i])
  y = as.numeric(data[,i+1])
  
  lf= lm(y ~ x)
  lines(x,resid(lf))
}

colnames(stats) = c("dataset","mean_x","mean_y","sd_x","sd_y","corr_xy","conf.int l","conf.int u")




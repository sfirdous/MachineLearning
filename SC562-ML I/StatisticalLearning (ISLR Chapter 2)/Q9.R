auto = read.csv("ML-LabWork/datasets/Auto.csv") 
View(auto)

# Response Variable - mpg
# Quantitative predictors - displacement,horsepower,weight,acceleration
# Qualitative  predictors - cylinders,year,origin,name

range = NULL
quantitative_p = c(3,4,5,6)
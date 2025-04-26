scale = function(X)
{
  #X: nxp matrix
  
  #n: number of casses
  n = nrow(X)
  #p: number of features/variables
  p = ncol(X)
  
  #Y: Matrix to store scaled data columns
  Y = matrix(0,n,p)
  
  #iterate through each columnn
  for(i in 1:p)
  {
    mean_i = mean(X[,i])  # mean of ith columns
    sd_i = sd(X[,i])      # standard deviation of ith column
    
    #subtract mean from each entry and divide by standard deviation
    for(j in 1:n)
      Y[j,i] = (X[j,i] - mean_i) / sd_i
  }
  
  return (Y)
}
x1 = c(0,2,0,0,-1,1)
x2 = c(3,0,1,1,0,1)
x3 = c(0,0,3,2,1,1)


train.x = data.frame(X1 = x1,X2 = x2,X3 = x3)
n <- nrow( train.x ) # number of cases
p <- ncol( train.x ) # number of excoriates/features



train.y = c("Red","Red","Red","Green","Green","Red")

test = c(0,0,0)

knn.classify <- function( test.x, train.x, train.y, K )
{
  # test.x:  a _single_ p-vector; values for the p features for the test case
  # train.x: n x p matrix; consisting of training data of n cases (rows) and p features (columns)
  # train.y: a _single_ n-vector; class labels corresponding to the cases in train.x
  # K:       single positive integer; number of nearest neighbors to consider

  n <- nrow( train.x ) # number of cases
  p <- ncol( train.x ) # number of excoriates/features

  # input sanity checks
  stopifnot( is.vector( test.x ), length( test.x ) == p, length( train.y ) == n, K == as.integer( K ), K > 0, K <= n )

  # in case you need all class labels together
  # labels <- unique( train.y )

  # compute distances of the test case from all train cases
  euclidean_distance = NULL;
  for(i in 1:n)
  {  distance = 0;
    for(j in 1:p)
      {
      distance = distance + (test.x[j] - train.x[i,j])^2;
    }
  euclidean_distance = c(euclidean_distance,distance)
  }
  View(euclidean_distance)
 
  
  

  # find the first K nearest neighbors of the test case
  #... your code goes here ...

  # find the majority label among the nearest neighbors
  # if K is even, make sure to resolve any ties using some reasonable strategy
  #... your code goes here ...

  # return assigned label
  #... your code goes here ...
}

knn.classify( test, train.x, train.y, 3)

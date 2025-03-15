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
  euclidean_distance = NULL;  # Initialize an empty vector to store Euclidean distances
  
  for(i in 1:n)  # Iterate through each test data point
  {  
    distance = 0;  # Initialize distance to 0 for each test data point
    
    for(j in 1:p)  # Iterate through each feature (dimension)
    {
      # Compute squared difference between test and train feature values
      distance = distance + (test.x[j] - train.x[i, j])^2;
    }
    
    # Store the computed Euclidean distance for the current test point
    euclidean_distance = c(euclidean_distance, distance)
  }
  
  
 
  
  #combine the euclidean_distance with their corresponding class
  # Create a data frame with Euclidean distances and corresponding labels from training data
  neighbours = data.frame(distance = euclidean_distance, label = train.y)
  
  # Sort the data frame in ascending order based on the 'distance' column
  sorted_neighbours = neighbours[order(neighbours$distance), ]
  
 
 
  

  # find the first K nearest neighbors of the test case
  if (!K %% 2)  # If K is even (i.e., K %% 2 == 0)
    K = K + 1  # Increment K to make it odd
  
  # Select the first K nearest neighbors from the sorted list
  first_k_neighbours = sorted_neighbours[1:K, ]
  
  
  

  # find the majority label among the nearest neighbors
  # if K is even, make sure to resolve any ties using some reasonable strategy
  # Create a frequency table of labels in the first K nearest neighbors
  labels = table(first_k_neighbours$label)
  
  # Select the label with the highest frequency (majority class)
  test.label = names(which.max(labels))
  
  

  # return assigned label
  return (test.label)
}

label = knn.classify( test, train.x, train.y, 4)

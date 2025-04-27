
source("functions/scale.r")

pca_from_svd = function(X)
{
  #extract dimensions of data
  n = nrow(X)
  p = ncol(X)
  
  #stop if features and cases are less than two
  stopifnot("n must be at least 2" = n >= 2)
  stopifnot("p must be at least 2" = p >= 2)
  
  
  # step 1: Scale features
  Y = scale(X)             
  
  # step 2: Compute the singular value decomposition 
  svd = svd(Y)
  d = svd$d
  U = svd$u
  V = svd$v

  # step 3: if eigenvalues not d > 0 stop
  stopifnot(all(d > 0))
  
  #Rearrange if eigen values not in descending order
  if (!isTRUE(all.equal(d, sort(d, decreasing = TRUE)))) {
    idx = order(d, decreasing = TRUE)  # Find indices for descending sort
    d = d[idx]                         # Reorder eigenvalues
    V = V[, idx]                       # Reorder right singular vectors
    U = U[,idx]                        # Reorder left singular vectors
  }
  
  
  
  # step 4 : 
  Scores = Y %*% V    # principal component matrix is Y R.
  sdev = d / sqrt(n)  # Standard deviations of the PCs are d/√n
  
  
  # create a list
  pca = list()
  
  # add outputs to the list
  pca[["sdev"]] = sdev
  pca[["rotation"]] = V
  pca[["x"]] = Scores
  
  return (pca)
}

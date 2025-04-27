source("functions/scale.r")

pca_from_correlation = function(X)
{
  #extract dimensions of data
  n = nrow(X)
  p = ncol(X)
  
  #stop if features and cases are less than two
  stopifnot("n must be at least 2" = n >= 2)
  stopifnot("p must be at least 2" = p >= 2)
  
  
  # step 1: Scale features
  Y = scale(X)             
  
  # step 2: compute correlation matrix
  C = (t(Y) %*% Y) /  (n-1)
  
  # step 3: eigen eigendecomposition of C
  decomposition = eigen(C)
  d = decomposition$values
  V = decomposition$vectors
  
  # step 4: if eigenvalues not d > 0 stop
  stopifnot(all(d > 0))
  
  #------------------------LLM Code-------------------------------------
  #Rearrange if eigen values not in descending order
  if (!isTRUE(all.equal(d, sort(d, decreasing = TRUE)))) {
    idx <- order(d, decreasing = TRUE)  # Find indices for descending sort
    d <- d[idx]                         # Reorder eigenvalues
    V <- V[, idx]                       # Reorder columns of eigenvectors
  }
  #----------------------------------------------------------------------
  
  
  # step 5 : 
  Scores = Y %*% V    # principal component matrix is Y R.
  sdev = sqrt(d)      # Standard deviations of the PCs are the square roots of first k eigenvalues in d.
  
  # create a list
  pca = list()
  
  # add outputs to the list
  pca[["sdev"]] = sdev
  pca[["rotation"]] = V
  pca[["x"]] = Scores
  
  return(pca)
}

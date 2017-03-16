longevity_analysis <- function(U){

  P <- Umat_to_Pmat(U)
  
  # objects required for calculating moments
  s <- dim(U)[1] # number of transient states
  Z=cbind(diag(s),rep(0,s)) # truncation matrix
  I<-diag(s) # identity matrix of transient stages
  
  N <- solve(I-U) # fundamental matrix
  
  ### LON - Longevity
  n1 <-colSums(N)
  n2 <-n1%*%(2*N-I)
  n3 <-n1%*%(6*N%*%N - 6*N + I)
  
  results <- list()
  
  # Statistics of longevity
  results$expected <- n1
  results$var<-n2-n1*n1
  results$sd<-sqrt(results$var)
  results$cv<-solve(diag(n1))%*%t(results$sd)
  
  return(results)
}

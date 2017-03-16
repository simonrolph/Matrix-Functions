occupancy_time_analysis <- function(U){
  
  P <- Umat_to_Pmat(U)

  # objects required for calculating moments
  s <- dim(U)[1] # number of transient states
  Z=cbind(diag(s),rep(0,s)) # truncation matrix
  ones=rep(1,s+1) #vector of ones
  I<-diag(s) # identity matrix of transient stages

  N <- solve(I-U) # fundamental matrix
  
  Ndg<-diag(3)*N # matrix with diagonal of fundamental matrix on the diagonal, zeros elsewhere
  
  ### OCC - occupancy time - how much time do you spend in each stage?
  # moments of occupancy time
  N1 <- N # 1st
  N2 <- (2*Ndg-I)%*%N1 # second
  N3 <- (6*Ndg%*%Ndg-6*Ndg+I)%*%N1 #third
  
  results <- list()
  
  # Statistics of occupancy
  results$expected <- N1 #expected
  results$var <- N2-N1*N1 # variance
  results$sd <- sqrt(results$var) #standard deviation
  results$cv <- results$sd/N1 # coefficient of variation

  return(results)
}

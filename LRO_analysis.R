LRO_analysis <- function(U,R1,R2,R3){

  # objects required for calculating moments
  s <- dim(U)[1] # number of transient states
  Z=cbind(diag(s),rep(0,s)) # truncation matrix
  ones=rep(1,s+1) #vector of ones
  I<-diag(s) # identity matrix of transient stages
  
  N <- solve(I-U) # fundamental matrix
  
  ### LRO = lifetime reproductive output
  # calculating moments of LRO
  N1 = t(N)%*%(Z%*%((t(P*R1))%*%ones)) #first
  N2 = t(N)%*%(Z%*%((t(P*R2))%*%ones)+2*Z%*%(t(P*R1))%*%t(Z)%*%N1) #second
  N3 = t(N)%*%(Z%*%((t(P*R3))%*%ones)+3*Z%*%(t(P*R2))%*%t(Z)%*%N2 + 3*Z%*%(t(P*R1))%*%t(Z)%*%N2) #third
  
  results <- list()
  
  # Statistics of lifetime reproductive output
  results$expected <- N1 #expected
  results$var<-N2-N1*N1 # variance
  results$sd<-sqrt(results$var) # standard deviation
  results$cv<-results$sd/N1 # coefficient of variation
  
  return(results)
}

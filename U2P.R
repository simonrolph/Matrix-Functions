U2P <- function(matU){
  s <- dim(matU)[1] #number of tranisent stages
  
  P <- matrix(nrow = s*2, ncol = s*2) #generate empty matrix
  
  # P has format:
  
  # U | 0
  # -----
  # M | I
  
  P[1:s,1:s] <- matU #set U
  M <- diag(1-colSums(matU)) # create M
  if (min(M)<0){ # warning if negative mortality
    warning("The summed transitions of a class are greater than one so there will be negative values in the mortality matrix. U cannot contain fecunity of clonality.")
  }
  P[(s+1):(s*2),1:s] <- M # set M (mortality matrix)
  P[(s+1):(s*2),(s+1):(s*2)] <- diag(s) # set I, identity matrix
  P[is.na(P)] <- 0 # set zeros
  
  return(P)
}

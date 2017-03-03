#function to convert to post-reproductive matrix
#requires full matrix and fecundity matrix
convert2post <- function(mat,matF) {
  
  mat <- Matlab2R(mat) # turn matrix into R format
  matF <- Matlab2R(matF) # turn fecundity matrix into R format
  matrix_size <- nrow(mat) #set a variable for size of matrix
  no_fecund <- mat - matF # create matrix with fecundity values excluded
  converted <- matrix(0,matrix_size,matrix_size) #create empty matrix of the same size
  
  for (j in 1:matrix_size) #iterating through j
  {
    for (i in 1:matrix_size) # iterating through i
    {
      temp <- no_fecund[j,i]
      for (iter in 1:matrix_size)
      {
        temp <- temp + mat[iter,i]*matF[j,iter]
      }
      converted[j,i] <- temp
    }
  }
  
  
  if (sum(is.na(converted)) == 0){
    if (sum(converted[1:matrix_size,matrix_size] == 0) == matrix_size & matrix_size > 2)
    {
      converted<-converted[1:matrix_size-1,1:matrix_size-1]
    }
    converted<- R2Matlab(converted)
    return(converted)
  }  else  {
    return(NA)
  }
}

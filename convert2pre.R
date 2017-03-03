convert2pre <- function(mat,matF) 
{
  mat <- Matlab2R(mat) #creates matlab style matrix of full matrix
  matF <- Matlab2R(matF) #creates matlab style matrix of fecundity matrix
  matrix_size <- nrow(mat) #creates variable for size of matrix
  empty_mat <- matrix(0, matrix_size-1, matrix_size-1) # creates an empty matrix of size matrix_size - 1
  
  for (i in 2:matrix_size)
  {
    empty_mat <- mat[2:matrix_size,1] %o% mat[1,2:matrix_size] # matrix multiplications to construct new fecundities
  }
  
  
  mat_corrected_pre <- mat[2:matrix_size,2:matrix_size] + empty_mat
  
  if (mat[1,1] != 0) # pesistent seedbank
  {
    empty_mat2 <- matrix(0, matrix_size, matrix_size)
    empty_mat2[2:matrix_size,2:matrix_size] <- empty_mat
    mat_corrected_pre <- mat + empty_mat2
    mat_corrected_pre[1,2:matrix_size] <- mat_corrected_pre[1,2:matrix_size] * mat[1,1]
  }
  #if (sum(matF[2:matrix_size,1:matrix_size] == 0) != matrix_size*(matrix_size-1))
  #{
  #  mat_corrected_pre <- NULL
  #}
  mat_corrected_pre<- R2Matlab(mat_corrected_pre)
  return(mat_corrected_pre)
}

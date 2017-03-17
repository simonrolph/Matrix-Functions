# vec permutation
# this function was provided at the IDEM 134 course at MPIDR run by Hal Caswell and Silke van Daalen

vec.perm<-function(x,y){
  p=matrix(0,x*y,x*y)
  a=matrix(0,x,y)
  for(i in 1:x){
    for(j in 1:y){
      e=a
      e[i,j]=1
      p=p+kronecker(e,t(e))
    }
  }
  return(p)
}

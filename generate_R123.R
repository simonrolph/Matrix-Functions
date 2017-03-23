generate_R123 <- function(R1, distri = "bernoulli"){
  # R1 = R1  
  # distri = type of distribution for generating rewards  
  # > bernoulli  
  # > fixed  
  # > poisson    
  
  if (distri == "bernoulli"){   
    R2 = R3 = R1
  } 
    
  if (distri == "fixed"){
    R2 <- R1^2    R3 <- R1^3  
  }    

  if (distri == "poisson"){    
    R2 <- R1 + (R1 * R1)    
    R3 <- R1 + 3*(R1 * R1) + (R1 * R1 * R1)  
  }    

  R123 <- c()  
  R123$R1 <- R1  
  R123$R2 <- R2  
  R123$R3 <- R3    

  return(R123)
}

generate_R1 <- function(P,s,type = "occupancy",death_contrib = 0.5){  
	# P = P matrix  
	# s = number of stages  
	# type = type of reward scheme  
	# > occupancy  
	# > growth  
	# death_contrib = proportion of award given in death transition (0 =< death_contrib =< 1)    
	
	Pdim <- dim(P)[1]  
	U <- P[1:s,1:s]    
	R1 <- matrix(0,nrow = Pdim,ncol = Pdim)    
	
	if (type == "occupancy"){    
		R1[1:s,1:s] <- 1    
		R1[(s+1):Pdim,1:s] <- death_contrib  
	}   
	
	return(R1)   
	
}

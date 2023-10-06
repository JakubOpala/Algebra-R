
library(Matrix)

# Function to check orthogonality or orthonormality of a set of vectors
check_ortho <- function(vectors, orthonormal = FALSE) {
  
  eps <- 1e-14
  
  # Get the number of vectors in the set
  num_vectors <- nrow(vectors)
  num_rows <- nrow(vectors)
  if (num_vectors < num_rows){
    A <- vectors %*% t(vectors)
  }
  else {
    A <- t(vectors) %*% vectors
  }

  
  if (orthonormal) {
    if (!(all(abs(A-diag(num_vectors))) < eps)) {
      return(FALSE)
    }
  }
  else {
    if(!all(abs(A-diag(diag(A))) < eps)){
      return(FALSE)
    }
  }
    
  return(TRUE)
} 

#print("Type first vector for checking orthogonality/orthonormality")
#a <- scan( what = list(), quiet = TRUE, sep = " ")
#a <- as.integer(strsplit(readline(prompt), " ")[[1]])
inp <- readline("Enter the first vector: ")
a <- eval(parse(text = inp))
vectors <- a



repeat {
  
  inp <-readline("Type another vector or type 1 for the orthogonality test or 2 for orthonormality test: ")
  x <- eval(parse(text = inp))
  
  if (length(x) == 1){
    if (x == 1) {
      if (check_ortho(vectors, FALSE) == TRUE) {
        print("Given set is orthogonal")
      }
      else {
        print("Given set isnt orthogonal")
      }
      break
    } 
    else if (x == 2) {
      if (check_ortho(vectors, TRUE) == TRUE) {
        print("Given set is orthonormal")
      }
      else {
        print("Given set isnt orthonormal")
      }  
      break
    }
  }
  else if (length(x) == length(a)){
    vectors <- cbind(vectors, x)
  } else 
  {
    print("Wrong input, try again")
  }
}


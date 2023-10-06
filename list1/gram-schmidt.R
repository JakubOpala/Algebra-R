library(microbenchmark)
library(Matrix)

gram_schmidt <- function(X) {

  Q <- matrix(0, nrow = nrow(X), ncol = ncol(X))
  
  Q[,1] <- X[,1] / sqrt(sum(X[,1]^2))

  for (j in 2:ncol(X)) {

    P <- Q[,1:(j-1)] %*% t(Q[,1:(j-1)]) %*% X[,j]

    v_ortho <- X[,j] - P

    Q[,j] <- v_ortho / sqrt(sum(v_ortho^2))
  }

  return(Q)
}

gram_schmidt2 <- function(X){
  qr_X <- qr(X)
  
  R <- qr.R(qr_X)
  
  rank_R <- sum(diag(R) != 0)
  
  X_independent <- X[, 1:rank_R]
  
  Q <- qr.Q(qr(X_independent))
  
  return(Q)
  #return(qr.Q(res))
}




task <- readline("1 - input matrix, 2 - compare algorithms:  ")
choice <- eval(parse(text = task))

if(choice == 1)
{
  inp <-readline("Choose space dimensionality: ")
  n <- eval(parse(text = inp))
  repeat{
    inp <-readline("Type the first vector: ")
    vectors <- eval(parse(text = inp))
    if (length(vectors) == n) {
      break
    }
  }
  for (k in 2:n) {
    inp <-readline("Type a vector or 1 to start algorithm: ")
    x <- eval(parse(text = inp))
    if(length(x) == 1){
      if(x==1){
        Q <- gram_schmidt2(vectors)
        break
      }
      else{
        Print("Wrong input, try again")
      }
    }
    else if (length(x) == n){
      vectors <- cbind(vectors, x)
    }
    else{
      Print("Wrong input, try again")
    }
    if (k == n){
      Q <- gram_schmidt2(vectors)
    }
  }
  
  
  # Print orthonormal basis
  cat("Orthonormal basis:\n")
  print(Q)
} else if (choice == 2)
{
  data <- 2^seq(7)
  mean_t <- matrix(data = NA, nrow = 2, ncol = 7)
  
  for (i in data){
    A <- matrix(runif(i*i),i,i)
    
    mic <- microbenchmark( gram_schmidt(A), gram_schmidt2(A), unit = "milliseconds", times = 10)
    i_means <- summary(mic)$mean
    mean_t[,log2(i)] <- i_means
  }
  
  plot(data, mean_t[1,], color = "green", type = "l", ylab = "execution time[ms]", xlab = "dims", main = "G-S w/o loop")
  lines(data, mean_t[2,], color = "blue")
  
}



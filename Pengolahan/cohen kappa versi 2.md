# Cohen’s kappa 
--------------------------------------------------------------------------------
sumber : [buka link ini](https://www.real-statistics.com/reliability/interrater-reliability/weighted-cohens-kappa/)

*input* : **matrix** obser

*output* : **integer** kappa




**Syntax** :

```R
cohen_kappa <- function(obser, w=FALSE) {
  
  #bikin weighted or nonweighted matrix
  n_row = nrow(obser)
  n_col = ncol(obser)
  
  w_matrix <- matrix(rep(0,n_row*n_col), n_row, n_col)
  non_wmatrix <- matrix(rep(0,n_row*n_col), n_row, n_col)
  
  if (w == T) {  #for weighted
    for (i in 0:n_row) {
      k = -1
      for (j in i:n_col) {
        k = k + 1
        w_matrix[i,j] = k
      }
    }
  } else { #for non-weighted
    for (i in 1:n_row) {
      for (j in i:(n_col)) {
        if (i == j) {
          w_matrix[i,j] = 0
        } else {
          w_matrix[i,j] = 1
        }
      }
    }
  }
  
  y_mirror <- w_matrix[,c(n_col:1)]
  x_mirror <- y_mirror[c(n_row:1),]
  weighted <- x_mirror + w_matrix
    
  
  #untuk input
  Yi_col_obser <- rowSums(obser) 
  Yi_row_obser <- colSums(obser)
  Yi_diag_obser <- diag(obser)
  
  n <- sum(Yi_row_obser)
  n_diag <- length(Yi_diag_obser)
  
  prob <- matrix(rep(0,n_diag*n_diag), n_diag, n_diag) #pake diag karena matrix simetris
  for (i in 1:n_diag) {
    for (j in 1:n_diag) {
      prob[i,j] <- Yi_row_obser[j] * Yi_col_obser[i] / n
    }
  }
  
  
  #koefisien kappa
  weighted_prob <- sum(weighted * prob)
  weighted_obser <- sum(weighted * obser)
  
  kappa <- 1 - weighted_obser/weighted_prob
  return(kappa)
    
}

```

**Contoh penggunaan** :
```R
bu <- matrix(c(16,4,3,6,10,0,2,1,8), 3, 3) #data ada di ppt pak agung
m <- matrix(c(25,4,3,3,7,10,2,1,5,4,7,2,3,0,0,4), 4, 4) 

cohen_kappa(obser=bu, w=False) #unweighted
cohen_kappa(obser=m, w=True) #weighted

```

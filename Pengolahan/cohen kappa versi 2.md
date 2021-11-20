# Cohen’s kappa 
--------------------------------------------------------------------------------
sumber : [buka link ini](https://www.real-statistics.com/reliability/interrater-reliability/weighted-cohens-kappa/)

*input* : **matrix** obser

*output* : **integer** kappa




**Syntax** : (masih berantakan)

```R
cohen_kappa <- function(obser, alpha=0.05, w=FALSE) {
  
  #bikin weighted or nonweighted matrix
  n_row = nrow(obser)
  n_col = ncol(obser)
  
  w_matrix <- matrix(0, n_row, n_col)
  
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
  
  expec <- matrix(0, n_diag, n_diag) #pake diag karena matrix simetris
  for (i in 1:n_diag) {
    for (j in 1:n_diag) {
      expec[i,j] <- Yi_row_obser[j] * Yi_col_obser[i] / n
    }
  }
  
  
  #koefisien kappa dan std
  expec_prob <- expec / n
  obser_prob <- obser / n
  maxval_w <- weighted[which.max(weighted)]
  v <-  1 - weighted / maxval_w
  pe_w <- sum(v * expec_prob) 
  
  ur <- c()
  uc <- c()
  for (i in 1:n_diag) {
    ur[i] <- sum(Yi_row_obser/n * v[,i])
    uc[i] <- sum(Yi_col_obser/n * v[i,])
  }
  
  u <- matrix(0, n_diag, n_diag) #untuk bikin matrix aja sihh
  for (i in 1:n_diag) {
    for (j in 1:n_diag) {
      u[i,j] <- ur[i] + uc[j]
    }
  }
  
  pa_w <- sum(v * obser_prob)
  koef_w <- (pa_w - pe_w) / (1 - pe_w) #koefisien kappa
  se_w <- 1 / ((1 - pe_w) * sqrt(n)) * 
                 sqrt(sum((obser_prob) * (v - u* (1-koef_w))^2) - (koef_w - pe_w * (1-koef_w))^2
                      )
  #output
  bounds <- matrix(NA,1,5)
  bounds[1,1] <- koef_w - se_w *qnorm(1-(alpha/2))  #lower
  bounds[1,2] <- koef_w                             #kappa
  bounds[1,3] <- koef_w + se_w *qnorm(1-(alpha/2))  #upper
  bounds[1,4] <- se_w                               #standar error
  bounds[1,5] <- koef_w/se_w                        #z-hitung

  return(bounds)
}

```

**Contoh penggunaan** :
```R
bu <- matrix(c(16,4,3,6,10,0,2,1,8), 3, 3) 
m <- matrix(c(25,4,3,3,7,10,2,1,5,4,7,2,3,0,0,4), 4, 4) #data ada di ppt pak agung

cohen_kappa(obser=bu, alpha=0.1, w=FALSE) #unweighted with alpha 0.1
cohen_kappa(obser=m, alpha=0.05, w=TRUE) #weighted with alpha 0.05
```

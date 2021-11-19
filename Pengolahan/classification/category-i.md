# Pengklasifikasian data
-----------------------------------------------------------------------------

**Tujuan** : mengklasifikasikan data berdasarkan kategori ke-i

**Syntax** :
```R
classification_func <- function(data) {
  max_val.x <- data$x[which.max(data$x)]
  max_val.y <- data$y[which.max(data$y)]
  
  if (max_val.x > max_val.y) {
    max_val = max_val.x
  } else {
    max_val = max_val.y
  }
  
  cont_matrix <- matrix(rep(0,max_val*max_val), nrow=max_val,ncol=max_val)
  
  #mulai mengecek data-x dari row ke-i (terkecil ke terbesar)
  for (i in 1:max_val) {
    for (a in 1:nrow(data)) {
      row <- data[a,]
      if (row$x == i) {
        
        #mencocokan nilai data row ke-i dan row ke-j pada data-y
        for (j in 1:max_val) {
          if (row$y == j) {
            if ((row$x == i) & (row$y ==i)) {
              cont_matrix[i,i] <- cont_matrix[i,i] + 1
            } else {
                cont_matrix[i,j] <- cont_matrix[i,j] + 1
            }
          }
        } #col
        
      }
    }
  } #row
  return(cont_matrix)
}
```

**contoh penggunaan** :
```R
#data di match dengan inner join 
x <- c(1, 1, 1, 1, 2, 2, 2, 3, 3, 4)
y <- c(1, 1, 1, 2, 2, 2, 2, 3, 4, 5)

pair <- matrix(c(x,y), ncol=2, nrow=length(x)) 
dimnames(pair) <- list(c(),c('x','y'))
data = as.data.frame(pair)

classification_func(data)
```

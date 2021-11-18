### Index of Inconsistency (IOI)
-------

**Tujuan** : 
Untuk menentukan estimasi kesalahan isian 

**Nama variabel** : 
- Yi_row  = jumlah kasus di long form tidak tertimbang pada kategori ke-i 
- Yi_col  = jumlah kasus di PKL tidak tertimbang pada kategori ke-i
- n_row = banyaknya kategori respon untuk karakteristik “y” row.
- n_col = banyaknya kategori respon untuk karakteristik “y” column.
- n_diag = 
- n = jumlah kasus
- sum_yidiag = 
- sum_yirow_dot_yicol = 

- IOI_cap = 
- IOI_ag = 

**Flowchart** : 

![Flowchart IOI!](/Pengolahan/IOI/IOI.jpg "IOI")


**Syntax** : 
```R
ioi_func <- function(Yi_row, Yi_col, Yi_diag) {
  n_diag <- length(Yi_diag)  # matrix input harus simetris
  n <- sum(Yi_col) 
  
  ioi_cap <- c() #initiation vector
  sum_yidiag <- 0
  sum_yirow_dot_yicol <- 0

  for (i in 1:n_diag) {
    ioi_cap[i] <- 100*(
                      (Yi_row[i] + Yi_col[i] - 2*Yi_diag[i]) / 
                      ((1/n) * (Yi_row[i]*(n - Yi_col[i]) + Yi_col[i]*(n - Yi_row[i]))) 
                      )
                   
    sum_yidiag <- Yi_diag[i] + sum_yidiag
    sum_yirow_dot_yicol <- (Yi_row[i]*Yi_col[i]) + sum_yirow_dot_yicol  
  }
  
  IOI_cap <- matrix(ioi_cap,ncol=n_diag)
  IOI_ag <- 100*((n - sum_yidiag) / (n - (1/n)*(sum_yirow_dot_yicol)))
  
  return(list(IOI_cap, IOI_ag))
}
```

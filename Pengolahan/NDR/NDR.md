### Net Difference Rate (NSR)
-------

**Tujuan** : 
Untuk menentukan estimasi kesalahan isian 

**Nama variabel** : 
- Yi_row  = jumlah kasus di long form tidak tertimbang pada kategori ke-i 
- Yi_col  = jumlah kasus di PKL tidak tertimbang pada kategori ke-i
- n_row = banyaknya kategori respon untuk karakteristik “y” row.
- n_col = banyaknya kategori respon untuk karakteristik “y” column.
- n = jumlah kasus

**Flowchart** : 

![Flowchart NDR!](/Pengolahan/NDR/NDR.jpg "NDR")


**Syntax** : 
```R
ndr_func <- function(Yi_row,Yi_col) {
  n_col <- length(Yi_col)
  n_row <- length(Yi_row)  # matrix input harus simetris
  n <- sum(Yi_row) 
  
  NDR <- c() #intiation vector
  
  for (i in 1:n_row) {
    NDR[i] <- 100*((Yi_row[i] - Yi_col[i]) / n)
  }
  return(NDR)
}

```

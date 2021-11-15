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

![Flowchart NDR!](/Pengolahan/NDR/GDR.png "GDR")


**Syntax** : 
```R
NSR_func <- function(Yi_row,Yi_col) {

}
```

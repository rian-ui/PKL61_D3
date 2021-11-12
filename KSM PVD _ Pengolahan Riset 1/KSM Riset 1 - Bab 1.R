# D. Dasar-Dasar Penggunaan R

# Fungsi dari R sebagai kalkulator:

5-1+10 # add and subtract

7*10/2 # Multiply and divide

pi # the constant pi

sqrt(2) # square root

exp(1) # e to the power of 1


# Contoh untuk memberikan sebuah nilai kepada sebuah objek:

x <- 5 # x berisi nilai 5
x #print x

6 -> x # x berisi nilai 6
x

(x <- pi) # x berisi nilai dari konstanta pi


# Menjalankan fungsi di R

print(x) # x

ls() # list semua objek yang ada

rm(x) # remove x dari workspace


# E. Bantuan serta Dokumentasi

## menampilkan bantuan tentang fungsi mean ##
help (mean)

## menampilkan bantuan tentang fungsi cor ##
?cor

## menampilkan contoh penggunaan fungsi cor ##
example (cor)


# G. Operator Aritmatika dan Logika

x <- 1 : 3 # nilai 1, 2, 3
x^2 #kuadrat

5 == 4 & 5 == 5 # kondisi FALSE dan TRUE == FALSE

5 != 4 & 5 == 5 # kondisi TRUE dan TRUE == FALSE

5 > 6


# H. Tipe Objek

## vektor ##

v <- 1 : 10 # membuat vektor v dengan elemen 1 s/d 10 #
v

v <- c(1, 5, 3) # (fungsi c() menggabungkan elemen-elemen menjadi vektor)
v

vc1 <- seq(from=1, to=100, by=10) # membuat vektor dengan interval
vc1


# Vektor juga bisa berisi data logikal (true/false) ataupun berisi karakter (string).

## logical vector

logical_vector <- c(T, TRUE, F, FALSE) # membuat vektor logikal
logical_vector


## vektor string

s <- c("Jakarta", "Malang", "Surabaya")
s

# Operasi pada Vektor

vc2 <- seq(from=1, to=100, by=10)
vc2

length(vc2)

sum(vc2)


# Operasi Aritmatika pada vektor

x <- 100 : 100
x

x * 2 ## perkalian dengan skalar

x / 2 # pembagian dengan skalar

x - 1

x <- c(10,20,30)
y <- c(2,2,2)
x
y

x*y # perkalian setiap komponen dari vektor

x/y

x %*% y #perkalian vektor


# Subset dan Indeks Vektor

## Extract elemen ke 1 dan 3 dari vektor: #

x[c(1, 3)]

## elemen dari vector selain elemen ke 2:

x[-2]


#Faktor

factor(1:3) ## default jumlah level akan sama dengan jumlah angka unik

factor(1:3, levels=1:5)

# mendefinisikan level yang ada, dari 5 level,
# yang terdapat pada factor ini hanya 3.

factor(1:3, labels=c('A', 'B', 'C')) # memberikan nama level


# membuat sebuah vector berisi string

type <- rep(c("High","Medium","Low"),times=10)
type <-factor(type)
type

grade <- rep(c("Grade1","Grade2","Grade3","Grade4"),each=5)
grade <-factor(grade)
grade


# Matriks

mat <- matrix(c(2,3,1,5,4,5,6,7,2,3,1,5,4,5,6,7),nrow=4,ncol=4)
mat

mat2 <- matrix(1:20,nrow=4,ncol=5)
mat2

dim(mat2) # dimensi dari matrik mat2


# Operasi Matriks

## Perkalian Skalar

A <- matrix(c(1,3,2,4,8,7),ncol=3)
A

8*A

## Penjumlahan Matriks

A

B <- matrix(c(5,8,3,4,2,7),ncol=3,byrow=T)
B

A+B

## Perkalian Matrikss(Dot Product)

A1 <- matrix(c(1,3,2,2,8,9),ncol=2)

B1 <- matrix(c(5,8,4,2),ncol=2)
A1
B1

A1 %*% B1 # dot product

t(A1) # Transpose

## Diagonal dari Matriks

diag(A1)

## Determinant Matriks, harus berupa matrix bujur sangkar

det(B1)

## Inverse Matriks, harus berupa matrix bujur sangkar

solve(B1)


# Data Frame

data1 <- data.frame(ID=1:20, grade, sex=rep(c("male","female"),each=10))
data1

head(data1) ## memperlihatkan 6 pengamatan awal

tail(data1) ## memperlihatkan 6 pengamatan akhir

dim(data1) ## dimensi dari data

## Melakukan ekstraksi baris berdasarkan kriteria tertentu

data1[ data1$sex=="male",]


# Binding

A1

B1

A

## column binding ##

D <- cbind(A,B1)
D

## row binding ##

rbind(A1,B1)


# List

myList <- list(A1, B1, 5, "flanders", grade)
myList


# I. Manajemen Data

# Import Data

## txt file ##

mydata <- read.table("C:/users/Documents/exampleData/data1.txt", + header=TRUE)
mydata

## Csv file ##

chik <- read.csv("C:/Users/Documents/exampleData/chickenData.csv")
head(chick)



## Unduh Data dari Internet ##

bindata <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
head(bindata)


#Dengan fungsi scan() kita bisa menentukan mode dari variabel-variabel yang kita impor.

mydata2 <- scan("data2.txt", what=list("", 0, 0))
mydata2


# Import Data dari Software Statistik Lain

## Memerlukan tambahan package foreign ##

require(foreign)

## SPSS files

dat.spss <- read.spss("hsb2.sav",to.data.frame=TRUE)

## Stata files

dat.dta <- read.dta("hsb2.dta")


#Menyimpan Data ke dalam File

## list available data in R #
# data()
# load data chicken (available from base)

data(chickwts)

## view the first few rows of the data

head(chickwts)

## Menyimpan dalam bentuk csv file

write.csv(chickwts,file="chickenData.csv")

## Menyimpan dalam bentuk txt file

write.table(chickwts,file="chickenData.txt")


# J. Manajemen Objek

# Contoh dengan command line

## Buat Object ##

x <- 1:2 ; y <- 2:3 ; z <- "ID"

## Melihat isi woorkspace ##

ls()

## Menghilangkan satu objek ##

rm(x)

ls()

## Menyimpan Seluruh objek yang ada ##

save.image("~/Contoh.RData")

ls()

## Menyimpan hanya 1 objek

## save(z, file="C:Users/MyPC/Documents/R")

## Menyimpan beberapa objek (z dan y)

## save(list = c("z", "y"), file= "C:/Users/stis/Documents/contoh.RData")


# Missing Data

## set x sebagai Missing ##

x <- NA

x+4

log(x)

is.na(x)

## Missing dalam sebuah vector

x <- c(1,2,NA,4)
x

# Mengecek missing values #

is.na(x)

# Menghitung jumlah missing #

sum(is.na(x))

# Missingnes dalam matrix #

## Membuat matrix ##

mat1 <- matrix(c(1:19,NA), 4,5)
mat1

is.na(mat1)

## Complete case memberikan kondisi (TRUE/FALSE) dari baris
## yang terdapat missing values

complete.cases(mat1)

## Memilih baris yang tidak terdapat missingness

mat1[complete.cases(mat1),]
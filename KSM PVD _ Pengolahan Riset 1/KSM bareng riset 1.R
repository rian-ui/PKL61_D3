data1<-data.frame(NULL)
fix(data1)

data2<-read.csv(C:/Users/LENOVO/Downloads/archive/Iris.csv)
head(data2) 

library(readxl)
url<-"D:/Users/LENOVO/Downloads/archive/Iris.xlsx"
dataset<- read_excel(url)

url_data<-read.csv("https://archive.ics.uci.edu/ml/datasets/iris.csv")
url_data
head(url_data)

##load data##
library(car)
data("cars")
head(cars)
##menyimpan dalam bentuk file csv##
write.csv(cars, file="Cars.csv")

##set x sebagai missing##
x<-NA
x+4
log(x)
is.na(x)
##Missing dalam sebuah vector##
x<-c(1,2,NA,4)
x
##Mengecek missing values##
is.na(x)
##menghitung jumlah missing value##
sum(is.na(x))
##missing dalam matrix##
##membuat matrix##
mat1<-matrix(c(1:19, NA),4,5)
mat1
is.na(mat1)
##complete case memberikan kondisi(TRUE/FALSE)
##dari baris yang terdapat missing value
complete.cases(mat1)
##memilih baris yang tidak terdapat missing value##
mat1[complete.cases(mat1),]

##scatterplot dengan mendifinisikan nilai pada sumbu x
## dan sumbu y(xlim dan ylim)
plot(state.x77[,3],state.x77[,6], xlab = "Illiteracy", ylab = "High School 
     Graduate", col=2, pch=16, main = "Scatter Plot", xlim = c(0,3), 
     ylim = c(0,100))
##menambah garis regresi
abline(lm(state.x77[,6]~state.x77[,3]), lwd=2, col="blue")

par(mfrow=c(1,2))#set gambar menjadi 2 kolom
##Histogram frekuensi
hist(cars$speed, xlab="Speed", main="Histogram of Speed")
##Histogram dengan density plot
hist(cars$speed, prob=TRUE, xlab="Speed", main="Histogram of Speed", col="grey")
lines(density(cars$speed), lwd=2)#menggambar garis density

##boxplot
##input data
A<-c(12.9, 13.5, 12.8, 13.6, 17.2, 13.2, 12.6, 15.3, 14.4, 11.3)
B<-c(14.7, 15.6, 15.0, 15.2, 16.8, 20.0, 12.0, 15.9, 16.0, 13.1)
##digabung dalam matrix
dt<-cbind(A,B)
boxplot(dt, xlab="group", ylab="waktu(detik)", main="Boxplot Waktu & Group")

##stem leaf plot
stem(cars$speed)

##bar chart
barplot(table(chickwts$feed), xlab = "Feed", ylab = "Frequency", 
        density = c(10,20,30,40,50), border = "blue", col = 2)

##Input Data
tahun<-c(2009, 2010, 2011, 2012, 2013)
dki<-c(0.36, 0.36, 0.44, 0.42,0.433)
jabar<-c(0.36,0.36,0.41,0.41,0.411)
jateng<-c(0.32,0.34,0.38,0.38,0.387)
yogya<-c(0.38,0.41,0.40,0.43,0.43)
##Menggabungkan variabel
dt1<-cbind(dki, jabar, jateng , yogya)
##membuat barchart
barplot(dt1, xlab="Provinsi", col=rainbow(5), ylab="Gini Ratio", beside=TRUE, 
        ylim=c(0,0.5))
legend("topleft",c("2009","2010","2011","2012","2013"), cex = 0.7, bty = "n",
       fill = rainbow(5))

dim(state.x77)#mengecek dimensi data
state.x77<-data.frame(state.x77)#ubah jadi data frame untuk mempermudah
#ukuran pemusatan untuk variabel income
mean(state.x77$Income)#menghirung rata-rata
median(state.x77$Income)
##kuantil (Q1, Q2(median),Q3)
quantile(state.x77$Income, c(0.25,0.50,0.75))
##desil ke 2
quantile(state.x77$Income, c(0.20))
##persentil ke 99
quantile(state.x77$Income, c(0.99))

##min max
min(state.x77$Income)
max(state.x77$Income)
which.max(state.x77$Income)#observasi income terbesar
##ukuran penyebaran
range(state.x77$Income)
sd(state.x77$Income)
var(state.x77$Income)

##menampilkan semua statistik
summary(state.x77)

##menghitung korelasi
cor(state.x77[,2:5])

##Statistik deskriptif data kategorik
state.x77<-data.frame(state.x77)#ubah ke data frame
##membuat 3 variabel kategorik baru
state.x77$grpPop<-cut(state.x77$Population, breaks = c(0,3000,10000,Inf), labels = c("low", "medium","high"))
state.x77$grpInc<-ifelse(state.x77$Income<=median(state.x77$Income), "low","high")
state.x77$grpFrost<-cut(state.x77$Frost, breaks = quantile(state.x77$Frost, c(0, 0.25, 0.5, 0.75,1)),labels = c("hot","warm","chill","cold"))
head(state.x77)

##tabel frekuensi##
table(state.x77$grpPop)#1-way frequency table
tab1<-table(state.x77$grpFrost,state.x77$grpInc)#2-way frequency table
tab1
tab2<-table(state.x77$grpFrost,state.x77$grpPop, state.x77$grpInc)#3-way frequency table
tab2

margin.table(tab1,1)#jumlah per baris 
margin.table(tab1,2)#jumlah per kolom
prop.table(tab1)#presentase total
prop.table(tab1, 1)#presentase per baris
prop.table(tab1, 2)#presentase per kolom

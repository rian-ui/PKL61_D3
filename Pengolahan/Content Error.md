# content error
--------------------------------------------------------------------------------

## **1. Mengklasifikasikan data berdasarkan kategori yang ada**

Syntax yang digunakan : [pengklasifikasian](/Pengolahan/classification/category-i.md)

output dalam bentuk matrix

## **2. Membentuk input untuk rumus**

input data dalam bentuk matrix

|            | kategori-1 | kategori-2 | .... | kategori-i |
|------------|------------|------------|------|------------|
| kategori-1 |            |            |      |            |
| kategori-2 |            |            |      |            |
| ....       |            |            |      |            |
| kategori-j |            |            |      |            |

 dikonstruksi menjadi

|            | kategori-1 | kategori-2 | .... | kategori-i | yi_row |
|------------|------------|------------|------|------------|--------|
| kategori-1 |            |            |      |            |        |
| kategori-2 |            |            |      |            |        |
| ....       |            |            |      |            |        |
| kategori-j |            |            |      |            |        |
| yi_col     |            |            |      |            |    n   |

Syntax yang digunakan :

sehingga menghasilkan output :
**vektor** yi_row ,
**vektor** yi_col ,
**vektor** yi_diag

## **3. Rumus**

NSR
-
Deskripsi singkat : [rumus NSR](https://github.com/rian-ui/PKL61_D3/tree/main/Pengolahan/NSR/rumus_NSR.md)

Syntax yang digunakan : [NSR](https://github.com/rian-ui/PKL61_D3/tree/main/Pengolahan/NSR/NSR.md)

*input* : **vektor** yi_row , **vektor** yi_col

*output* : **vektor** NSR


NDR
-
Deskripsi singkat : [rumus NDR](https://github.com/rian-ui/PKL61_D3/tree/main/Pengolahan/NSR/rumus_NSR.md)

Syntax yang digunakan : [NDR](https://github.com/rian-ui/PKL61_D3/blob/main/Pengolahan/NDR/NDR.md)

*input* : **vektor** yi_row , **vektor** yi_col

*output* : **vektor** NDR


GDR
-
Deskripsi singkat : [rumus GDR](https://github.com/rian-ui/PKL61_D3/tree/main/Pengolahan/NSR/rumus_NSR.md)

Syntax yang digunakan : [GDR](https://github.com/rian-ui/PKL61_D3/tree/main/Pengolahan/GDR/GDR.md)

*input* : **vektor** yi_row , **vektor** yi_col , **vektor** yi_diag

*output* : **vektor** GDR


IOI
-
Deskripsi singkat : [rumus IOI](https://github.com/rian-ui/PKL61_D3/tree/main/Pengolahan/NSR/rumus_NSR.md)

Syntax yang digunakan : [IOI](https://github.com/rian-ui/PKL61_D3/tree/main/Pengolahan/IOI/IOI.md)

*input* : **vektor** yi_row , **vektor** yi_col , **vektor** yi_diag

*output* : **vektor** IOI

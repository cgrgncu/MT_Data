# PhaseTensor簡介
主要從程式設計的觀點說明相關數學公式

### 參考資料
+ Caldwell, T. G., Bibby, H. M., & Brown, C. (2004). The magnetotelluric phase tensor. Geophysical Journal International, 158(2), 457-469.
+ Bibby, H. M., Caldwell, T. G., & Brown, C. (2005). Determinable and non-determinable parameters of galvanic distortion in magnetotellurics. Geophysical Journal International, 163(3), 915-930.
+ Booker, J. R. (2014). The magnetotelluric phase tensor a critical review. Surveys in Geophysics, 35(1), 7-40.

### 水平電場定義
+ 大地電磁法中，E單位為[mV/km]，f單位為[Hz]。
+ 大地電磁法中，x方向朝正北，y方向朝正東。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{E}\left(f\right)=\begin{bmatrix}
E_{x}\left(f\right)\\ 
E_{y}\left(f\right) 
\end{bmatrix}
$$

### 水平磁場定義
+ 大地電磁法中，單位為[nT]。
+ 大地電磁法中，x方向朝正北，y方向朝正東。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{H}\left(f\right)=\begin{bmatrix}
H_{x}\left(f\right)\\ 
H_{y}\left(f\right) 
\end{bmatrix}
$$

### 阻抗張量定義
+ 大地電磁法中，單位為[Ohm]。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{Z}\left(f\right)=\begin{bmatrix}
Z_{xx}\left(f\right)&Z_{xy}\left(f\right)\\ 
Z_{yx}\left(f\right)&Z_{yy}\left(f\right) 
\end{bmatrix}
$$



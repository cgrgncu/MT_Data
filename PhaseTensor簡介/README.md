# PhaseTensor簡介
主要從程式設計的觀點說明相關數學公式

### 參考資料
+ Caldwell, T. G., Bibby, H. M., & Brown, C. (2004). The magnetotelluric phase tensor. Geophysical Journal International, 158(2), 457-469.
+ Bibby, H. M., Caldwell, T. G., & Brown, C. (2005). Determinable and non-determinable parameters of galvanic distortion in magnetotellurics. Geophysical Journal International, 163(3), 915-930.
+ Booker, J. R. (2014). The magnetotelluric phase tensor a critical review. Surveys in Geophysics, 35(1), 7-40.

# 

### 水平電場定義
+ 大地電磁法中，E單位為[mV/km]，f單位為[Hz]。
+ 大地電磁法中，x方向朝正北，y方向朝正東。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{E}\left(f\right)=
\begin{bmatrix}
E_{x}\left(f\right)\\ 
E_{y}\left(f\right) 
\end{bmatrix}
$$

#

### 水平磁場定義
+ 大地電磁法中，單位為[nT]。
+ 大地電磁法中，x方向朝正北，y方向朝正東。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{H}\left(f\right)=
\begin{bmatrix}
H_{x}\left(f\right)\\ 
H_{y}\left(f\right) 
\end{bmatrix}
$$

#

### 阻抗張量(Impedance Tensor)定義
+ 大地電磁法中，單位為[Ohm]。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{Z}\left(f\right)=
\begin{bmatrix}
Z_{xx}\left(f\right)&Z_{xy}\left(f\right)\\ 
Z_{yx}\left(f\right)&Z_{yy}\left(f\right) 
\end{bmatrix}
$$

### 關係式

$$
\mathbf{E}\left(f\right)=
\mathbf{Z}\left(f\right)\mathbf{H}\left(f\right)
$$

$$
\begin{bmatrix}
E_{x}\left(f\right)\\ 
E_{y}\left(f\right) 
\end{bmatrix}=
\begin{bmatrix}
Z_{xx}\left(f\right)&Z_{xy}\left(f\right)\\ 
Z_{yx}\left(f\right)&Z_{yy}\left(f\right) 
\end{bmatrix}
\begin{bmatrix}
H_{x}\left(f\right)\\ 
H_{y}\left(f\right) 
\end{bmatrix}
$$

### 關係式(只看單一頻率時)

$$
\mathbf{E}=
\mathbf{Z}\mathbf{H}
$$

$$
\begin{bmatrix}
E_{x}\\ 
E_{y} 
\end{bmatrix}=
\begin{bmatrix}
Z_{xx}&Z_{xy}\\ 
Z_{yx}&Z_{yy} 
\end{bmatrix}
\begin{bmatrix}
H_{x}\\ 
H_{y}
\end{bmatrix}
$$

#

### 阻抗張量實部矩陣定義(只看單一頻率時)
+ 大地電磁法中，單位為[Ohm]。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是實數型式。

$$
\mathbf{X}=
\begin{bmatrix}
X_{xx}&X_{xy}\\ 
X_{yx}&X_{yy} 
\end{bmatrix}
$$

### 阻抗張量實部矩陣關係式(只看單一頻率時)

$$
\mathbf{X}=
\operatorname{Re}\begin{Bmatrix}\mathbf{Z}\end{Bmatrix}
$$

$$
\begin{bmatrix}
X_{xx}&X_{xy}\\ 
X_{yx}&X_{yy} 
\end{bmatrix}=
\begin{bmatrix}
\operatorname{Re}\begin{Bmatrix}Z_{xx}\end{Bmatrix}&\operatorname{Re}\begin{Bmatrix}Z_{xy}\end{Bmatrix}\\ 
\operatorname{Re}\begin{Bmatrix}Z_{yx}\end{Bmatrix}&\operatorname{Re}\begin{Bmatrix}Z_{yy}\end{Bmatrix} 
\end{bmatrix}
$$

#

### 阻抗張量虛部矩陣定義(只看單一頻率時)
+ 大地電磁法中，單位為[Ohm]。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是實數型式。

$$
\mathbf{Y}=
\begin{bmatrix}
Y_{xx}&Y_{xy}\\ 
Y_{yx}&Y_{yy} 
\end{bmatrix}
$$

### 阻抗張量虛部矩陣關係式(只看單一頻率時)

$$
\mathbf{Y}=
\operatorname{Im}\begin{Bmatrix}\mathbf{Z}\end{Bmatrix}
$$

$$
\begin{bmatrix}
Y_{xx}&Y_{xy}\\ 
Y_{yx}&Y_{yy} 
\end{bmatrix}=
\\begin{bmatrix}
\operatorname{Im}\begin{Bmatrix}Z_{xx}\end{Bmatrix}&\operatorname{Im}\begin{Bmatrix}Z_{xy}\end{Bmatrix}\\ 
\operatorname{Im}\begin{Bmatrix}Z_{yx}\end{Bmatrix}&\operatorname{Im}\begin{Bmatrix}Z_{yy}\end{Bmatrix} 
\end{bmatrix}
$$

#

### 相位張量(Phase Tensor)定義
+ 大地電磁法中，無單位。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是實數型式。

$$
\mathbf{\Phi}\left(f\right)=\begin{bmatrix}
\Phi_{xx}\left(f\right)&\Phi_{xy}\left(f\right)\\ 
\Phi_{yx}\left(f\right)&\Phi_{yy}\left(f\right) 
\end{bmatrix}
$$

### 關係式

$$
\mathbf{\Phi}\left(f\right)=\mathbf{X}\left(f\right)^{-1}\mathbf{Y}\left(f\right)
$$

$$
\begin{bmatrix}
\Phi_{xx}\left(f\right)&\Phi_{xy}\left(f\right)\\ 
\Phi_{yx}\left(f\right)&\Phi_{yy}\left(f\right) 
\end{bmatrix}=
\frac{
1
}
{
\left(X_{xx}\left(f\right)X_{yy}\left(f\right)-X_{yx}\left(f\right)X_{xy}\left(f\right)\right)
}
\begin{bmatrix}
X_{yy}\left(f\right)Y_{xx}\left(f\right)-X_{xy}\left(f\right)Y_{yx}\left(f\right)&
X_{yy}\left(f\right)Y_{xy}\left(f\right)-X_{xy}\left(f\right)Y_{yy}\left(f\right)\\ 
X_{xx}\left(f\right)Y_{yx}\left(f\right)-X_{yx}\left(f\right)Y_{xx}\left(f\right)&
X_{xx}\left(f\right)Y_{yy}\left(f\right)-X_{yx}\left(f\right)Y_{xy}\left(f\right)
\end{bmatrix}
$$

### 關係式(只看單一頻率時)

$$
\mathbf{\Phi}=\mathbf{X}^{-1}\mathbf{Y}
$$

$$
\begin{bmatrix}
\Phi_{xx}&\Phi_{xy}\\ 
\Phi_{yx}&\Phi_{yy}
\end{bmatrix}=
\frac{
1
}
{
\left(X_{xx}X_{yy}-X_{yx}X_{xy}\right)
}
\begin{bmatrix}
X_{yy}Y_{xx}-X_{xy}Y_{yx}&
X_{yy}Y_{xy}-X_{xy}Y_{yy}\\ 
X_{xx}Y_{yx}-X_{yx}Y_{xx}&
X_{xx}Y_{yy}-X_{yx}Y_{xy}
\end{bmatrix}
$$

#



# PhaseTensor簡介
以程式設計的實作為目的，整理相關數學公式。  
> 作者: HsiupoYeh  
> 更新日期: 2022-09-17  

### 參考資料
+ Caldwell, T. G., Bibby, H. M., & Brown, C. (2004). The magnetotelluric phase tensor. Geophysical Journal International, 158(2), 457-469.
+ Bibby, H. M., Caldwell, T. G., & Brown, C. (2005). Determinable and non-determinable parameters of galvanic distortion in magnetotellurics. Geophysical Journal International, 163(3), 915-930.
+ Booker, J. R. (2014). The magnetotelluric phase tensor a critical review. Surveys in Geophysics, 35(1), 7-40.

# 

### 水平電場定義
+ 大地電磁法中，E單位為[mV/km]，f單位為[Hz]。
+ 大地電磁法中，量測時x方向朝正北，y方向朝正東。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{E}\left(f\right)=
\begin{bmatrix}
E_{x}\left(f\right)\\ 
E_{y}\left(f\right) 
\end{bmatrix}
\mspace{36mu}\mspace{36mu}\text{(1)}
$$

#

### 水平磁場定義
+ 大地電磁法中，單位為[nT]。
+ 大地電磁法中，量測時x方向朝正北，y方向朝正東。
+ 不同頻率互相獨立，一次討論一個頻率。
+ 矩陣中每個元素都是複數型式。

$$
\mathbf{H}\left(f\right)=
\begin{bmatrix}
H_{x}\left(f\right)\\ 
H_{y}\left(f\right) 
\end{bmatrix}
\mspace{36mu}\mspace{36mu}\text{(2)}
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
\mspace{36mu}\mspace{36mu}\text{(3)}
$$

### 關係式

$$
\mathbf{E}\left(f\right)=
\mathbf{Z}\left(f\right)\mathbf{H}\left(f\right)
\mspace{36mu}\mspace{36mu}\text{(4)}
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
\mspace{36mu}\mspace{36mu}\text{(5)}
$$

### 關係式(只看單一頻率時)

$$
\mathbf{E}=
\mathbf{Z}\mathbf{H}
\mspace{36mu}\mspace{36mu}\text{(6)}
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
\mspace{36mu}\mspace{36mu}\text{(7)}
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
\mspace{36mu}\mspace{36mu}\text{(8)}
$$

### 阻抗張量實部矩陣關係式(只看單一頻率時)

$$
\mathbf{X}=
\operatorname{Re}\begin{Bmatrix}\mathbf{Z}\end{Bmatrix}
\mspace{36mu}\mspace{36mu}\text{(9)}
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
\mspace{36mu}\mspace{36mu}\text{(10)}
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
\mspace{36mu}\mspace{36mu}\text{(11)}
$$

### 阻抗張量虛部矩陣關係式(只看單一頻率時)

$$
\mathbf{Y}=
\operatorname{Im}\begin{Bmatrix}\mathbf{Z}\end{Bmatrix}
\mspace{36mu}\mspace{36mu}\text{(12)}
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
\mspace{36mu}\mspace{36mu}\text{(13)}
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
\mspace{36mu}\mspace{36mu}\text{(14)}
$$

### 關係式

$$
\mathbf{\Phi}\left(f\right)=\mathbf{X}\left(f\right)^{-1}\mathbf{Y}\left(f\right)
\mspace{36mu}\mspace{36mu}\text{(15)}
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
\mspace{36mu}\mspace{36mu}\text{(16)}
$$

### 關係式(只看單一頻率時)

$$
\mathbf{\Phi}=\mathbf{X}^{-1}\mathbf{Y}
\mspace{36mu}\mspace{36mu}\text{(17)}
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
\mspace{36mu}\mspace{36mu}\text{(18)}
$$

> 注意!計算上有可能存在分母為0，無法求取反矩陣的狀況。這樣的狀況下無法分析相位張量。

#

### 二維狀況下的特殊情形(只看單一頻率)
+ 在探討二維構造的阻抗張量時，必須先說明清楚阻抗張量量測的座標配置。
+ 當存在一個二維構造，其構造走向為方位角0度或180度時，阻抗張量量測時x方向朝正北，y方向朝正東。此時阻抗張量為:

$$
\mathbf{Z}^{2D,0^{\circ}}=
\begin{bmatrix}
Z_{xx}&Z_{xy}\\ 
Z_{yx}&Z_{yy}
\end{bmatrix}=
\begin{bmatrix}
0&Z_{xy}\\ 
Z_{yx}&0
\end{bmatrix}
\mspace{36mu}\mspace{36mu}\text{(19)}
$$

+ 其相位張量為:

$$
\mathbf{\Phi}^{2D,0^{\circ}}=
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

$$
\mathbf{\Phi}^{2D,0^{\circ}}=
\begin{bmatrix}
\Phi_{xx}&\Phi_{xy}\\ 
\Phi_{yx}&\Phi_{yy}
\end{bmatrix}=
\frac{
1
}
{
\left(0-X_{yx}X_{xy}\right)
}
\begin{bmatrix}
0-X_{xy}Y_{yx}&
0-0\\ 
0-0&
0-X_{yx}Y_{xy}
\end{bmatrix}
$$

$$
\mathbf{\Phi}^{2D,0^{\circ}}=
\begin{bmatrix}
\Phi_{xx}&\Phi_{xy}\\ 
\Phi_{yx}&\Phi_{yy}
\end{bmatrix}=
\frac{
1
}
{
\left(-X_{yx}X_{xy}\right)
}
\begin{bmatrix}
-X_{xy}Y_{yx}&
0\\ 
0&
-X_{yx}Y_{xy}
\end{bmatrix}=
\begin{bmatrix}
\frac{Y_{yx}}{X_{yx}}&0\\ 
0&\frac{Y_{xy}}{X_{xy}}
\end{bmatrix}
$$

$$
\mathbf{\Phi}^{2D,0^{\circ}}=
\begin{bmatrix}
\Phi_{xx}&\Phi_{xy}\\ 
\Phi_{yx}&\Phi_{yy}
\end{bmatrix}=
\begin{bmatrix}
\frac{Y_{yx}}{X_{yx}}&0\\ 
0&\frac{Y_{xy}}{X_{xy}}
\end{bmatrix}=
\begin{bmatrix}
\tan\left(\phi_{yx}\right)&0\\ 
0&\tan\left(\phi_{xy}\right)
\end{bmatrix}
\mspace{36mu}\mspace{36mu}\text{(20)}
$$

+ 當存在一個二維構造，其構造走向為方位角90度或270度時(不是常用的假設)，阻抗張量量測時x方向朝正北，y方向朝正東。此時阻抗張量為:

$$
\mathbf{Z}^{2D,90^{\circ}}=
\begin{bmatrix}
Z_{xx}&Z_{xy}\\ 
Z_{yx}&Z_{yy}
\end{bmatrix}=
\begin{bmatrix}
0&Z_{xy}\\ 
Z_{yx}&0
\end{bmatrix}
$$

+ 其相位張量為:

$$
\mathbf{\Phi}^{2D,90^{\circ}}=
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

$$
\mathbf{\Phi}^{2D,90^{\circ}}=
\begin{bmatrix}
\Phi_{xx}&\Phi_{xy}\\ 
\Phi_{yx}&\Phi_{yy}
\end{bmatrix}=
\frac{
1
}
{
\left(0-X_{yx}X_{xy}\right)
}
\begin{bmatrix}
0-X_{xy}Y_{yx}&
0-0\\ 
0-0&
0-X_{yx}Y_{xy}
\end{bmatrix}
$$

$$
\mathbf{\Phi}^{2D,90^{\circ}}=
\begin{bmatrix}
\Phi_{xx}&\Phi_{xy}\\ 
\Phi_{yx}&\Phi_{yy}
\end{bmatrix}=
\frac{
1
}
{
\left(-X_{yx}X_{xy}\right)
}
\begin{bmatrix}
-X_{xy}Y_{yx}&
0\\ 
0&
-X_{yx}Y_{xy}
\end{bmatrix}=
\begin{bmatrix}
\frac{Y_{yx}}{X_{yx}}&0\\ 
0&\frac{Y_{xy}}{X_{xy}}
\end{bmatrix}
$$

$$
\mathbf{\Phi}^{2D,90^{\circ}}=
\begin{bmatrix}
\Phi_{xx}&\Phi_{xy}\\ 
\Phi_{yx}&\Phi_{yy}
\end{bmatrix}=
\begin{bmatrix}
\frac{Y_{yx}}{X_{yx}}&0\\ 
0&\frac{Y_{xy}}{X_{xy}}
\end{bmatrix}=
\begin{bmatrix}
\tan\left(\phi_{yx}\right)&0\\ 
0&\tan\left(\phi_{xy}\right)
\end{bmatrix}
\mspace{36mu}\mspace{36mu}\text{(21)}
$$

> 實際上不會知道二維構造是哪一種，阻抗張量對角線元素都會是0。量測時是依照X朝北，Y朝東的方式去進行。  
> 這裡只是想指出相位張量與阻抗張量的相位角度是有關連的。  

#

### 相位張量的旋轉不變量
+ 相位張量的旋轉不變量「trace」:

$$
\text{phase tensor invariants trace}=\Phi_{xx}+\Phi_{yy}
\mspace{36mu}\mspace{36mu}\text{(22)}
$$
>參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).

+ 相位張量的旋轉不變量「skew」:

$$
\text{phase tensor invariants skew}=\Phi_{xy}-\Phi_{yx}
\mspace{36mu}\mspace{36mu}\text{(23)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).

+ 相位張量的旋轉不變量「determinant」:

$$
\text{phase tensor invariants determinant}=\Phi_{xx}\Phi_{yy}-\Phi_{xy}\Phi_{yx}
\mspace{36mu}\mspace{36mu}\text{(24)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).

+ 相位張量的旋轉不變量「beta」，單位為[rad]:

$$
\text{phase tensor invariants beta}=
\beta=
\frac{1}{2}\arctan\left(\frac{\Phi_{xy}-\Phi_{yx}}{\Phi_{xx}+\Phi_{yy}}\right)
\mspace{36mu}\mspace{36mu}\text{(25)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).

+ 相位張量的旋轉不變量「phimax」:

$$
\text{phase tensor invariants phimax}=
\Phi_{max}=
\frac{1}{2}
\left[
\left(\Phi_{xx}+\Phi_{yy}\right)^{2}+\left(\Phi_{xy}-\Phi_{yx}\right)^{2}
\right]^{1/2}+
\frac{1}{2}
\left[
\left(\Phi_{xx}-\Phi_{yy}\right)^{2}+\left(\Phi_{xy}+\Phi_{yx}\right)^{2}
\right]^{1/2}
\mspace{36mu}\mspace{36mu}\text{(26)}
$$
> 參考 Bibby, H. M., Caldwell, T. G., & Brown, C. (2005).

+ 相位張量的旋轉不變量「phimin」:

$$
\text{phase tensor invariants phimin}=
\Phi_{min}=
\frac{1}{2}
\left[
\left(\Phi_{xx}+\Phi_{yy}\right)^{2}+\left(\Phi_{xy}-\Phi_{yx}\right)^{2}
\right]^{1/2}-
\frac{1}{2}
\left[
\left(\Phi_{xx}-\Phi_{yy}\right)^{2}+\left(\Phi_{xy}+\Phi_{yx}\right)^{2}
\right]^{1/2}
\mspace{36mu}\mspace{36mu}\text{(27)}
$$
> 參考 Bibby, H. M., Caldwell, T. G., & Brown, C. (2005).

#

### 相位張量的其他變量
+ 相位張量的變量「alpha」，單位為[rad]，與座標系統有關的變量:

$$
\text{phase tensor alpha}=
\alpha=
\frac{1}{2}\arctan\left(\frac{\Phi_{xy}+\Phi_{yx}}{\Phi_{xx}-\Phi_{yy}}\right)
\mspace{36mu}\mspace{36mu}\text{(28)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).

#

### 繪圖用的橢圓參數
+ 橢圓半長軸a(semi-major-a)，就是phimax。

$$
\text{phase tensor ellipse semi major a}=
\Phi_{max}
\mspace{36mu}\mspace{36mu}\text{(29)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).  
> 因式(22)，在mtpy中也計算phimax的角度arctan(phimax)。

+ 橢圓半短軸b(semi-minor-b)，就是phimin。

$$
\text{phase tensor ellipse semi minor b}=
\Phi_{min}
\mspace{36mu}\mspace{36mu}\text{(30)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).  
> 因式(22)，在mtpy中也計算phimin的角度arctan(phimin)。

+ 橢圓旋轉角度theta(theta_in_degrees):
  + 旋轉角度值就是alpha-beta，使用時可將弧度轉成角度。
  + 若要繪製在地理系統上，參考座標x朝北，y朝東，則角度正向為北往東增加(順時鐘為正)，也就是方位角(Azimuth)的定義。
  
$$
\text{phase tensor ellipse angle theta}=
\alpha-\beta
\mspace{36mu}\mspace{36mu}\text{(31)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).  
> 文章中座標軸是使用x1，x2。對應我這裡的座標軸x，y。

#

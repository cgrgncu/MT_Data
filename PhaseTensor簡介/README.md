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
+ 大地電磁法中，E場常用單位為[V/m]，量測單位為[mV/km]，f單位為[Hz]。
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
+ 大地電磁法中，H場常用單位為[A/m]，量測單位為[nT]，f單位為[Hz]。
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
+ 大地電磁法中，阻抗Z常用單位為[Ohm]，量測單位為[mV/km/nT]。
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
+ 大地電磁法中，單位與阻抗Z相同。
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
+ 大地電磁法中，單位與阻抗Z相同。
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
> 相位張量的計算會消去單位，因此阻抗Z的單位為[mV/km/nT]或[Ohm]都不影響計算。

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

$$
\phi_{yx}=\arg\left(Z_{yx}\right)
$$

$$
\phi_{xy}=\arg\left(Z_{xy}\right)
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

$$
\phi_{yx}=\arg\left(Z_{yx}\right)
$$

$$
\phi_{xy}=\arg\left(Z_{xy}\right)
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

+ 因式(22)，在mtpy中計算phimax的角度arctan(phimax)單位[rad]，轉換成角度後來繪圖。

$$
\text{phase tensor ellipse semi major a}=
arctan\left(\Phi_{max}\right)=
\phi_{max}=
\text{phase tensor phimax angle}
\mspace{36mu}\mspace{36mu}\text{(30)}
$$
> 不太清楚原因，但原始碼註解掉本文的式(29)，改用式(30)。所以我就跟著算。  

+ 橢圓半短軸b(semi-minor-b)，就是phimin。

$$
\text{phase tensor ellipse semi minor b}=
\Phi_{min}
\mspace{36mu}\mspace{36mu}\text{(31)}
$$
> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).  

+ 因式(22)，在mtpy中計算phimin的角度arctan(phimin)單位[rad]，轉換成角度後來繪圖。

$$
\text{phase tensor ellipse semi minor b}=
arctan\left(\Phi_{min}\right)=
\phi_{min}=
\text{phase tensor phimin angle}
\mspace{36mu}\mspace{36mu}\text{(32)}
$$
> 不太清楚原因，但原始碼註解掉本文的式(31)，改用式(32)。所以我就跟著算。 

+ 橢圓旋轉角度azimuth(azimuth_in_degrees):
  + 旋轉角度值就是alpha-beta，使用時可將弧度轉成角度。
  + 若要繪製在地理系統上，參考座標x朝北，y朝東，則角度正向為北往東增加(順時鐘為正)，也就是方位角(Azimuth)的定義。
  
$$
\text{phase tensor ellipse azimuth angle}=
\alpha-\beta
\mspace{36mu}\mspace{36mu}\text{(33)}
$$

> 參考 Caldwell, T. G., Bibby, H. M., & Brown, C. (2004).  
> 文章中座標軸是使用x1，x2。對應我這裡的座標軸x，y。

#

範例程式碼;
```Matlab
%**************************************************************************
%   Name: phase_tensor_calculation_demo_v20220917a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20220917a
%   Description: 示範如何計算Phase Tensor
%**************************************************************************
clear;clc;close all
%--------------------------------------------------------------------------
% 準備輸入資料:
% 可以直接從EDI檔案中找到該區塊後複製貼上，不夠的欄位補NaN
% 以下取自「https://raw.githubusercontent.com/MTgeophysics/mtpy/develop/examples/data/edi_files_2/Synth00.edi」
EDI_FREQ_Array=[
   1.256500e+04   9.751601e+03   7.876300e+03   6.188500e+03   5.250801e+03   4.265799e+03
   3.515799e+03   8.437800e+02   6.562798e+02   4.922399e+02   3.867599e+02   3.164400e+02
   2.578400e+02   2.109600e+02   1.728900e+02   1.367200e+02   1.015600e+02   7.421900e+01
   5.761700e+01   4.882800e+01   4.101600e+01   3.222700e+01   2.636700e+01   2.148400e+01
   1.757800e+01   1.440400e+01   1.147500e+01   8.593800e+00   6.591801e+00   5.371100e+00
   4.394500e+00   3.601100e+00   2.868700e+00   2.304700e+00   1.914100e+00   1.601600e+00
   1.328100e+00   1.074200e+00   8.789100e-01   6.835900e-01   5.078100e-01   3.710900e-01
   2.880900e-01   2.050800e-01   1.318400e-01   8.789098e-02   6.835900e-02   5.127000e-02
   4.028299e-02   3.295900e-02   2.685500e-02   2.197300e-02   1.709000e-02   1.281700e-02
   1.007100e-02   8.239700e-03   6.713900e-03   5.493201e-03   4.272499e-03   2.822900e-03
   2.059900e-03   1.678500e-03   1.373300e-03   1.068100e-03   7.629400e-04   NaN
];
EDI_ZXXR_Array=[
   2.658566e+01   1.243271e+01   7.652151e+00   3.594740e+00  -3.674825e-01   3.453961e+00
   3.756984e+00   3.209965e+00   3.609765e+00   3.463911e+00   3.575702e+00   3.434952e+00
   2.906235e+00   2.587779e+00   2.462508e+00   1.406452e+00   1.188551e+00   1.037259e+00
   9.785455e-01   8.781034e-01   7.759836e-01   6.964962e-01   6.213150e-01   5.017520e-01
   4.577322e-01   3.889218e-01   4.243775e-01   3.193210e-01   4.213345e-01   3.425539e-01
   2.978230e-01   2.175461e-01   1.590911e-01   1.072897e-01  -2.799898e-03  -1.347087e-02
  -4.358014e-02  -1.579656e-02  -5.903449e-02  -1.346712e-01  -2.161052e-01  -1.879036e-01
  -1.620059e-01  -9.348918e-02  -3.608766e-01  -2.414670e-01  -2.089190e-01  -1.040996e-01
  -1.331606e-01  -1.016379e-01  -8.328290e-02  -5.818395e-02  -2.188241e-02  -1.138622e-02
   2.321684e-02   2.806143e-02   3.072585e-02   2.787188e-02   4.747734e-02   3.563594e-02
   9.011109e-03   1.228654e-02   7.651424e-03  -1.541766e-02  -1.016358e-02   NaN
];
EDI_ZXXI_Array=[
  -4.302123e+00   7.519158e+00   6.287030e+00   1.225811e+00  -1.583942e+00   8.805454e-01
   4.193609e+00   1.166600e+00   1.447528e+00   3.908376e-01   1.085047e+00   1.188977e+00
   1.800474e+00   1.880788e+00   1.763478e+00   6.623652e-01   7.010497e-01   7.040688e-01
   7.777588e-01   6.682327e-01   6.466081e-01   6.122341e-01   5.566196e-01   5.176239e-01
   4.181364e-01   4.054884e-01   3.542619e-01   3.090869e-01   2.741094e-01   3.244542e-01
   3.560825e-01   3.823091e-01   3.634034e-01   3.457740e-01   3.276648e-01   2.989610e-01
   2.467770e-01   2.139293e-01   2.041490e-01   1.246237e-01   1.853198e-01   1.152695e-01
   1.517314e-01  -2.502211e-02   4.985115e-02  -1.473397e-01  -9.304709e-02  -1.467822e-01
  -1.062641e-01  -1.388724e-01  -1.366898e-01  -1.231109e-01  -7.717233e-02  -5.247007e-02
  -3.530495e-02  -2.947961e-02  -3.860370e-02  -5.165296e-02  -5.006283e-02  -1.770373e-02
  -1.479694e-02  -6.021372e-03  -1.431559e-03   1.752368e-02   2.475275e-02   NaN
];
EDI_ZXYR_Array=[
   4.824492e+02   4.348246e+02   3.983996e+02   3.625121e+02   3.353787e+02   2.968256e+02
   2.681699e+02   9.801966e+01   8.218026e+01   7.131865e+01   6.000727e+01   5.331487e+01
   4.695992e+01   4.143343e+01   3.731538e+01   3.394484e+01   2.883702e+01   2.441290e+01
   2.153307e+01   1.962669e+01   1.813655e+01   1.593713e+01   1.433673e+01   1.271367e+01
   1.145671e+01   1.016765e+01   8.947801e+00   7.431706e+00   6.453972e+00   5.716458e+00
   5.128468e+00   4.659232e+00   4.239728e+00   3.880730e+00   3.461806e+00   3.426009e+00
   3.330268e+00   3.208448e+00   3.074718e+00   2.990142e+00   2.904536e+00   2.756827e+00
   2.580514e+00   2.422984e+00   1.990257e+00   1.505134e+00   1.091229e+00   7.890157e-01
   6.694798e-01   5.234419e-01   4.464377e-01   3.254746e-01   2.358554e-01   1.721999e-01
   1.195286e-01   9.858162e-02   8.187322e-02   7.314403e-02   5.227652e-02   5.590862e-02
   5.415417e-02   4.707529e-02   3.995551e-02   4.024812e-02   3.422179e-02   NaN
];
EDI_ZXYI_Array=[
   6.047747e+02   5.146176e+02   4.600998e+02   4.132823e+02   3.877938e+02   3.235323e+02
   3.062158e+02   1.369020e+02   1.174120e+02   1.046823e+02   8.851186e+01   7.819783e+01
   6.750758e+01   5.877950e+01   5.232645e+01   4.526241e+01   3.745380e+01   3.087703e+01
   2.675851e+01   2.409339e+01   2.201593e+01   1.919147e+01   1.713903e+01   1.519034e+01
   1.377380e+01   1.225580e+01   1.096544e+01   9.113115e+00   7.910516e+00   6.863251e+00
   5.968507e+00   5.185713e+00   4.427694e+00   3.766602e+00   3.619621e+00   3.041058e+00
   2.524714e+00   2.218360e+00   1.899802e+00   1.701367e+00   1.461050e+00   1.375388e+00
   1.376085e+00   1.433590e+00   1.469154e+00   1.539603e+00   1.319382e+00   1.184192e+00
   1.040631e+00   9.438967e-01   8.604996e-01   7.352724e-01   5.644008e-01   4.607889e-01
   3.511220e-01   3.157520e-01   2.731422e-01   2.340695e-01   1.991748e-01   1.410541e-01
   9.234909e-02   8.337540e-02   6.947898e-02   5.264070e-02   3.763743e-02   NaN
];
EDI_ZYXR_Array=[
  -4.100502e+02  -3.727205e+02  -3.499875e+02  -3.280029e+02  -3.277859e+02  -2.797794e+02
  -2.519683e+02  -9.266794e+01  -8.379513e+01  -7.423936e+01  -6.375719e+01  -5.681381e+01
  -4.972099e+01  -4.402522e+01  -3.990257e+01  -3.601919e+01  -3.063605e+01  -2.594124e+01
  -2.304371e+01  -2.092824e+01  -1.924923e+01  -1.689579e+01  -1.518163e+01  -1.346538e+01
  -1.192839e+01  -1.084555e+01  -9.404972e+00  -7.626568e+00  -6.823776e+00  -5.877595e+00
  -5.244792e+00  -4.721054e+00  -4.408894e+00  -4.170796e+00  -3.857204e+00  -3.921780e+00
  -3.854953e+00  -3.760756e+00  -3.689559e+00  -3.615983e+00  -3.477928e+00  -3.356393e+00
  -3.139189e+00  -2.962951e+00  -2.312919e+00  -1.448924e+00  -1.242078e+00  -9.269332e-01
  -7.600778e-01  -5.990123e-01  -5.075455e-01  -4.263306e-01  -3.247508e-01  -2.717795e-01
  -1.898881e-01  -1.724216e-01  -1.493772e-01  -1.182484e-01  -8.455949e-02  -1.085374e-01
  -7.198799e-02  -6.386603e-02  -4.364655e-02  -9.709792e-03  -2.001528e-03   NaN
];
EDI_ZYXI_Array=[
  -8.004257e+02  -6.664020e+02  -5.803959e+02  -5.015329e+02  -4.368314e+02  -3.856398e+02
  -3.765960e+02  -1.467637e+02  -1.245086e+02  -1.081530e+02  -9.302990e+01  -8.223500e+01
  -7.095765e+01  -6.209924e+01  -5.544039e+01  -4.710783e+01  -3.914769e+01  -3.240584e+01
  -2.834335e+01  -2.547992e+01  -2.324778e+01  -2.034067e+01  -1.820030e+01  -1.620360e+01
  -1.451214e+01  -1.325202e+01  -1.171541e+01  -9.647815e+00  -8.414254e+00  -7.154078e+00
  -6.118188e+00  -5.228230e+00  -4.347445e+00  -3.544128e+00  -3.454334e+00  -2.843568e+00
  -2.470188e+00  -2.149148e+00  -1.943057e+00  -1.725688e+00  -1.620651e+00  -1.590739e+00
  -1.581329e+00  -1.649027e+00  -1.796222e+00  -1.538713e+00  -1.366335e+00  -1.199774e+00
  -1.074724e+00  -9.366896e-01  -8.202547e-01  -7.525597e-01  -6.017811e-01  -4.898449e-01
  -4.319680e-01  -3.762331e-01  -3.005506e-01  -2.728252e-01  -1.998375e-01  -1.694900e-01
  -1.609059e-01  -1.341358e-01  -1.087094e-01  -7.155360e-02  -4.209661e-02   NaN
];
EDI_ZYYR_Array=[
   8.994784e+00   1.764062e+01   2.157495e+01   2.502421e+01   4.630223e+01   2.202313e+01
   1.626138e+01   2.161730e+00   3.377964e+00   2.405783e+00   1.773107e+00   1.194913e+00
   8.553721e-01   4.174481e-01   4.967671e-01  -1.919865e+00  -1.632885e+00  -1.359169e+00
  -1.193141e+00  -1.028038e+00  -9.697726e-01  -8.385359e-01  -7.440963e-01  -6.964777e-01
  -5.863319e-01  -5.267490e-01  -4.586241e-01  -5.103739e-01  -2.946204e-01  -3.939833e-01
  -3.738818e-01  -3.111766e-01  -2.005659e-01  -1.103472e-01   9.312035e-03   9.763210e-02
   1.207689e-01   2.069805e-01   2.654815e-01   4.316310e-01   5.397060e-01   5.965809e-01
   6.322249e-01   6.706970e-01   6.672919e-01   4.624036e-01   5.025113e-01   3.026575e-01
   2.611311e-01   1.932073e-01   1.388441e-01   1.106240e-01   4.028292e-02   3.992115e-02
  -2.495477e-02  -2.762328e-02  -1.811435e-02  -3.529668e-02  -3.038309e-02  -1.309891e-02
  -3.779357e-02  -2.694790e-02  -2.535386e-02  -3.026620e-02  -2.592218e-02   NaN
];
EDI_ZYYI_Array=[
   4.407396e+01   3.609528e+01   3.398854e+01   3.302813e+01   2.135975e+01   2.506301e+01
   3.308869e+01   1.276742e+01   1.108939e+01   7.665195e+00   6.162595e+00   5.090508e+00
   3.932856e+00   2.931309e+00   2.611657e+00  -1.093519e+00  -1.095341e+00  -1.061512e+00
  -9.635149e-01  -9.191886e-01  -8.670963e-01  -8.182349e-01  -7.470433e-01  -6.062307e-01
  -6.203705e-01  -4.500891e-01  -5.245883e-01  -2.467418e-01  -3.967026e-01  -4.368068e-01
  -4.727283e-01  -5.142162e-01  -5.400357e-01  -5.646754e-01  -6.021613e-01  -5.497032e-01
  -5.466583e-01  -4.823290e-01  -4.689304e-01  -4.843898e-01  -3.526348e-01  -2.566788e-01
  -2.373181e-01  -7.589483e-02   6.180031e-02   3.288414e-01   3.317831e-01   3.178124e-01
   3.380707e-01   2.876821e-01   2.718658e-01   2.698493e-01   2.022421e-01   1.650408e-01
   1.422935e-01   1.068038e-01   6.963194e-02   5.860753e-02   4.163577e-02   3.681367e-02
   2.699510e-02   2.514899e-02   1.799214e-02  -1.719741e-03  -6.145159e-03   NaN
 ];
%--
% 將EDI資料整理為計算PhaseTensor所需格式
Input_FREQ_vector=EDI_FREQ_Array(:);
Input_FREQ_vector=Input_FREQ_vector(~isnan(Input_FREQ_vector));
Input_ZXXR_vector=EDI_ZXXR_Array(:);
Input_ZXXR_vector=Input_ZXXR_vector(~isnan(Input_ZXXR_vector));
Input_ZXXI_vector=EDI_ZXXI_Array(:);
Input_ZXXI_vector=Input_ZXXI_vector(~isnan(Input_ZXXI_vector));
Input_ZXYR_vector=EDI_ZXYR_Array(:);
Input_ZXYR_vector=Input_ZXYR_vector(~isnan(Input_ZXYR_vector));
Input_ZXYI_vector=EDI_ZXYI_Array(:);
Input_ZXYI_vector=Input_ZXYI_vector(~isnan(Input_ZXYI_vector));
Input_ZYXR_vector=EDI_ZYXR_Array(:);
Input_ZYXR_vector=Input_ZYXR_vector(~isnan(Input_ZYXR_vector));
Input_ZYXI_vector=EDI_ZYXI_Array(:);
Input_ZYXI_vector=Input_ZYXI_vector(~isnan(Input_ZYXI_vector));
Input_ZYYR_vector=EDI_ZYYR_Array(:);
Input_ZYYR_vector=Input_ZYYR_vector(~isnan(Input_ZYYR_vector));
Input_ZYYI_vector=EDI_ZYYI_Array(:);
Input_ZYYI_vector=Input_ZYYI_vector(~isnan(Input_ZYYI_vector));
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% 開始計算Phase Tensor
disp('開始計算...')
%--
% 準備單位資訊
PhaseTensor.FREQ.Header={'Frequency[Hz]'};
PhaseTensor.Phi_xx.Header={'PhaseTensor[Unitless]'};
PhaseTensor.Phi_xy.Header={'PhaseTensor[Unitless]'};
PhaseTensor.Phi_yx.Header={'PhaseTensor[Unitless]'};
PhaseTensor.Phi_yy.Header={'PhaseTensor[Unitless]'};
PhaseTensor.trace.Header={'trace[Unitless]'};
PhaseTensor.skew.Header={'skew[Unitless]'};
PhaseTensor.determinant.Header={'determinant[Unitless]'};
PhaseTensor.beta_in_radians.Header={'beta[rad]'};
PhaseTensor.beta_in_degrees.Header={'beta[degrees]'};
PhaseTensor.phimax.Header={'phimax[Unitless]'};
PhaseTensor.phimax_angle_in_degrees.Header={'phimax_angle[degrees]'};
PhaseTensor.phimin.Header={'phimin[Unitless]'};
PhaseTensor.phimin_angle_in_degrees.Header={'phimax_angle[degrees]'};
PhaseTensor.alpha_in_radians.Header={'alpha[rad]'};
PhaseTensor.alpha_in_degrees.Header={'alpha[degrees]'};
PhaseTensor.azimuth_in_radians.Header={'azimuth[rad]'};
PhaseTensor.azimuth_in_degrees.Header={'azimuth[degrees]'};
%--
% 迴圈法計算阻抗張量(效率較差)
for i_FREQ_index=1:length(Input_FREQ_vector)
    disp(['目標頻率(',num2str(i_FREQ_index),'/',num2str(length(Input_FREQ_vector)),'):',num2str(Input_FREQ_vector(i_FREQ_index)),'[Hz]'])
    %----------------------------------------------------------------------
    % PhaseTensor.FREQ.Header={'Frequency[Hz]'};
    PhaseTensor.FREQ.Data(i_FREQ_index,1)=Input_FREQ_vector(i_FREQ_index);
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(9) eq(10)
    temp_Xxx=Input_ZXXR_vector(i_FREQ_index);
    temp_Xxy=Input_ZXYR_vector(i_FREQ_index);
    temp_Xyx=Input_ZYXR_vector(i_FREQ_index);
    temp_Xyy=Input_ZYYR_vector(i_FREQ_index);
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(12) eq(13)
    temp_Yxx=Input_ZXXI_vector(i_FREQ_index);
    temp_Yxy=Input_ZXYI_vector(i_FREQ_index);
    temp_Yyx=Input_ZYXI_vector(i_FREQ_index);
    temp_Yyy=Input_ZYYI_vector(i_FREQ_index);
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(18)
    temp_denominator=(temp_Xxx*temp_Xyy)-(temp_Xyx*temp_Xxy);
    if temp_denominator==0
        disp('錯誤，無法計算反矩陣!return!')
        return
    end
    temp_Phi_xx=((temp_Xyy*temp_Yxx)-(temp_Xxy*temp_Yyx))/temp_denominator;
    temp_Phi_xy=((temp_Xyy*temp_Yxy)-(temp_Xxy*temp_Yyy))/temp_denominator;
    temp_Phi_yx=((temp_Xxx*temp_Yyx)-(temp_Xyx*temp_Yxx))/temp_denominator;
    temp_Phi_yy=((temp_Xxx*temp_Yyy)-(temp_Xyx*temp_Yxy))/temp_denominator;
    %--
    % PhaseTensor.Phi_xx.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.Phi_xx.Data(i_FREQ_index,1)=temp_Phi_xx;
    % PhaseTensor.Phi_xy.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.Phi_xy.Data(i_FREQ_index,1)=temp_Phi_xy;
    % PhaseTensor.Phi_yx.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.Phi_yx.Data(i_FREQ_index,1)=temp_Phi_yx;
    % PhaseTensor.Phi_yy.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.Phi_yy.Data(i_FREQ_index,1)=temp_Phi_yy;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(22)    
    temp_phase_tensor_invariants_trace=temp_Phi_xx+temp_Phi_yy;
    %--
    % PhaseTensor.trace.Header={'trace[Unitless]'};
    PhaseTensor.trace.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_trace;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(23)    
    temp_phase_tensor_invariants_skew=temp_Phi_xy-temp_Phi_yx;
    %--
    % PhaseTensor.skew.Header={'skew[Unitless]'};
    PhaseTensor.skew.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_skew;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(24)
    temp_phase_tensor_invariants_determinant=(temp_Phi_xx*temp_Phi_yy)-(temp_Phi_xy*temp_Phi_yx);
    %--
    % PhaseTensor.determinant.Header={'determinant[Unitless]'};
    PhaseTensor.determinant.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_determinant;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(25)
    temp_phase_tensor_invariants_beta_in_radians=(0.5*atan2((temp_Phi_xy-temp_Phi_yx),(temp_Phi_xx+temp_Phi_yy)));
    temp_phase_tensor_invariants_beta_in_degrees=temp_phase_tensor_invariants_beta_in_radians/pi*180;
	%--
    % PhaseTensor.beta_in_radians.Header={'beta[rad]'};
    PhaseTensor.beta_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_beta_in_radians;
    %--
    % PhaseTensor.beta_in_degrees.Header={'beta[degrees]'};
    PhaseTensor.beta_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_beta_in_degrees;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(26)
    temp_phase_tensor_invariants_phimax= ...
        0.5*sqrt( (temp_Phi_xx+temp_Phi_yy)^2+(temp_Phi_xy-temp_Phi_yx)^2 )+ ...
        0.5*sqrt( (temp_Phi_xx-temp_Phi_yy)^2+(temp_Phi_xy+temp_Phi_yx)^2 );
    %--
    % PhaseTensor.phimax.Header={'phimax[Unitless]'};
    PhaseTensor.phimax.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimax;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(30)
    temp_phase_tensor_invariants_phimax_angle_in_degrees=atan(temp_phase_tensor_invariants_phimax)*180/pi;
    %--
    % PhaseTensor.phimax_angle_in_degrees.Header={'phimax_angle[degrees]'};
    PhaseTensor.phimax_angle_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimax_angle_in_degrees;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(27)
    temp_phase_tensor_invariants_phimin= ...
        0.5*sqrt( (temp_Phi_xx+temp_Phi_yy)^2+(temp_Phi_xy-temp_Phi_yx)^2 )- ...
        0.5*sqrt( (temp_Phi_xx-temp_Phi_yy)^2+(temp_Phi_xy+temp_Phi_yx)^2 );
    %--
    % PhaseTensor.phimin.Header={'phimin[Unitless]'};
    PhaseTensor.phimin.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimin;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(32)
    temp_phase_tensor_invariants_phimin_angle=atan(temp_phase_tensor_invariants_phimin)*180/pi;
    %--
    % PhaseTensor.phimin_angle_in_degrees.Header={'phimax_angle[degrees]'};
    PhaseTensor.phimin_angle_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimin_angle;
    %----------------------------------------------------------------------
    % PhaseTensor簡介 eq(28)
    temp_phase_tensor_alpha_in_radians=0.5*atan2((temp_Phi_xy+temp_Phi_yx),(temp_Phi_xx-temp_Phi_yy));
    temp_phase_tensor_alpha_in_degrees=temp_phase_tensor_alpha_in_radians/pi*180;
    %--
    % PhaseTensor.alpha_in_radians.Header={'alpha[rad]'};
    PhaseTensor.alpha_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_alpha_in_radians;
    %--
    % PhaseTensor.alpha_in_degrees.Header={'alpha[degrees]'};
    PhaseTensor.alpha_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_alpha_in_degrees;
    %----------------------------------------------------------------------    
    % PhaseTensor簡介 eq(33)
    temp_phase_tensor_ellipse_azimuth_in_radians=temp_phase_tensor_alpha_in_radians-temp_phase_tensor_invariants_beta_in_radians;
    temp_phase_tensor_ellipse_azimuth_in_degrees=temp_phase_tensor_ellipse_azimuth_in_radians/pi*180;
    %--
    % PhaseTensor.azimuth_in_radians.Header={'azimuth[rad]'};
    PhaseTensor.azimuth_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_ellipse_azimuth_in_radians;
    %--
    % PhaseTensor.azimuth_in_degrees.Header={'azimuth[degrees]'};
    PhaseTensor.azimuth_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_ellipse_azimuth_in_degrees;
    %----------------------------------------------------------------------
end
disp('計算完畢!')

```

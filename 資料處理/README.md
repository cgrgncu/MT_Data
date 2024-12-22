## 以範例數值說明常見數學公式(不同的慣例)：
+ 假設我們有 $N = 4$，並且給定時域信號 $x[n]$ 的值如下：
  + $x[0] = 1, \quad x[1] = 2, \quad x[2] = 3, \quad x[3] = 4$
### 1. 最常見慣例（傳統公式）
+ **順向 DFT（離散傅立葉變換）** 公式：  
  + $X[k] = \sum_{n=0}^{N-1} x[n] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad k = 0, 1, 2, \dots, N-1$  
  + 計算每個 $k$ 的值：  
    + $X[0] = 1 + 2 + 3 + 4 = 10$  
    + $X[1] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{\pi}{2}} + 3 \cdot e^{-i \cdot \pi} + 4 \cdot e^{-i \cdot \frac{3\pi}{2}} = 1 + (-2i) + (-3) + 4i = -2 + 2i$  
    + $X[2] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \pi} + 3 \cdot e^{-i \cdot 2\pi} + 4 \cdot e^{-i \cdot 3\pi} = 1 - 2 + 3 - 4 = -2$  
    + $X[3] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{3\pi}{2}} + 3 \cdot e^{-i \cdot 3\pi} + 4 \cdot e^{-i \cdot \frac{9\pi}{2}} = 1 - 2i - 3 + 4i = -2 + 2i$
  + 所以， $X = [10, -2+2i, -2, -2+2i]$。
+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] \cdot e^{i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 計算每個 $n$ 的值：  
    + $x[0] = \frac{1}{4} \left( 10 + (-2-2i) + (-2) + (2+2i) \right) = \frac{1}{4} \left( 10 - 2 - 2 + 2 \right) = \frac{8}{4} = 2$  
    + $x[1] = \frac{1}{4} \left( 10 + (-2-2i) \cdot e^{i \cdot \frac{\pi}{2}} + (-2) \cdot e^{i \cdot \pi} + (2+2i) \cdot e^{i \cdot \frac{3\pi}{2}} \right) = 2$  
    + $x[2] = \frac{1}{4} \left( 10 + (-2-2i) \cdot e^{i \cdot \frac{\pi}{2}} + (-2) \cdot e^{i \cdot \pi} + (2+2i) \cdot e^{i \cdot \frac{3\pi}{2}} \right) = 3$
    + $x[3] = \frac{1}{4} \left( 10 + (-2-2i) \cdot e^{i \cdot \frac{\pi}{2}} + (-2) \cdot e^{i \cdot \pi} + (2+2i) \cdot e^{i \cdot \frac{3\pi}{2}} \right) = 4$
  + 結果是 $x = [2, 2, 3, 4]$。


# DFT 與 IDFT 範例計算

我們將以序列 \( x = [1, 2, 3, 4] \) 為例，展示 **離散傅立葉變換 (DFT)** 和 **離散傅立葉反變換 (IDFT)** 的計算過程。

## 1. 離散傅立葉變換 (DFT)

對於序列 \( x = [1, 2, 3, 4] \)，DFT 的公式為：

\[
X_k = \sum_{n=0}^{N-1} x_n \cdot e^{-j \frac{2\pi}{N} k n}, \quad k = 0, 1, \dots, N-1
\]

其中，\( N = 4 \) 是序列長度，\( x_n \) 是原始序列的第 \( n \) 個元素，\( X_k \) 是變換後的頻域序列。

### 計算 \( X_0 \)

\[
X_0 = 1 \cdot e^{-j 2\pi \cdot 0 \cdot 0 / 4} + 2 \cdot e^{-j 2\pi \cdot 0 \cdot 1 / 4} + 3 \cdot e^{-j 2\pi \cdot 0 \cdot 2 / 4} + 4 \cdot e^{-j 2\pi \cdot 0 \cdot 3 / 4}
\]
\[
X_0 = 1 + 2 + 3 + 4 = 10
\]

### 計算 \( X_1 \)

\[
X_1 = 1 \cdot e^{-j 2\pi \cdot 1 \cdot 0 / 4} + 2 \cdot e^{-j 2\pi \cdot 1 \cdot 1 / 4} + 3 \cdot e^{-j 2\pi \cdot 1 \cdot 2 / 4} + 4 \cdot e^{-j 2\pi \cdot 1 \cdot 3 / 4}
\]
\[
X_1 = 1 + 2 \cdot e^{-j \pi/2} + 3 \cdot e^{-j \pi} + 4 \cdot e^{-j 3\pi/2}
\]
\[
X_1 = 1 + 2(-j) + 3(-1) + 4(j)
\]
\[
X_1 = 1 - 3 + (-2j + 4j) = -2 + 2j
\]

### 計算 \( X_2 \)

\[
X_2 = 1 \cdot e^{-j 2\pi \cdot 2 \cdot 0 / 4} + 2 \cdot e^{-j 2\pi \cdot 2 \cdot 1 / 4} + 3 \cdot e^{-j 2\pi \cdot 2 \cdot 2 / 4} + 4 \cdot e^{-j 2\pi \cdot 2 \cdot 3 / 4}
\]
\[
X_2 = 1 + 2 \cdot e^{-j \pi} + 3 \cdot e^{-j 2\pi} + 4 \cdot e^{-j 3\pi}
\]
\[
X_2 = 1 + 2(-1) + 3(1) + 4(-1)
\]
\[
X_2 = 1 - 2 + 3 - 4 = -2
\]

### 計算 \( X_3 \)

\[
X_3 = 1 \cdot e^{-j 2\pi \cdot 3 \cdot 0 / 4} + 2 \cdot e^{-j 2\pi \cdot 3 \cdot 1 / 4} + 3 \cdot e^{-j 2\pi \cdot 3 \cdot 2 / 4} + 4 \cdot e^{-j 2\pi \cdot 3 \cdot 3 / 4}
\]
\[
X_3 = 1 + 2 \cdot e^{-j 3\pi/2} + 3 \cdot e^{-j 3\pi} + 4 \cdot e^{-j 9\pi/2}
\]
\[
X_3 = 1 + 2(j) + 3(-1) + 4(-j)
\]
\[
X_3 = 1 - 3 + (2j - 4j) = -2 - 2j
\]

### 最終結果：DFT

因此，對於序列 \( x = [1, 2, 3, 4] \)，其 DFT 為：

\[
X = [X_0, X_1, X_2, X_3] = [10, -2 + 2j, -2, -2 - 2j]
\]

---

## 2. 離散傅立葉反變換 (IDFT)

離散傅立葉反變換（IDFT）的公式為：

\[
x_n = \frac{1}{N} \sum_{k=0}^{N-1} X_k \cdot e^{j \frac{2\pi}{N} k n}, \quad n = 0, 1, \dots, N-1
\]

我們現在從 \( X = [10, -2 + 2j, -2, -2 - 2j] \) 恢復原始序列 \( x \)。

### 計算 \( x_0 \)

\[
x_0 = \frac{1}{4} \left( 10 \cdot e^{j 2\pi \cdot 0 \cdot 0 / 4} + (-2 + 2j) \cdot e^{j 2\pi \cdot 0 \cdot 1 / 4} + (-2) \cdot e^{j 2\pi \cdot 0 \cdot 2 / 4} + (-2 - 2j) \cdot e^{j 2\pi \cdot 0 \cdot 3 / 4} \right)
\]
\[
x_0 = \frac{1}{4} \left( 10 + (-2 + 2j) + (-2) + (-2 - 2j) \right)
\]
\[
x_0 = \frac{1}{4} \cdot 10 = 1
\]

### 計算 \( x_1 \)

\[
x_1 = \frac{1}{4} \left( 10 \cdot e^{j 2\pi \cdot 1 \cdot 1 / 4} + (-2 + 2j) \cdot e^{j 2\pi \cdot 1 \cdot 2 / 4} + (-2) \cdot e^{j 2\pi \cdot 1 \cdot 3 / 4} + (-2 - 2j) \cdot e^{j 2\pi \cdot 1 \cdot 4 / 4} \right)
\]
\[
x_1 = \frac{1}{4} \left( 10 \cdot e^{j \pi/2} + (-2 + 2j) \cdot e^{j \pi} + (-2) \cdot e^{j 3\pi/2} + (-2 - 2j) \cdot e^{j 2\pi} \right)
\]
\[
x_1 = \frac{1}{4} \left( 10(j) + (-2 + 2j)(-1) + (-2)(-j) + (-2 - 2j)(1) \right)
\]
\[
x_1 = \frac{1}{4} \left( 10j + 2 - 2j + 2j - 2 - 2j \right)
\]
\[
x_1 = \frac{1}{4} \cdot 2 = 2
\]

### 計算 \( x_2 \)

\[
x_2 = \frac{1}{4} \left( 10 \cdot e^{j 2\pi \cdot 2 \cdot 2 / 4} + (-2 + 2j) \cdot e^{j 2\pi \cdot 2 \cdot 3 / 4} + (-2) \cdot e^{j 2\pi \cdot 2 \cdot 4 / 4} + (-2 - 2j) \cdot e^{j 2\pi \cdot 2 \cdot 5 / 4} \right)
\]
\[
x_2 = \frac{1}{4} \left( 10 + (-2 + 2j) + (-2) + (-2 - 2j) \right)
\]
\[
x_2 = \frac{1}{4} \cdot (-2) = -2
\]

### 計算 \( x_3 \)

\[
x_3 = \frac{1}{4} \left( 10 \cdot e^{j 2\pi \cdot 3 \cdot 3 / 4} + (-2 + 2j) \cdot e^{j 2\pi \cdot 3 \cdot 4 / 4} + (-2) \cdot e^{j 2\pi \cdot 3 \cdot 5 / 4} + (-2 - 2j) \cdot e^{j 2\pi \cdot 3 \cdot 6 / 4} \right)
\]
\[
x_3 = \frac{1}{4} \left( 10 - 2 + 2j - 2 - 2j \right)
\]
\[
x_3 = \frac{1}{4} \cdot 10 = 4
\]

### 最終結果：IDFT

因此，從 DFT 的反變換恢復回來的序列是：

\[
x = [1, 2, 3, 4]
\]

這與原始序列一致，表明計算正確。

---

## 小結

1. **DFT**: \( X = [10, -2 + 2j, -2, -2 - 2j] \)
2. **IDFT**: \( x = [1, 2, 3, 4] \)

這樣就演示了離散傅立葉變換和反變換的計算過程！



# 大地電磁法資料處理
+ 2024-02-26

### 網路資料
+ MTNET: https://www.mtnet.info/main/

### 教科書:
+ Simpson, F., & Bahr, K. (2005). Practical magnetotellurics. Cambridge University Press.
+ Chave, A. D., & Jones, A. G. (Eds.). (2012). The magnetotelluric method: Theory and practice. Cambridge University Press.

### 1953 路易士·卡尼亞德(Louis Cagniard)
+ 卡尼亞德博士發表了大地電磁法原理與基礎。該文章承認了其他學者(俄國、日本)的獨立研究
+ Cagniard Imdeance
Zxy=Ex/Hy
Zyx=Ey/Hx

### 1967 Switf PHD 論文
+ 第一章:
+ 第1.2章進行過去研究回顧
  + 1953年 Cagniard發表MT方法，探討水平地層。
  + 1954年 Wait提到Cagniard研究在集膚深度的某些條件內才有效。
  + 1960年 許多人指出非等向性、非均質的地層，阻抗為張量。例如: 1960 Cantwell
  + page6提到電場極化這個名詞
+ 第二章:
  + The magnetotelluric method utilizes the boundary conditions forced on the electric and magnetic fields when an electromagnetic wave propagating through air interacts with the earth's surface. 
    ```  
    大地電磁法是利用「當通過空氣傳播的電磁波與地球表面相互作用時施加在電場和磁場上的邊界條件」。  
    ```
  + Whereas the incident horizontal magnetic field is roughly doubled at the surface, the electric field is strongly dependent upon the earth's conductivity structure.
    ```
    然而，入射水平磁場在地表處大約加倍，但電場強烈依賴地球的電導率結構。
    ```
  + The essential measurement is the electromagnetic impedance (the ratio of electric field over magnetic field, E/H) at the surface.
    ```
    主要測量目標是地表的電磁阻抗（電場與磁場的比值，E/H）。
    ```
  + 阻抗張量是3x3，地表Ez消失，降為2x2。
+ 第2.1章 與馬克斯威爾方程組的關係
  + 使用地磁座標系，X朝北，Y朝東，Z朝地下。
  + 符號慣例: $e^{-i{\omega}j}$  
    ```
    Note  The MATLAB convention is to use a negative j for the fft function. This is an engineering convention; physics and pure mathematics typically use a positive j.
    ```
    ```    
    REF: https://www.mathworks.com/help/signal/ug/discrete-fourier-transform.html
    REF2: https://www.mathworks.com/help/matlab/ref/fft.html
    REF3: https://www.fftw.org/fftw2_doc/fftw_3.html
    ```
### 資料格式
+ TF:
  + EDI (most common format, SEG format)
  + ZMM (Egberts EMTF output)
  + JFILE (BIRRP output)
  + EMTFXML (Kelbert's format)
  + AVG (Zonge output)

### 資料格式軟體
+ mt_metadata:
  + https://github.com/kujaku11/mt_metadata
+ mth5
  + https://github.com/kujaku11/mth5
+ PhoenixGeoPy
  + https://github.com/torresolmx/PhoenixGeoPy
+ EMTF FCU:
  + https://code.usgs.gov/ghsc/geomag/emtf/fcu/-/tree/v4.1/f90
+ 3D Grid 
    
### 資料處理軟體
+ SSMT2000 + MTEditor
+ EMPower
+ WinGlink
+ PROCMT
  + https://www.youtube.com/watch?v=l2Os6aq8EL4
+ EMTF
  + 方法: M-estimator
+ EMP
+ BIRRP
  + 方法: bounded influence methods
+ aurora
  + 原始碼: https://github.com/simpeg/aurora
+ mtpy v2
  + 原始碼: https://github.com/MTgeophysics/mtpy-v2
+ lims
  + 原始碼: https://homepages.dias.ie/ajones/progs/lims/lims.html
+ SigMT
  + 原始碼: https://github.com/ajithabhks/SigMT
  + 論文: Ajithabh, K. S., & Patro, P. K. (2023). SigMT: An open-source Python package for magnetotelluric data processing. Computers & Geosciences, 171, 105270.
+ Razorback
  + 原始碼: https://github.com/BRGM/razorback
  + 論文: Smaï, F., & Wawrzyniak, P. (2020). Razorback, an open source Python library for robust processing of magnetotelluric data. Frontiers in Earth Science, 8, 296.
  + 方法: M-estimator and bounded influence methods and multiple remote reference.

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
+ 第2.1章 與馬克斯威爾方程組的關係
  + 定義座標系，X朝北，Y朝東，Z朝地下
  + 符號慣例: $i^{-i{\omega}j}$  
    ```
    Note  The MATLAB convention is to use a negative j for the fft function. This is an engineering convention; physics and pure mathematics typically use a positive j.
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

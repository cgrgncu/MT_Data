# DFT與FFT
+ 離散傅立葉轉換（英語：Discrete Fourier Transform，縮寫為DFT）
  + DFT能直接在電腦上實現，為數位信號處理的核心工具
+ 快速傅立葉變換（Fast Fourier Transform，縮寫為 FFT）
  + FFT 是計算 DFT 的一種高效方法，兩者在數學上是相同的，結果一致，但 FFT 的速度和計算效率使其成為實際應用中首選的計算方法。
  + 在 MATLAB 中，fft 函數的實際功能就是計算 DFT，並根據輸入信號的長度和特性，自動選擇最合適的加速演算法（如 Radix-2 或混合基 FFT）。用戶無需手動設定優化參數，MATLAB 會自動處理這些細節。
> **提示**  
> 一般人不需要鑽研如何高效率計算，只需關心標準數學公式

## 傅立葉變換的順向與逆向計算
+ 傅立葉變換包含兩個基本的數學計算：**順向變換（DFT）** 和 **逆向變換（IDFT）**。這兩個計算在數學上是相互對應的，並且必須遵循某些核心運算規則和正規化方式。
  + **順向 DFT（離散傅立葉變換）** 將時域信號轉換為頻域信號。（Discrete Fourier Transform, DFT）。
  + **逆向 IDFT（逆離散傅立葉變換）** 則將頻域信號轉回時域信號。（Inverse Discrete Fourier Transform, IDFT）。

### 核心運算與正規化係數的選擇
+ 在傅立葉變換中，核心運算（即旋轉因子）和正規化係數的選擇可以根據需求進行調整。這些選擇需要滿足數學上的相容性，才能確保順向和逆向變換之間能夠正確對應。
  + **核心運算**：順向 DFT 和逆向 DFT 中的旋轉因子符號必須相反，這樣才能確保兩者之間的關係是對應的。
    + 順向 DFT：傳統上使用 **$e^{-i \cdot \frac{2\pi k n}{N}}$**
    + 逆向 DFT：傳統上使用 **$e^{i \cdot \frac{2\pi k n}{N}}$**
  + **正規化係數**：
    + **最常見的慣例** 傳統上是順向 DFT 沒有正規化係數，而逆向 DFT 使用 **$\frac{1}{N}$** 作為正規化係數。
    + **另一種不太常見的慣例** 是在順向與逆向 DFT 中都使用 **$\frac{1}{\sqrt{N}}$**。

> **提示**
> + 先理解 **歐拉公式（Euler's Formula）** :  
>   + $e^{i\theta}=\cos(\theta)+i\sin(\theta)$  
>   + 其中：  
>     + $e$ 是自然對數的底數。
>     + $i$ 是虛數單位。
>     + $\theta$ 是一個實數角度，單位:[rad]。  
> + 核心運算(旋轉因子) 說明:  
>   + $e^{-i\cdot\frac{2\pi k n}{N}}$  
>   + 其中：  
>     + $e$ 是自然對數的底數。  
>     + $i$ 是虛數單位。  
>     + ${\frac{2\pi k n}{N}}$ 是一個實數角度，單位:[rad]。  
>     + $N$ 是時域信號的總樣本數。單位:[count]。  
>     + $k$ 是頻率索引。值為0到N-1，共N個。無單位。  
>     + $n$ 是時域信號的索引。值為0到N-1，共N個。無單位。  


## 列舉常見數學公式(不同的慣例)：

### 1. 最常見慣例(傳統數學公式)
+ **順向 DFT（離散傅立葉變換）** 公式：  
  + $X[k] = \sum_{n=0}^{N-1} x[n] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad k = 0, 1, 2, \dots, N-1$  
  + 其中：  
    + $x[n]$ 是時域信號的第 $n$ 個樣本， $n = 0, 1, 2, \dots, N-1$ 。  
    + $X[k]$ 是頻域信號的第 $k$ 個頻率分量， $k = 0, 1, 2, \dots, N-1$ 。  
    + $e^{-i \cdot \frac{2\pi}{N} k n}$ 是核心運算(旋轉因子)。  
+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] \cdot e^{i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 其中：  
    + $x[n]$ 是時域信號的第 $n$ 個樣本， $n = 0, 1, 2, \dots, N-1$ 。  
    + $X[k]$ 是頻域信號的第 $k$ 個頻率分量， $k = 0, 1, 2, \dots, N-1$ 。  
    + $e^{i \cdot \frac{2\pi}{N} k n}$ 是核心運算(旋轉因子)。  
> **提示**
> + 逆向 DFT 的旋轉因子與順向變換的符號相反，這確保了時域和頻域之間的對應性。
>   + $e^{-i \cdot \frac{2\pi}{N} k n}$ 是順向核心運算(旋轉因子)時，逆向核心運算(旋轉因子)則為 $e^{i \cdot \frac{2\pi}{N} k n}$
> + 正規化係數:
>   + 順向正規化係數為1，逆向正規化系數為 $\frac{1}{N}$。

### 2. 第二常見的慣例
+ 為了與傳統公式作區別，調整 $x[n]$ 為 $a[n]$ ， $X[k]$ 為 $A[k]$  。
+ **順向 DFT（離散傅立葉變換）** 公式：  
  + $A[k] = \sum_{n=0}^{N-1} a[n] \cdot e^{i \cdot \frac{2\pi}{N} k n}, \quad k = 0, 1, 2, \dots, N-1$  
  + 其中：  
    + $a[n]$ 是時域信號的第 $n$ 個樣本， $n = 0, 1, 2, \dots, N-1$ 。  
    + $A[k]$ 是頻域信號的第 $k$ 個頻率分量， $k = 0, 1, 2, \dots, N-1$ 。  
    + $e^{i \cdot \frac{2\pi}{N} k n}$ 是核心運算(旋轉因子)。  
+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $a[n] = \frac{1}{N} \sum_{k=0}^{N-1} A[k] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 其中：  
    + $a[n]$ 是時域信號的第 $n$ 個樣本， $n = 0, 1, 2, \dots, N-1$ 。  
    + $A[k]$ 是頻域信號的第 $k$ 個頻率分量， $k = 0, 1, 2, \dots, N-1$ 。  
    + $e^{-i \cdot \frac{2\pi}{N} k n}$ 是核心運算(旋轉因子)。  
> **提示**
> + 逆向 DFT 的旋轉因子與順向變換的符號相反，這確保了時域和頻域之間的對應性。
>   + $e^{i \cdot \frac{2\pi}{N} k n}$ 是順向核心運算(旋轉因子)時，逆向核心運算(旋轉因子)則為 $e^{-i \cdot \frac{2\pi}{N} k n}$
> + 正規化係數:
>   + 順向正規化係數為1，逆向正規化系數為 $\frac{1}{N}$。

### 3. 少見慣例  
+ 為了與傳統公式作區別，調整 $x[n]$ 為 $b[n]$ ， $X[k]$ 為 $B[k]$  。
+ **順向 DFT（離散傅立葉變換）** 公式：  
  + $B[k] = \frac{1}{\sqrt{N}} \sum_{n=0}^{N-1} b[n] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad k = 0, 1, 2, \dots, N-1$  
  + 其中：  
    + $b[n]$ 是時域信號的第 $n$ 個樣本， $n = 0, 1, 2, \dots, N-1$ 。  
    + $B[k]$ 是頻域信號的第 $k$ 個頻率分量， $k = 0, 1, 2, \dots, N-1$ 。  
    + $e^{-i \cdot \frac{2\pi}{N} k n}$ 是核心運算(旋轉因子)。  

+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $b[n] = \frac{1}{\sqrt{N}} \sum_{k=0}^{N-1} B[k] \cdot e^{i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 其中：  
    + $b[n]$ 是時域信號的第 $n$ 個樣本， $n = 0, 1, 2, \dots, N-1$ 。  
    + $B[k]$ 是頻域信號的第 $k$ 個頻率分量， $k = 0, 1, 2, \dots, N-1$ 。  
    + $e^{i \cdot \frac{2\pi}{N} k n}$ 是核心運算(旋轉因子)。  

> **提示**
> + 這種慣例的特點是 **正規化係數 $\frac{1}{\sqrt{N}}$ 被同時用於順向與逆向**，確保變換對應為單位運算（unitary transform）。  
> + 核心運算符號選擇仍然遵守「順向與逆向符號相反」的原則：
>   + 順向使用 $e^{-i \cdot \frac{2\pi}{N} k n}$。  
>   + 逆向使用 $e^{i \cdot \frac{2\pi}{N} k n}$。  

## 以範例數值說明常見數學公式(不同的慣例)：

### 1. 最常見慣例（傳統公式）
+ 假設我們有 $N = 4$，並且給定時域信號 $x[n]$ 的值如下：
  + $x[0] = 1, \quad x[1] = 2, \quad x[2] = 3, \quad x[3] = 4$
+ **順向 DFT（離散傅立葉變換）** 公式：  
  + $X[k] = \sum_{n=0}^{N-1} x[n] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad k = 0, 1, 2, \dots, N-1$  
  + 計算每個 $k$ 的值：  
    + $X[0] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot 0} + 3 \cdot e^{-i \cdot 0} + 4 \cdot e^{-i \cdot 0} = 1 + 2 + 3 + 4 = 10$ 
    + $X[1] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{\pi}{2}} + 3 \cdot e^{-i \cdot \pi} + 4 \cdot e^{-i \cdot \frac{3\pi}{2}} = 1 + (-2i) + (-3) + 4i = -2+2i$  
    + $X[2] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \pi} + 3 \cdot e^{-i \cdot 2\pi} + 4 \cdot e^{-i \cdot 3\pi} = 1 - 2 + 3 - 4 = -2$  
    + $X[3] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{3\pi}{2}} + 3 \cdot e^{-i \cdot 3\pi} + 4 \cdot e^{-i \cdot \frac{9\pi}{2}} = 1 + 2i - 3 + 4i = -2-2i$
  + 所以， $X = [10, -2+2i, -2, -2-2i]$。
+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] \cdot e^{i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 計算每個 $n$ 的值：  
    + $x[0] = \frac{1}{4} \left( 10 \cdot e^{i \cdot 0} + (-2+2i) \cdot e^{i \cdot 0} + (-2) e^{i \cdot 0} + (-2-2i) e^{i \cdot 0} \right) = \frac{1}{4} \left( 10 + (-2+2i) + (-2) + (-2-2i) \right) = \frac{4}{4} = 1$  
    + $x[1] = \frac{1}{4} \left( 10 \cdot e^{i \cdot 0} + (-2+2i) \cdot e^{i \cdot \frac{\pi}{2}} + (-2) \cdot e^{i \cdot \pi} + (-2-2i) \cdot e^{i \cdot \frac{3\pi}{2}} \right) = \frac{1}{4} \left( 10 + (-2+2i) (i) + (-2) (-1) + (-2-2i) (-i) \right) = \frac{1}{4} \left( 10 + (-2-2i) + 2 + (-2-2i) \right) = \frac{8}{4} = 2$  
    + $x[2] = \frac{1}{4} \left( 10 \cdot e^{i \cdot 0} + (-2+2i) \cdot e^{i \cdot \pi} + (-2) \cdot e^{i \cdot 2 \pi} + (-2-2i) \cdot e^{i \cdot 3 \pi} \right) = \frac{1}{4} \left( 10 + (-2+2i) (-1) + (-2) (1) + (-2-2i) (-1) \right) = \frac{1}{4} \left( 10 + (2-2i) + (-2) + (2+2i) \right) = \frac{12}{4} = 3$  
    + $x[3] = \frac{1}{4} \left( 10 \cdot e^{i \cdot 0} + (-2+2i) \cdot e^{i \cdot \frac{3 \pi}{2}} + (-2) \cdot e^{i \cdot 3 \pi} + (-2-2i) \cdot e^{i \cdot \frac{9\pi}{2}} \right) = \frac{1}{4} \left( 10 + (-2+2i) (-i) + (-2) (-1) + (-2-2i) (i) \right) = \frac{1}{4} \left( 10 + (2+2i) + 2 + (2-2i) \right) = \frac{16}{4} = 4$  
  + 結果是 $x = [1, 2, 3, 4]$。


### 2. 第二常見的慣例
+ 假設我們有 $N = 4$，並且給定時域信號 $a[n]$ 的值如下：
  + $a[0] = 1, \quad a[1] = 2, \quad a[2] = 3, \quad a[3] = 4$
+ **順向 DFT（離散傅立葉變換）** 公式：  
  + $A[k] = \sum_{n=0}^{N-1} a[n] \cdot e^{i \cdot \frac{2\pi}{N} k n}, \quad k = 0, 1, 2, \dots, N-1$  
  + 計算每個 $k$ 的值：  
    + $A[0] = 1 \cdot e^{i \cdot 0} + 2 \cdot e^{i \cdot 0} + 3 \cdot e^{i \cdot 0} + 4 \cdot e^{i \cdot 0} = 1 + 2 + 3 + 4 = 10$ 
    + $A[1] = 1 \cdot e^{i \cdot 0} + 2 \cdot e^{i \cdot \frac{\pi}{2}} + 3 \cdot e^{i \cdot \pi} + 4 \cdot e^{i \cdot \frac{3\pi}{2}} = 1 + 2i + (-3) + (-4i) = -2-2i$  
    + $A[2] = 1 \cdot e^{i \cdot 0} + 2 \cdot e^{i \cdot \pi} + 3 \cdot e^{i \cdot 2\pi} + 4 \cdot e^{i \cdot 3\pi} = 1 - 2 + 3 - 4 = -2$  
    + $A[3] = 1 \cdot e^{i \cdot 0} + 2 \cdot e^{i \cdot \frac{3\pi}{2}} + 3 \cdot e^{i \cdot 3\pi} + 4 \cdot e^{i \cdot \frac{9\pi}{2}} = 1 + (-2i) - 3 + 4i = -2+2i$
  + 所以， $A = [10, -2-2i, -2, -2+2i]$。
+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $a[n] = \frac{1}{N} \sum_{k=0}^{N-1} A[k] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 計算每個 $n$ 的值：  
    + $a[0] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot 0} + (-2) e^{-i \cdot 0} + (-2+2i) e^{-i \cdot 0} \right) = \frac{1}{4} \left( 10 + (-2-2i) + (-2) + (-2+2i) \right) = \frac{4}{4} = 1$  
    + $a[1] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot \frac{\pi}{2}} + (-2) \cdot e^{-i \cdot \pi} + (-2+2i) \cdot e^{-i \cdot \frac{3\pi}{2}} \right) = \frac{1}{4} \left( 10 + (-2-2i) (-i) + (-2) (-1) + (-2+2i) (i) \right) = \frac{1}{4} \left( 10 + (-2+2i) + 2 + (-2-2i) \right) = \frac{8}{4} = 2$  
    + $a[2] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot \pi} + (-2) \cdot e^{-i \cdot 2 \pi} + (-2+2i) \cdot e^{-i \cdot 3 \pi} \right) = \frac{1}{4} \left( 10 + (-2-2i) (-1) + (-2) (1) + (-2+2i) (-1) \right) = \frac{1}{4} \left( 10 + (2+2i) + (-2) + (2-2i) \right) = \frac{12}{4} = 3$  
    + $a[3] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot \frac{3 \pi}{2}} + (-2) \cdot e^{-i \cdot 3 \pi} + (-2+2i) \cdot e^{-i \cdot \frac{9\pi}{2}} \right) = \frac{1}{4} \left( 10 + (-2-2i) (i) + (-2) (-1) + (-2+2i) (-i) \right) = \frac{1}{4} \left( 10 + (2-2i) + 2 + (2+2i) \right) = \frac{16}{4} = 4$  
  + 結果是 $a = [1, 2, 3, 4]$。


### 3. 少見慣例  
+ 假設我們有 $N = 4$，並且給定時域信號 $b[n]$ 的值如下：
  + $b[0] = 1, \quad b[1] = 2, \quad b[2] = 3, \quad b[3] = 4$
+ **順向 DFT（離散傅立葉變換）** 公式：  
  + $B[k] = \frac{1}{\sqrt{4}} \sum_{n=0}^{N-1} b[n] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad k = 0, 1, 2, \dots, N-1$  
  + 計算每個 $k$ 的值：  
    + $B[0] = \frac{1}{\sqrt{4}} \left( 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot 0} + 3 \cdot e^{-i \cdot 0} + 4 \cdot e^{-i \cdot 0} \right) = \frac{1}{2} \left( 1 + 2 + 3 + 4 \right) = \frac{10}{2} = 5$ 
    + $B[1] = \frac{1}{\sqrt{4}} \left( 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{\pi}{2}} + 3 \cdot e^{-i \cdot \pi} + 4 \cdot e^{-i \cdot \frac{3\pi}{2}} \right) = \frac{1}{2} \left( 1 + (-2i) + (-3) + 4i \right) = \frac{-2 + 2i}{2} = -1+i$  
    + $B[2] = \frac{1}{\sqrt{4}} \left( 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \pi} + 3 \cdot e^{-i \cdot 2\pi} + 4 \cdot e^{-i \cdot 3\pi} \right) = \frac{1}{2} \left( 1 - 2 + 3 - 4 \right) =  \frac{-2}{2} = -1$  
    + $B[3] = \frac{1}{\sqrt{4}} \left( 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{3\pi}{2}} + 3 \cdot e^{-i \cdot 3\pi} + 4 \cdot e^{-i \cdot \frac{9\pi}{2}} \right) = \frac{1}{2} \left( 1 + 2i - 3 + 4i \right) = \frac{-2-2i}{2}  = -1-i$
  + 所以， $B = [5, -1+i, -1, -1-i]$。
+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $b[n] = \frac{1}{\sqrt{N}} \sum_{k=0}^{N-1} B[k] \cdot e^{i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 計算每個 $n$ 的值：  
    + $b[0] = \frac{1}{\sqrt{4}} \left( 5 \cdot e^{i \cdot 0} + (-1+i) \cdot e^{i \cdot 0} + (-1) e^{i \cdot 0} + (-1-i) e^{i \cdot 0} \right) = \frac{1}{2} \left( 5 + (-1+i) + (-1) + (-1-i) \right) = \frac{2}{2} = 1$  
    + $b[1] = \frac{1}{\sqrt{4}} \left( 5 \cdot e^{i \cdot 0} + (-1+i) \cdot e^{i \cdot \frac{\pi}{2}} + (-1) \cdot e^{i \cdot \pi} + (-1-i) \cdot e^{i \cdot \frac{3\pi}{2}} \right) = \frac{1}{2} \left( 5 + (-1+i) (i) + (-1) (-1) + (-1-i) (-i) \right) = \frac{1}{2} \left( 5 + (-1-i) + 1 + (-1+i) \right) = \frac{4}{2} = 2$  
    + $b[2] = \frac{1}{\sqrt{4}} \left( 5 \cdot e^{i \cdot 0} + (-1+i) \cdot e^{i \cdot \pi} + (-1) \cdot e^{i \cdot 2 \pi} + (-1-i) \cdot e^{i \cdot 3 \pi} \right) = \frac{1}{2} \left( 5 + (-1+i) (-1) + (-1) (1) + (-1-i) (-1) \right) = \frac{1}{4} \left( 5 + (1-i) + (-1) + (1+i) \right) = \frac{6}{2} = 3$  
    + $b[3] = \frac{1}{\sqrt{4}} \left( 5 \cdot e^{i \cdot 0} + (-1+i) \cdot e^{i \cdot \frac{3 \pi}{2}} + (-1) \cdot e^{i \cdot 3 \pi} + (-1-i) \cdot e^{i \cdot \frac{9\pi}{2}} \right) = \frac{1}{2} \left( 5 + (-1+i) (-i) + (-1) (-1) + (-1-i) (i) \right) = \frac{1}{4} \left( 5 + (1+i) + 1 + (1-i) \right) = \frac{8}{2} = 4$  
  + 結果是 $b = [1, 2, 3, 4]$。

> **提示**
> + 三種慣例都可達到轉換為頻域、重建回時域的效果，均可稱為DFT。
> + MATLAB只允許使用者採用傳統慣例。且MATLAB使用FFTW函式庫，數值計算使用雙精度浮點數。
> + FFTW函式庫允許用戶使用不同精度的浮點數及不同的慣例，但預設是使用傳統慣例及雙精度浮點數。
> + 其他函式庫使用之前去看看他的說明頁面，提到的公式，去注意它的符號公式，就可知道其慣例。或可嘗試依照前述順向DFT計算，看結果就可以知道是哪個慣例。

# 平面電磁波的數學表示和物理解釋

## 1. 平面電磁波的數學模型

在自由空間中，平面電磁波可以用複數指數形式表示為：

$$
\mathbf{E}(\mathbf{r}, t) = E_0 \hat{x} e^{i(kz - \omega t)}
$$

$$
\mathbf{B}(\mathbf{r}, t) = B_0 \hat{y} e^{i(kz - \omega t)}
$$

這裡：
- $\mathbf{E_0}$ 和 $\mathbf{B_0}$ 是電場和磁場的振幅向量，決定了波的強度和方向。
- $k$ 是波數，與波長 $\lambda$ 有關，$k = \frac{2\pi}{\lambda}$。
- $\omega$ 是角頻率，與波的頻率 $f$ 相關，$\omega = 2\pi f$。
- $\hat{x}$ 和 $\hat{y}$ 分別是電場和磁場的方向單位向量。
- $t$ 是時間，$z$ 是空間位置。

這些公式描述了電磁波在空間和時間中的演化。

## 2. 波的相位與時間的變化

平面電磁波的 **相位**（phase）是由以下兩部分組成：
- **空間相位**： $k z$ ，描述波在空間中的位置。
- **時間相位**： $- \omega t$ ，描述波隨時間的演變。

因此，波的 **總相位** 是：

$$
\phi(z, t) = k z - \omega t
$$

這個相位的物理意義是波的狀態隨時間和空間的位置而改變。下面詳細分析各部分。

## 3. 起始相位與隨時間變化的相位

### 3.1 起始相位

**起始相位**是指波在時間 $t = 0$ 時在某一固定位置 $z_0$ 的相位。此時，波的相位簡單地變為：

$$
\phi(z_0, 0) = k z_0
$$

這表示在位置 $z_0$ 上，波的 **初始相位** 為 $k z_0$，即在 $t = 0$ 時，波的相位與空間位置 $z_0$ 有關。這個相位對於給定位置 $z_0$ 是固定的。

### 3.2 隨時間變化的相位

隨著時間的推移，波的相位會隨著時間變化。這部分由 $- \omega t$ 組成：

$$
\phi(z, t) = k z - \omega t
$$

這意味著波隨時間的演變會改變相位，並且波的周期性行為是由角頻率 $\omega$ 決定的。波隨時間增長，相位會不斷改變。

### 3.3 相位變化的物理意義

- **空間相位** $k z_0$ ：這部分描述了在位置 $z_0$ 處的波的初始相位。當時間 $t = 0$ 時，這部分的相位不隨時間變化，它是該位置的 **起始相位**。
- **時間相位** $- \omega t$：隨著時間的推移，波的相位會隨著 $-\omega t$ 逐漸減小（或增加，取決於符號），這反映了波隨時間向外傳播的過程。

## 4. 符號約定與波的傳播方向

在平面波的指數形式中，為何選擇 **負號**（ $-\omega t$ ）來描述時間演變？這與波的傳播方向有關。

### 4.1 波的傳播方向

波的傳播方向與波數向量 $\mathbf{k}$ 的方向密切相關。在這個情況下，假設波數向量是 $k \hat{z}$，那麼波沿著 **正 $z$ 軸** 方向傳播。指數中的 **負號** 反映了波隨著時間的推移沿著正 $z$ 方向傳播。

具體來說，負號表示波的相位隨時間增長而減少，這對應於波的 **向外傳播**。這是根據波的物理行為來選擇符號的。

### 4.2 傅立葉變換與符號約定

傅立葉變換中，選擇 **負號**（$- i \omega t$）作為時間變化部分是為了符合波向正方向（或負方向）傳播的物理預期。在這種情況下，負號確保了波的相位隨著時間向外傳播，並且這樣的符號選擇也和實際的波動行為相吻合。

### 4.3 波動方程與符號選擇

選擇 **負號**（$- \omega t$）的慣例源自於數學中的標準約定，並保證波的相位隨時間增長而減少，這樣波就會在空間中向外擴散。這樣的約定使得平面波能夠準確地描述波的傳播特性。

### 4.4 改變符號的效果

如果將符號改為正號（$+ \omega t$），則波會沿著 **負 $z$ 方向** 傳播，即波的相位會隨時間增大，這就描述了波向 **負 $z$ 軸** 傳播的情形。因此，符號的選擇直接影響了波的傳播方向。

## 5. 總結

1. **起始相位** $k z_0$ 表示波在特定位置 $z_0$ 上的初始相位，這在時間 $t = 0$ 時是固定的。
2. **隨時間變化的相位** $-\omega t$ 描述波隨著時間的演變，並且反映了波向外傳播的過程。
3. **符號約定（負號）** 確保了波沿著正方向傳播，並且這樣的符號選擇與物理實際一致，使得波動方程能夠準確地描述波的傳播特性。
4. **傅立葉變換與波的傳播**：在傅立葉變換中，選擇負號是為了符合物理波的傳播行為，並保持數學描述的一致性。

這些數學與物理的結合使得波動理論的描述更加準確和一致，並且符號約定在實際應用中起到了關鍵作用。

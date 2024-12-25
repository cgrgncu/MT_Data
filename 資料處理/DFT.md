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
    + $X[1] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{\pi}{2}} + 3 \cdot e^{-i \cdot \pi} + 4 \cdot e^{-i \cdot \frac{3\pi}{2}} = 1 + (-2i) + (-3) + 4i = -2 + 2i$  
    + $X[2] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \pi} + 3 \cdot e^{-i \cdot 2\pi} + 4 \cdot e^{-i \cdot 3\pi} = 1 - 2 + 3 - 4 = -2$  
    + $X[3] = 1 \cdot e^{-i \cdot 0} + 2 \cdot e^{-i \cdot \frac{3\pi}{2}} + 3 \cdot e^{-i \cdot 3\pi} + 4 \cdot e^{-i \cdot \frac{9\pi}{2}} = 1 + 2i - 3 + 4i = -2 - 2i$
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
    + $A[1] = 1 \cdot e^{i \cdot 0} + 2 \cdot e^{i \cdot \frac{\pi}{2}} + 3 \cdot e^{i \cdot \pi} + 4 \cdot e^{i \cdot \frac{3\pi}{2}} = 1 + 2i + (-3) + (-4i) = -2 - 2i$  
    + $A[2] = 1 \cdot e^{i \cdot 0} + 2 \cdot e^{i \cdot \pi} + 3 \cdot e^{i \cdot 2\pi} + 4 \cdot e^{i \cdot 3\pi} = 1 - 2 + 3 - 4 = -2$  
    + $A[3] = 1 \cdot e^{i \cdot 0} + 2 \cdot e^{i \cdot \frac{3\pi}{2}} + 3 \cdot e^{i \cdot 3\pi} + 4 \cdot e^{i \cdot \frac{9\pi}{2}} = 1 + (-2i) - 3 + 4i = -2 + 2i$
  + 所以， $A = [10, -2-2i, -2, -2+2i]$。
+ **逆向 IDFT（逆離散傅立葉變換）** 公式：
  + $a[n] = \frac{1}{N} \sum_{k=0}^{N-1} A[k] \cdot e^{-i \cdot \frac{2\pi}{N} k n}, \quad n = 0, 1, 2, \dots, N-1$  
  + 計算每個 $n$ 的值：  
    + $a[0] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot 0} + (-2) e^{-i \cdot 0} + (-2+2i) e^{-i \cdot 0} \right) = \frac{1}{4} \left( 10 + (-2-2i) + (-2) + (-2+2i) \right) = \frac{4}{4} = 1$  
    + $a[1] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot \frac{\pi}{2}} + (-2) \cdot e^{-i \cdot \pi} + (-2+2i) \cdot e^{-i \cdot \frac{3\pi}{2}} \right) = \frac{1}{4} \left( 10 + (-2-2i) (-i) + (-2) (-1) + (-2+2i) (i) \right) = \frac{1}{4} \left( 10 + (-2+2i) + 2 + (-2-2i) \right) = \frac{8}{4} = 2$  
    + $a[2] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot \pi} + (-2) \cdot e^{-i \cdot 2 \pi} + (-2+2i) \cdot e^{-i \cdot 3 \pi} \right) = \frac{1}{4} \left( 10 + (-2-2i) (-1) + (-2) (1) + (-2+2i) (-1) \right) = \frac{1}{4} \left( 10 + (2+2i) + (-2) + (2-2i) \right) = \frac{12}{4} = 3$  
    + $a[3] = \frac{1}{4} \left( 10 \cdot e^{-i \cdot 0} + (-2-2i) \cdot e^{-i \cdot \frac{3 \pi}{2}} + (-2) \cdot e^{-i \cdot 3 \pi} + (-2+2i) \cdot e^{-i \cdot \frac{9\pi}{2}} \right) = \frac{1}{4} \left( 10 + (-2-2i) (i) + (-2) (-1) + (-2+2i) (-i) \right) = \frac{1}{4} \left( 10 + (2-2i) + 2 + (2+2i) \right) = \frac{16}{4} = 4$  
  + 結果是 $x = [1, 2, 3, 4]$。



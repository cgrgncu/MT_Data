# Appendix 4 Linear regression


### 一個無雜訊線性系統
$$
Y_{output}=S_{system}X_{input}
$$

```
其中:  
Y是輸出，是各種可能的觀測數據
S是系統，是不變的
X是輸入，是各種可能的觀測數據
```

### 一個有雜訊的線性系統
$$
Y_{output}=S_{system}X_{input}+\delta Y
$$

```
其中:  
Y是輸出，是各種可能的觀測數據
deltaY是雜訊。
S是系統，是不變的
X是輸入，是各種可能的觀測數據
```

+ 使用有限數量，n個X與n個Y來估計S。  

$$  
x_{1},x_{2},x_{3},...,x_{n}  
$$

$$  
y_{1},y_{2},y_{3},...,y_{n}  
$$

+ 使用最小平方法估計小s

$$  
min\left(\sum_{1}^{n}\left( \delta y_{i} \right)^{2}  \right)=min\left( \sum_{i}^{n}\left( y_{i}-sx_{i} \right)^{2} \right)
$$

+ 估計出小s

$$  
\bar{x}=\frac{1}{n}\sum_{1}^{n}x_{i}
$$

$$  
\bar{y}=\frac{1}{n}\sum_{1}^{n}y_{i}
$$

+ 探討deltaY
+ 探討的變數是chi-square distribution
+ 使用F distribution這個工具
```
F distribution 是兩個 chi-square distribution 的比值, 也可以寫成兩個 樣本標準差平方和族群標準差平方 的比值.

因為跟兩個族群有關, 所以受到兩個族群 n 值大小的影響. 精確點說, 是受到兩個族群的自由度的影響.

當我們在比較兩個族群是否相同時, 通常假設兩個族群的標準差平方會是相同的. 所以 F 就等於是在比較兩個群樣本間的標準差平方囉!

於是我們找到工具了. 要比較兩個樣本是否來自同一個族群(是否相同), 可以拿兩個樣本的標準差平方來比較. 把第一個樣本(裡面有n1個值, 自由度是 n1-1)的標準差平方, 除以第二個樣本(裡面有n2個值, 自由度是 n2-1)的標準差平方, 得到的比值拿去自由度為 n1-1, n2-1的 F distribution 裡比較, 看看出現的機率高不高. 如果你想推測的是第一個樣本的變異大於第二個樣本變異的機率, 請在 F distribution 裡看大於你計算出來 F 值的機率.
```

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

+ 使用最小平方法

$$  
min\left(\sum_{1}^{n}\left( \delta y_{i} \right)^{2}  \right)=min\left( \sum_{i}^{n}\left( y_{i}-Sx_{i} \right)^{2} \right)
$$

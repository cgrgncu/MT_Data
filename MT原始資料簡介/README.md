# MT原始資料簡介
+ 大地電磁法(Magnetotelluric, MT)的原始資料對於不同的人來說是指不同的東西:
  + 對地球物理學家來說，原始資料是指地球物理探勘問題的觀測資料。
  + 對工人來說，原始資料是從機器中量測到的一連串數據以及相關的參數設定。

### MT觀測資料
+ 時間域資料:
  + 時間序列資料
+ 頻率域資料(轉移函數,Transfer Function):
  + 頻譜資料
  + 阻抗資料(視電阻率與相位資料)
  + 傾子資料
  
### 時間序列資料
+ 許多研究人員並不具備判讀時間序列資料的能力。其主要原因如下:
  + 時間序列資料量龐大(可達數千萬個以上的資料點)，審視非常耗時。
  + 即使是專業的研究人員，直接觀察時間序列來判斷頻率域資訊非常困難，且容易錯誤判讀。
    + Q: 為什麼容易判讀錯誤??
  + 時間序列的資料通常是直接由儀器設備輸出的檔案，其格式通常由儀器商自訂，多數研究人員沒有能力讀取正確數值。
    + 許多重要的資訊包含時間、取樣率、抽樣、數位或類比濾波器參數等，儀器商不一定會提供程式進行讀取，也不提供檔案格式，造成研究人員分析困難。
  + 儀器儲存的資料檔案，多數是原始訊號經過濾波器、放大器之後的AD轉換數值，單位是[V]，而多數研究人員想看的單位是[mV/km]、[nT]。
    + 在時間域將[V]轉換成[mV/km]、[nT]等資料，需要搭配校正檔案。但這個過程非常困難且不完美，多數情況下我們選擇在頻率域進行此分析。
      + Q: 那時間域要怎麼做轉換?有多困難? 
    + 如果有人在研究中把時間序列畫出來，而且標註的是物理量[mV/km]、[nT]，請務必小心判讀。
      + 如何修正掉濾波器與放大器的效應是否有交代?
      + 若無修正掉，是否有提供濾波器與放大器的頻率響應資料?
      + 以MTU-5A系統提供的轉換工具，是選用一個常數當作頻率響應資料，簡單的將[V]轉換成[mV/km]、[nT]等資料，這樣的做法有相當大的瑕疵，建議只觀察圖形做初步評估。
+ 以MTU-5C來說時間序列資料包含以下資訊:
  + 每個測站共5個頻道存在資料夾「0」、「1」、「2」、「3」、「4」中。通常是指:「H2(Hy)」、「E1(Ex)」、「H1(Hx)」、「H3(Hz)」、「E2(Ey)」。
  + 依照不同取樣率使用不同檔名。例如:「td_24K」表示取樣率為24000[SPS]，「td_150」表示取樣率為150[SPS]。「bin」表示原生取樣率，取樣率為24K[SPS]。
    + 不同取樣率是由原生取樣率抽樣後產出的。
    + Q: 具體是怎麼做的?
    + Q: 為什麼要這樣抽樣?優點是什麼?缺點是什麼?
    + Q: 資料有需要連續嗎?為什麼? 
+ 檔案格式  
  + SEG EDI v1.0格式: 一種ASCII的格式，其中有定義如何記錄時間序列，但此方式非常冗長浪費空間，幾乎被棄用。
    + 但按照其文件5.1章節所述，原始時間序列通常沒有標準的單位，在被移除系統響應之前通常是整數。為了要移除系統響應，所以必須同時儲存系統響應資訊及量測操作資訊在檔案中。
  + MTU-5C請參考: DAA09 - DataFormat 3rd Party v2.0 - 210915.pdf
    + REF: https://github.com/torresolmx/PhoenixGeoPy 
  + mth5 格式: 由美國的許多大單位所組織的團隊建立的MT專用格式
    + This project is in cooperation with the Incorporated Research Institutes of Seismology, the U.S. Geological Survey, and other collaborators. Facilities of the IRIS Consortium are supported by the National Science Foundation’s Seismological Facilities for the Advancement of Geoscience (SAGE) Award under Cooperative Support Agreement EAR-1851048. USGS is partially funded through the Community for Data Integration and IMAGe through the Minerals Resources Program.
    + REF: https://mth5.readthedocs.io/en/latest/index.html
    + REF2: https://github.com/kujaku11/mth5
    + 在2022年起支援讀取phoenix MTU-5C資料，也是修改自PhoenixGeoPy的作者程式碼。
    + 但我還是看不出這個MTH5有什麼明確的讀取校正檔的方案...
+ 時間序列處理軟體
  + MTNET列舉免費軟體:
    + EMP: Arseny Shlykov's (Windows) programme for processing, visualisation and analysis of EM data
      + 這個目前下載要密碼了...等於不能取得...
    + Razorback: Farid Smai and Pierre Wawrzyniak's Open Source Python Library for Robust Processing of Magnetotelluric Data
      + 看起來沒有範例資料...
    + BIRRP: Alan Chave's codes
    + Gary Egbert's codes (from Gary Egbert)
  + Alan G. Jones的軟體: LiMS Downlodable Codes Page: version 5.1
    + https://homepages.dias.ie/ajones/progs/lims/lims.html 
    + https://homepages.dias.ie/ajones/

### 頻率域資料(轉移函數,Transfer Function)
+ 「Transfer Function」在訊號處理中是一個特殊意義的名詞，是一種描述系統的輸入與輸出之間關係的數學表示。
  + 比較完整的說是利用透過Z變換探討複數頻域下的輸入輸出之間的關係，寫出一個複數頻域下的數學關係式。
  + 但多數的數位訊號處理中，我們感興趣的是實數頻率域的響應函數，常採用傅立葉變換，探討一般所說的頻率響應(Frequency Response)。
  + 整個系統的事件視為: 「輸入訊號」進入「系統」產生「輸出訊號」。感興趣的是「系統響應」資訊:
    + Output(f)=Input(f)*System(f)
    + System(f)=Output(f)/Input(f)
    + 通常從物理上就是解釋這個系統把輸入訊號在特定頻率下放大了多少，相位延遲了多少。
  + 在MT中如果提到Transfer Function，事實上是在指以下三種事件發生的事情:
    + Ex(f)=Zxx(f)Hx(f)+Zxy(f)Hy(f)
      + 兩進一出的系統，輸入Hx(f)及Hy(f)，經過系統Zxx及Zxy，輸出Ex(f)
    + Ey(f)=Zyx(f)Hx(f)+Zyy(f)Hy(f)
      + 兩進一出的系統，輸入Hx(f)及Hy(f)，經過系統Zyx及Zyy，輸出Ex(f)
    + Hz(f)=Tx(f)Hx(f)+Ty(f)Hy(f)
      + 兩進一出的系統，輸入Hx(f)及Hy(f)，經過系統Tx及Ty，輸出Hz(f)
  + 感興趣的Transfer Function就是指頻率響應(Frequency Response)。
  + 電子儀器系統要測量感興趣的頻率響應(Frequency Response)資料，通常有以下三種方式:
    + 對系統輸入一個已知的恆定震幅的單頻正弦波，比較輸出相對於輸入的幅度和相移。依序對各種有興趣的頻率掃描。
      + 頻率掃描必須足夠慢，以便系統在每個關注點達到穩態。
    + 對系統輸入一個脈衝信號並對其時間序列進行傅立葉變換即可得到系統響應。
      + Q: 為什麼? 去看訊號處理教科書吧! 
    + 對系統輸入一個很長一段時間符合廣義平穩的白噪聲信號，透過傅里葉變換估算系統響應。
      + 使用此方法，如果需要相位信息，則應使用交叉譜密度（而不是功率譜密度）
  + 電子儀器系統要測量感興趣的頻率響應(Frequency Response)資料成功的條件:
    + 確定有輸入訊號與輸出訊號，並精確的控制輸入時間。
    + 確保輸入訊號強度遠大於實驗中的雜訊(可歸類為系統雜訊)。
  + 大地電磁法要測量感興趣的頻率響應(Frequency Response)資料成功的條件:
    + 存在強度遠大於雜訊的電磁波入射地球。
      + 電磁波訊號源主要來自外太空的太陽活動與電離層的大氣閃電活動。這些活動隨時在多個位置發生，可視為隨時在發射訊號。
      + 在物理學中，兩個以上的波在同個位置合成的現象稱為干涉。如果兩個波分別同相或異相，則合成波可能具有更大的強度（建設性干涉）或更低的振幅（破壞性干涉）。
      + 因此，在調查區域中的觀測設備，有機會接收到很低震幅的訊號，這將導致測量無效。然而，我們無法控制訊號，只能依靠等待，使用更多的時間來捕捉強訊號存在的事件(時間段)。
  + 大地電磁法要測量感興趣的頻率響應(Frequency Response)資料，通常進行以下方式:
    + 蒐集長時間的輸入訊號(Hx、Hy)與輸出訊號(Ex)，進行統計估算求取頻率響應。
      + 困難點在於:
        + 符合假設的電磁波(從無窮遠處空中來的平面電磁波垂直入射地球)為訊號，不符合假設的電磁波為雜訊，訊號要遠大於雜訊，這件事情很難確認是否為真。
        + 越低頻資料需要蒐集越長的時間，越長的時間越有可能受到各種可能的狀況來汙染資料。
+ 阻抗資料(Impedance Tensor)
  + 大地電磁法中，感興趣的系統響應之一就是阻抗。
    + 阻抗(Impedance)的單位會是: $\left[ \Omega \right]=\left[ \frac{V/m}{A/m} \right]$
      + 阻抗張量:  
      
$$
\mathbf{Z}\left(f\right)=
\begin{bmatrix}
Z_{xx}\left(f\right)&Z_{xy}\left(f\right)\\ 
Z_{yx}\left(f\right)&Z_{yy}\left(f\right) 
\end{bmatrix}
\mspace{36mu}\mspace{36mu}\text{(?)}
$$  

  + 阻抗是複數，常被視為實部=電阻，虛部=電抗。也常表示為阻抗強度與阻抗相位。
      + 可以繪製實部頻譜與虛部頻譜，但很少用，這裡不提。
      + 可以繪製阻抗的強度譜與相位譜。
+ 視電阻率(Apparent Resistivity)及相位(Phase)資料
    + 大地電磁法學者提出了視電阻率的概念，等同於另一種阻抗的表示方案:
      + 視電阻率(Apparent Resistivity)的單位會是: $\left[ \Omega m \right]$   
      + 相位的單位通常是[degrees]。
      + 「阻抗」與「視電阻率及相位」的關係:  

$$
\rho_{a}=\frac{1}{\omega\mu_{0}}\left| Z \right|^{2}
$$  

$$
\phi=tan^{-1}\left( \frac{\operatorname{Im}\begin{Bmatrix}Z\end{Bmatrix}}{\operatorname{Re}\begin{Bmatrix}Z\end{Bmatrix}} \right)
$$  
```
注意，這裡是教科書常寫的形式，其阻抗單位是[ohm]。  
其中，mu0為真空中的磁導率，單位[H/m]；omega為角頻率，單位[rad]。
這表示兩者為同個觀測值但是使用不同表述，基本上可以互相轉換。
```

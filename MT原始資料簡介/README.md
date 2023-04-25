# MT原始資料簡介
+ 大地電磁法(Magnetotelluric, MT)的原始資料對於不同的人來說是指不同的東西:
  + 對地球物理學家來說，原始資料是指地球物理探勘問題的觀測資料。
  + 對工人來說，原始資料是從機器中量測到的一連串數據以及相關的參數設定。

### MT觀測資料
+ 時間域資料:
  + 時間序列資料
+ 頻率域資料:
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
  + mth5 格式: 由美國的許多大單位所組織的團隊建立的MT專用格式
    + This project is in cooperation with the Incorporated Research Institutes of Seismology, the U.S. Geological Survey, and other collaborators. Facilities of the IRIS Consortium are supported by the National Science Foundation’s Seismological Facilities for the Advancement of Geoscience (SAGE) Award under Cooperative Support Agreement EAR-1851048. USGS is partially funded through the Community for Data Integration and IMAGe through the Minerals Resources Program.
    + REF: https://mth5.readthedocs.io/en/latest/index.html
    + REF2: https://github.com/kujaku11/mth5
    + 在2022年起支援讀取phoenix MTU-5C資料!

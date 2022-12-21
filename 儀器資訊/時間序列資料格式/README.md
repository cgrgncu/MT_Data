# 時間序列資料格式研究

### 時間序列檔案格式規格書
+ DAA09 - DataFormat 3rd Party v2.0 - 210915.pdf

### 相容硬體型號  
+ MTU-8A 
+ RXU-8A
+ MTU-5C
+ MTU-2C
+ MTU-5D
+ 其他延伸產品
  
### 相容軟體/韌體版本
+ v2.0以上版本

### 原生取樣率  
+ MTU-8A : 24K[SPS]
+ RXU-8A : 24K[SPS]
+ MTU-5C : 24K[SPS]
+ MTU-2C : 24K[SPS]
+ MTU-5D : 96K[SPS]

### SD卡中的存放位置
+ 「recdata」資料夾中
+ 「recdata」資料夾中每次連續紀錄會建立一個獨一無二的資料夾，命名方式如下:
  + XXXXX_YYYY-MM-DD-HHNNSS
  + XXXXX為五個數字，代表儀器序號
  + YYYY-MM-DD為記錄起始時間年月日，來自GPS時間(UTC+潤秒)。其中YYYY為西元年(四碼)，MM為月(兩碼)，DD為日(兩碼)。
  + HHNNSS為記錄起始時間時分秒，來自GPS時間(UTC+潤秒)。其中HH為24制小時(兩碼)，NN為分(兩碼)，SS為秒(兩碼)。  


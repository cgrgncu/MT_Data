# 確認MTU-5C主機韌體
+ 本文作者: HsiupoYeh
+ 更新日期: 2023-05-16

### 準備工具
+ MTU-5C 
  + 數量: 1台
+ MTU-5C電源線
  + 數量: 1條
+ 足夠電量的12V車用電池
  + 數量: 1個

### 步驟
+ 清點工具數量。
+ 連接主機、電源線、車用電池。
+ 旋轉鬆開SD卡保護蓋螺絲，向上拉起保護蓋，確認內部無插入SD卡。若已插入SD卡，請移除SD卡。過程中有沒有把保護蓋鎖回去都不影響。
+ 在關機狀態下確實穩定的短按(大概壓住維持半秒後放開)一次電源按鈕，電源燈號立刻慢速閃爍紅燈，SD燈號恆滅，表示開始進入開機程序。
```
按下電源按鈕啟動後，小螢幕模組會被通電並進入自己的模組開機。
該模組的開機畫面會先輪播白底、紅底、綠底、藍底，接著黑底並顯示I2C address訊息(I2C address:0x27 V4.2)。  
前述過程與資訊都不重要，只是例行模組開機流程。模組開機完成後小螢幕才開始等待MTU-5C主系統提供展示資訊。
```

+ 等待MTU-5C主系統開機完成，直到小螢幕變成白底加文字。
```
主系統應該是一種Linux作業系統，經測試，該Linux開機程序需要約60秒。開機後逐步初始化設備，並將資訊提供給小螢幕展示。  
開機完成後，SD燈會先閃爍，接著立刻小螢幕也會變成白底搭配文字來顯示主系統的資訊。此時主機的各按鈕已經可以使用。
在這之前，主機的按鈕都沒有任何效果，也不可以關機，除非你直接拔掉電源線，但這是危險行為請勿嘗試。
```

+ 小螢幕應該會顯示:
```
「RECEIVER ERRORS  」
「===============  」
「NO SD CARDIX     」
「                 」
「                 」
「                 」
「                 」
「                 」
「                 」
```
```
小螢幕的顯示的文字約每5秒會更新一次。
在螢幕亮著的時候按下SD按鈕，將切換為下一頁的資訊。資訊到最末頁後會繼續切換回第一頁，但第二輪開始會跳過韌體資訊頁面。
螢幕通電後，連續2分鐘沒有按下SD按鈕，小螢幕模組將被斷電關閉，螢幕滅著，全黑沒有任何文字。
在螢幕滅著的時候按下SD按鈕，將重新使小螢幕模組通電並進入模組開機程序，完成後等待周期約5秒的更新，即可看到展示資訊。
```

+ 再確實穩定的短按(大概壓住維持半秒後放開)一次SD按鈕，小螢幕將切換至下一頁資訊，應該會顯示韌體版本:
```
「=================」
「     PHOENIX     」
「    GEOPHYSICS   」
「=================」
「                 」
「     RMT03-J     」
「     v2.9.0.2    」
「                 」
「                 」
```
```
韌體資訊頁面只會顯示一次，第二輪開始切換下一頁就會跳過韌體資訊頁面。請珍惜這次瀏覽的機會，否則要重新開機一次了。  
目前測試的這台版本是「RMT03-J v2.9.0.2」。
```

+ 若有需要可持續利用SD按鈕查看其他資訊頁。
+ 長按電源按鈕超過3秒，電源燈號與SD燈號立刻同時快速閃爍紅燈，表示開始進入關機程序。接著電源燈號與SD燈號同時恆滅，表示已關機完畢。
+ 關機完畢後，把保護蓋鎖回去，並拆除電源線及收拾車用電池。若習慣保存時把SD卡插著也可以插回去。
+ 結束。


### 從資料檔案查詢韌體版本
+ 從「executor.log」檔案中可以找到相關資訊。
+ 從「backend.log」檔案中可以找到相關資訊。
+ 使用Empower軟體，從「View Recording Details」進去，看「Instrument Info」的「OS Version」部分。


### 目前在用的版本更新紀錄整理(September 14 2022 : v2.9.0.7)
+ 處理軟體(EMpower v2.9)搭配接收器主機(內置韌體版本v2.9)使用。主要修正已下功能:
  + 開始支援新型磁力感應器(MTC-155、MTC-185)
  + 軟體可運行在多個現代化個人電腦作業系統中(Windows 11/64、Linux Ubuntu 20/64 和 macOS 12 Monterey Apple Silicon)
  + 啟用了電極的前置放大器校準。
  + 改善其他次要功能
  + 其他錯誤修正。
+ 完整支援新型磁力感應器(MTC-155、MTC-185)，且可以在資料蒐集與校正期間自動偵測序號。
+ 支援Bartington Mag13磁通量計。
+ 改善靈活性、工作流程、系統穩定性。
+ Major New Features:
  + Support for Phoenix MTC-155 sensors, including serial number auto-detection
  + Support for Phoenix MTC-185 sensors, including serial number auto-detection
  + Support for Bartington Mag13 sensors
  + Electrode pre-amp calibration enabled
  + Support for Windows 11 64-bit
  + Support for Linux Ubuntu 20.04.4
  + Support for macOS 12 Monterey / Apple Silicon
+ Other New Features and Fixes:
  + Extrapolated MTC series sensors calibration down to 5000s 
  + CSV export for CSAMT sites now support azimuth
  + Cross-power file now stored in spectral density
  + Added multi-recording selection in recording library 
  + Field QC now shows which H channel used in CSAMT processing
  + Grid positions in the station editor are now hidden when the grid is not available
  + Added recording library filter based on survey technique
  + CSAMT processing now allows user to select between local H channels
  + Fixed a crash when removing a CSAMT workbench, re-enabled multiple workbench support
  + Fixed a crash when switching calibrations for CSAMT
  + Various other minor bug fixes and improvements 

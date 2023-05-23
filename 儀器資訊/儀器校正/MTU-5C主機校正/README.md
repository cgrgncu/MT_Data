# MTU-5C主機校正
+ MTU-5C主機校正在英文中是指MTU-5C Receiver Calibration。
+ 本文作者: HsiupoYeh
+ 更新日期: 2023-05-23

### 準備工具
+ MTU-5C 
  + 數量: 1台
+ MTU-5C電源線
  + 數量: 1條
+ 足夠電量的12V車用電池
  + 數量: 1個
+ MTU-5C適用SD卡
  + 數量: 1張 
  + 依照原廠建議，SD卡容量至少64[GB]，可用空間視應用而定。SD卡檔案格式為exFat。  
### 步驟
+ 清點工具數量。
+ 連接主機、電源線、車用電池。
+ 旋轉鬆開SD卡保護蓋螺絲，向上拉起保護蓋，取出SD卡。若SD卡本來就不在主機中，請省略此步驟。過程中有沒有把保護蓋鎖回去都不影響。
+ 清空SD卡。若知道檔案架構確認不會有路徑衝突的問題且保留有足夠空間，可省略此步驟。
+ 利用Empower軟體製作config檔案。
  + 執行Empower，選「Prepare」，「Receiver Type」維持「MTU-5C」，選「Calibration」區塊的「Receiver」，利用對話框將config檔案先存到桌面。
  + 檔案內容如下(使用UTF-8編碼):
  ```json
  {
      "config": [
          {
              "RTMT": {
                  "hi_freq": false,
                  "low_freq": false,
                  "mid_freq": false
              },
              "calibration": {
                  "delete_timeseries": true,
                  "passes_requested": 1,
                  "type": "receiver"
              },
              "chanconfig": [
                  {
                      "at": 0,
                      "ga": 1,
                      "ga_ext": 1,
                      "length1": 50,
                      "length2": 50,
                      "lp": 10000,
                      "lp_ext": 4,
                      "on": 1,
                      "pg": 4,
                      "pg_ext": 2,
                      "tag": "E1",
                      "version": 2
                  },
                  {
                      "at": 0,
                      "ga": 1,
                      "ga_ext": 1,
                      "length1": 50,
                      "length2": 50,
                      "lp": 10000,
                      "lp_ext": 4,
                      "on": 1,
                      "pg": 4,
                      "pg_ext": 2,
                      "tag": "E2",
                      "version": 2
                  },
                  {
                      "ga": 4,
                      "ga_ext": 2,
                      "lp": 10000,
                      "lp_ext": 4,
                      "on": 1,
                      "serial": 0,
                      "tag": "H1",
                      "type": 14,
                      "type_name": "MTC-155",
                      "version": 1
                  },
                  {
                      "ga": 4,
                      "ga_ext": 2,
                      "lp": 10000,
                      "lp_ext": 4,
                      "on": 1,
                      "serial": 0,
                      "tag": "H2",
                      "type": 14,
                      "type_name": "MTC-155",
                      "version": 1
                  },
                  {
                      "ga": 4,
                      "ga_ext": 2,
                      "lp": 10000,
                      "lp_ext": 4,
                      "on": 1,
                      "serial": 0,
                      "tag": "H3",
                      "type": 14,
                      "type_name": "MTC-155",
                      "version": 1
                  }
              ],
              "config_index": 0,
              "decimation": {
                  "divider_id": 2,
                  "interleave_lev0": 2,
                  "interleave_lev1": 0,
                  "version_1": {
                      "interleave_150": 1,
                      "interleave_2400": 0,
                      "interleave_24k": 2,
                      "interleave_30": 0,
                      "interleave_96k": 0,
                      "period": 30
                  }
              },
              "layout": {
                  "Company_Name": "",
                  "Layout_Type": 4,
                  "Notes": "",
                  "Operator": "",
                  "Station_Name": "",
                  "Survey_Name": "",
                  "version": 6
              },
              "potres_detect": true,
              "schedule_name": "Manual Override",
              "sensor_detect": true,
              "startTime": 0,
              "stopTime": 0,
              "version": 1
          }
      ],
      "empower_version": "v2.9.0.11",
      "network": {
          "gateway": "",
          "ipaddr": "",
          "mode": "dhcp",
          "nameserver": [
          ],
          "netmask": "",
          "serve_dhcp": false,
          "serve_dhcp_end": "",
          "serve_dhcp_start": ""
      },
      "power_recovery_enabled": false,
      "receiver": "MTU-5C",
      "schedule": "No Schedule (button only)",
      "surveyTechnique": 1,
      "timezone": "",
      "timezone_offset": 0,
      "version": 18
  }
  ```
+ 複製該檔案到SD卡的根目錄下。
+ 插入SD卡到MTU-5C主機中，並把保護蓋鎖回去。
```
卡片有防呆，不要硬插，插得進去的方向很容易就插入了。
```
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
```
小螢幕的顯示的文字約每5秒會更新一次。
在螢幕亮著的時候按下SD按鈕，將切換為下一頁的資訊。資訊到最末頁後會繼續切換回第一頁，但第二輪開始會跳過韌體資訊頁面。
螢幕通電後，連續2分鐘沒有按下SD按鈕，小螢幕模組將被斷電關閉，螢幕滅著，全黑沒有任何文字。
在螢幕滅著的時候按下SD按鈕，將重新使小螢幕模組通電並進入模組開機程序，完成後等待周期約5秒的更新，即可看到展示資訊。
```

+ 再確實穩定的短按(大概壓住維持半秒後放開)一次SD按鈕，小螢幕將切換至下一頁資訊，應該會顯示儀器狀態:
```
「Instrument Status」
「=================」
「Mode: Idle       」
「Temp [C]: 26     」
「GPS: 5  [sync]   」
「Batt [V]: 12.45  」
「SD Use:0.0/64 GB 」
「                 」
```


+ 若有需要可持續利用SD按鈕查看其他資訊頁。
```
「Recording Status 」
「================ 」
「Samp/sec: 24000  」
「Continuous samples」
「Rec time: 0:0h   」
「                 」
「                 」
「                 」
```
```
「CS LICENSES      」
「===============  」
「License Not      」
「Available        」
「                 」
「                 」
「                 」
「                 」
```
```
「E1 Config        」
「==========       」
「Gain: 8x1        」
「LPF[Hz]: 10000   」
「Max[V]: ±1.250   」
「                 」
「                 」
「                 」
```
```
「E2 Config        」
「==========       」
「Gain: 8x1        」
「LPF[Hz]: 10000   」
「Max[V]: ±1.250   」
「                 」
「                 」
「                 」
```
```
「H1 Config        」
「==========       」
「Gain: 4          」
「LPF[Hz]: 10000   」
「Sens Conf: MTC-155」
「sn Conf: 0       」
「Max[V]: ±2.500   」
「                 」
```
```
「H2 Config        」
「==========       」
「Gain: 4          」
「LPF[Hz]: 10000   」
「Sens Conf: MTC-155」
「sn Conf: 0       」
「Max[V]: ±2.500   」
「                 」
```
```
「H3 Config        」
「==========       」
「Gain: 4          」
「LPF[Hz]: 10000   」
「Sens Conf: MTC-155」
「sn Conf: 0       」
「Max[V]: ±2.500   」
「                 」
```
```
「Instrument Status」
「=================」
「Mode: Idle       」
「Temp [C]: 26     」
「GPS: 6  [lock]   」
「Batt [V]: 12.45  」
「SD Use:0.0/64 GB 」
「                 」
```
+ 但基本上最主要關心儀器狀態頁面的GPS資訊。
  + 沒有接線無GPS顯示     : 「GPS: 0  [--]   」，燈號上紅下藍皆恆亮。
  + 有接線同步GPS中顯示   : 「GPS: 7  [sync]   」，燈號上紅下藍皆恆亮。
    + 有接線同步GPS中顯示   : 「GPS: 7  [Dif: -10]   」，燈號上紅下藍皆恆亮。這可能是檢測內部時鐘修正。  
  + 有接線鎖定GPS顯示     : 「GPS: 7  [lock]   」，燈號上藍下藍皆恆亮。
```
搜尋GPS到可以被鎖定需要約30-60秒。應該是四顆衛星才會開始sync。只有在Idel模式下會改變燈號。
```
+ GPS鎖定的時候，燈號上藍下藍皆恆亮。等GPS鎖定後短按一次電源按鈕，開始校正。
  + 開始校正的時候，燈號立刻反應，上藍下藍皆閃爍。閃爍沒有同步，看起來上面的是1秒一次，下面的是接著閃但沒很穩定。
  + 開始校正的時候，Mode 是Receiver CAL，H1~H3變成Gain=1x1，0:5-> Gain=4
+ 校正耗時8-9分鐘。

+ 長按電源按鈕超過3秒，電源燈號與SD燈號立刻同時快速閃爍紅燈，表示開始進入關機程序。接著電源燈號與SD燈號同時恆滅，表示已關機完畢。
+ 關機完畢後，把保護蓋鎖回去，並拆除電源線及收拾車用電池。若習慣保存時把SD卡插著也可以插回去。
+ 結束。


### 從資料檔案查詢韌體版本
+ 從「executor.log」檔案中可以找到相關資訊。
+ 從「backend.log」檔案中可以找到相關資訊。
+ 使用Empower軟體，從「View Recording Details」進去，看「Instrument Info」的「OS Version」部分。


### 目前在用的版本更新紀錄整理(EMpower: September 14 2022 : v2.9.0.7)(MTU-5C: v2.9.0.2)
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

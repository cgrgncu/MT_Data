# 官方資源
+ https://manuals.geo-metronix.de/

### 裝置需求
+ 前面板SD卡須使用ext4格式 (REF:APPL001_UpdateJoblist.pdf)
  + 通常這個一直都會裝著，不會移除。
  + 提示: 更新過程會把前面板SD卡格式化。裡面的時間序列資料請先備份出來。
+ USBDISK請使用FAT32格式 (REF:APPL001_UpdateJoblist.pdf)
  + 平常可能不會裝在上面，可以先拔下來格式化好再插上去。 

### 使用隨身碟更新韌體
+ REF:APPL001_UpdateJoblist.pdf
+ 查看網頁介面版本:
  + 從網頁左下角找到:
    +  ADU-08e#177: ADU Webinterface version 1.6.100000.1.43
+ 查看韌體版本:
  + 從第二個標籤頁(ADU-177)找到「Hardware Config」頁面，拉到最下面看一下:
    ```
    Software - $Date: 2024-11-04 10:21:58 +0100 (Mo, 04. Nov 2024) $ - Released Software
    CPU-MCP:	1.9.0.1.388
    Date:	$Date: 2024-11-04 10:21:58 +0100 (Mo, 04. Nov 2024) $
    CLK-MCP:	1.7.0.1.178
    ADB-MCP-CH0:	1.6.0.1.96
    ADB-MCP-CH1:	1.6.0.1.96
    ADB-MCP-CH2:	1.6.0.1.96
    ADB-MCP-CH3:	1.6.0.1.96
    ADB-MCP-CH4:	1.6.0.1.96
    ``` 
+ 下載韌體: Joblist_ADU-08e_SW_Update_Release_1p10.zip (約812MB)
+ 在WINDOWS電腦中，格式化USBDISK，用32GB，FAT32格式。
+ 在WINDOWS電腦中，準備檔案到USBDISK卡中:
  ```
  使隨身碟根目錄下存在:
  X:\ADUConf\
  X:\JLE_Template_ADU-08e_5BB\
  X:\Scripts\
  X:\Update\
  ```
+ 開機等SELFTEST完成，並且停止所有JOB。然後狀態為IDLE。
+ 從第二個標籤頁(ADU-177)找到「Status> System Status」頁面，看一下「Disk Space」是否有SD卡存在。必須要有，才能往下一步驟。
+ 將USDDISK從WINDOWS移除，然後插到主機上。很快的主機開始進行更新，第一階段要五分鐘。
+ 小螢幕會一直顯示他在幹嘛。一直等待直到小螢幕關閉，所有LED燈也滅掉。
+ 移除USBDISK。
+ 手動按下POWER按鈕開機。開機後等待一下SELFTEST。可能他還會重開機。
+ 等網頁可以連線後，再次去檢查韌體版本:
+ 查看網頁介面版本:
  + 從網頁左下角找到:
    +  ADU-08e#177: ADU Webinterface version 1.10.0.1.47
+ 查看韌體版本:
  + 從第二個標籤頁(ADU-177)找到「Hardware Config」頁面，拉到最下面看一下:
    ```
    Software - $Date: 2025-02-03 14:14:33 +0100 (Mo, 03. Feb 2025) $ 
    CPU-MCP:	1.10.0.1.396
    Date:	$Date: 2025-02-03 14:14:33 +0100 (Mo, 03. Feb 2025) $
    CLK-MCP:	1.7.0.1.178
    ADB-MCP-CH0:	1.6.0.1.96
    ADB-MCP-CH1:	1.6.0.1.96
    ADB-MCP-CH2:	1.6.0.1.96
    ADB-MCP-CH3:	1.6.0.1.96
    ADB-MCP-CH4:	1.6.0.1.96
    ``` 
### 如何確認SELFTEST完成
+ 開機之後可以開始嘗試開啟網頁。但一開始可能會失敗，因為網頁伺服器還沒開起來。
+ 當伺服器開起來之後，可能是假的網頁，也還要等等。
+ 可能等個約一分鐘後，用New Session進去網頁。我們沒有要改只是要看狀態。
+ 從第二個標籤頁(ADU-177)找到「System Histoary」頁面，翻閱一下，應該會有:
  + selftest result: NOK之類的紀錄，就表示做完了。


### ADU啟用了SAMBA功能(但非常不建議在公用網路上使用)
+ 版本: 未知???
+ 主要使用PORT: 445 
+ 有帳號密碼

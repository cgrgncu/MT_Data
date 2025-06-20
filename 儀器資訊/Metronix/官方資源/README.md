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
+ 準備檔案到SD卡中:
  ```
  使隨身碟根目錄下存在:
  X:\ADUConf\
  X:\JLE_Template_ADU-08e_5BB\
  X:\Scripts\
  X:\Update\
  ``` 
+ 流程: 裝好SD卡，準備好USBDISK，開機，給系統一些時間直到系統關機，再次開機後裡面已經有新任體，可以去網頁查版本。

# 草擬QC流程
+ 作者: HsiupoYeh

### LRN為例
+ 布置好測站，寫好紀錄紙，就立刻在NAS上建立對應資料夾，標註整理中，紀錄紙先拍照上傳到NAS中。
+ 收好測站資料後，長度一個月內的資料就進行壓縮，壓為zip。有好的網路的時候上傳。
+ 現場快速做幾個基本的資料處理:
  + 開啟一個專案叫做QC_LRN，匯入原始資料及CAL檔案。
  + 查看紀錄紙是否需要旋轉，展距長度是否正確。
  + 看一下有幾天的資料。
  + LRN20230822B(LRN12):
  + + QC_Unedited
    + QC_All: PHSXY:1to89，PHSYX:-179to-91。
    + QC_Day: 取用[台灣時間06to18=GPS時間22to10]，設定GPS時間OFF:10~22，PHSXY:1to89，PHSYX:-179to-91。
    + QC_Night: 取用[台灣時間18to06=GPS時間10to22]，設定GPS時間OFF:22~10，PHSXY:1to89，PHSYX:-179to-91。
  + LRN20230815A(LRN07):
    + 單站分析:LRN20230815A(LRN07)_LH
      + 天分析(日期w星期，Local Time，星期一=w1，星期日=w7):
        + 0815w2 Mask#1:頭到0814T1600 Mask#2:0815T1600到尾
        + 0816w2 Mask#1:頭到0815T1600 Mask#2:0816T1600到尾
        + 0817w2 Mask#1:頭到0816T1600 Mask#2:0817T1600到尾
        + 0818w2 Mask#1:頭到0817T1600 Mask#2:0818T1600到尾
        + 0819w2 Mask#1:頭到0818T1600 Mask#2:0819T1600到尾
        + 0820w2 Mask#1:頭到0819T1600 Mask#2:0820T1600到尾
        + 0821w2 Mask#1:頭到0820T1600 Mask#2:0821T1600到尾
  + 做LRN03單站分析(日期是Local Time):
    + LRN03_LH_0731_0808
    + LRN03_LH_0731w1
    + LRN03_LH_0801w2
    + LRN03_LH_0802w3
    + LRN03_LH_0803w4
    + LRN03_LH_0804w5
    + LRN03_LH_0805w6
    + LRN03_LH_0806w7
    + LRN03_LH_0807w1
    + LRN03_LH_0808w2
   
  + https://github.com/robertknight/Qt-Inspector

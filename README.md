# MT_Data
大地電磁法資料 相關說明

### 通用交換格式
  + EDI檔案。

### 資料夾建議命名方式
  + 先填寫調查計畫基本資料表，下方為範例:  
  
| 項目               | 內容                          | 說明                                               |
| ------------------ | ---------------------------- | -------------------------------------------------- |
| 調查計畫編號        | 20220330MT               | 通常為計劃開始日期                                   |
| 調查地點名稱(英文)  | Taiwan-Taoyuan-NCU(NCU)  | 調查案英文全名為:[20220330MT]Taiwan-Taoyuan-NCU(NCU) |
| 調查地點名稱(中文)  | 桃園區中央大學校園(NCU)    | 說明                                                |

  + 此時將資料夾命名為:「[20220330MT]Taiwan-Taoyuan-NCU(NCU)」。

### 檔案結構說明

<table>
<tbody>
<tr>
<td colspan="19" width="431">
<p>路徑</p>
</td>
<td colspan="6" width="136">
<p>說明</p>
</td>
</tr>
<tr>
<td colspan="19" width="431">
<p>X:\</p>
</td>
<td colspan="6" width="136">
<p>根目錄</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="18" width="409">
<p>[20220330MT]Taiwan-Taoyuan-Zhongli(NCU)\</p>
</td>
<td colspan="6" width="136">
<p>20220330MT=日期，格式YYYYMMDD。</p>
<p>Taiwan-Taoyuan-Zhongli=國家-城市-地名。</p>
<p>NCU=3至4碼調查計畫簡稱</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="17" width="386">
<p>Doc\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>測站清單.docx</p>
<p>測站清單.kml</p>
<p>測站位置圖.png</p>
<p>測站野外施測成果報告.pdf</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="17" width="386">
<p>NCU20201001A(W01A)\</p>
</td>
<td colspan="6" width="136">
<p>測站名稱</p>
<p>名稱依照計畫簡稱與實際施工日期命名，其中「NCU」為調查案英文3至4碼簡稱，「20220401」為施工日期2022年04月01日，「A」代表該日施工順序（A為第一個施工的站，B為第二個，依此類推），小括號內的文字則為測站簡稱。簡稱部分建議</p>
<p>第四碼A為AMT</p>
<p>第四碼M為MT</p>
<p>第四碼B為BMT</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>RawData\</p>
</td>
<td colspan="6" width="136">
<p>原始資料</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.TBL</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.TSn</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.CLC</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.CLB</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>Doc\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>LOG_NCU20220401A(W01A).pdf</p>
</td>
<td colspan="6" width="136">
<p>野外工作紀錄表</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>Pic\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>IMG_NCU20220401A(W01A)_01.jpg</p>
<p>IMG_NCU20220401A(W01A)_02.jpg</p>
<p>IMG_NCU20220401A(W01A)_03.jpg</p>
<p>IMG_NCU20220401A(W01A)_04.jpg</p>
<p>IMG_NCU20220401A(W01A)_05.jpg</p>
<p>IMG_NCU20220401A(W01A)_06.jpg</p>
<p>IMG_NCU20220401A(W01A)_07.jpg</p>
<p>IMG_NCU20220401A(W01A)_08.jpg</p>
<p>IMG_NCU20220401A(W01A)_09.jpg</p>
</td>
<td colspan="6" width="136">
<p>野外工作照片</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>EDI\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>NCU20220401A(W01A)_SS.edi</p>
<p>NCU20220401A(W01A)_RR.edi</p>
</td>
<td colspan="6" width="136">
<p>單站估算與遠端參考法估算資料</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="17" width="386">
<p>NCU20220401A(W02A)\</p>
</td>
<td colspan="6" width="136">
<p>測站名稱</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="17" width="386">
<p>...</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="17" width="386">
<p>NCU20220401A(W16)\</p>
</td>
<td colspan="6" width="136">
<p>測站名稱</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="17" width="386">
<p>NCU20220401A(WR1)\</p>
</td>
<td colspan="6" width="136">
<p>測站名稱</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>RawData\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.TBL</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.TSn</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.CLC</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>*.CLB</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>Doc\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>LOG_NCU20201001A(WR1A).pdf</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>Pic\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>IMG_NCU20220401A(WR1A)_01.jpg</p>
<p>IMG_NCU20220401A(WR1A)_02.jpg</p>
<p>IMG_NCU20220401A(WR1A)_03.jpg</p>
<p>IMG_NCU20220401A(WR1A)_04.jpg</p>
<p>IMG_NCU20220401A(WR1A)_05.jpg</p>
<p>IMG_NCU20220401A(WR1A)_06.jpg</p>
<p>IMG_NCU20220401A(WR1A)_07.jpg</p>
<p>IMG_NCU20220401A(WR1A)_08.jpg</p>
<p>IMG_NCU20220401A(WR1A)_09.jpg</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="16" width="363">
<p>EDI\</p>
</td>
<td colspan="6" width="136">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td colspan="15" width="341">
<p>NCU20220401A(WR1A)_SS.edi</p>
</td>
<td colspan="6" width="136">
<p>遠端站僅有單站估算資料</p>
</td>
</tr>
<tr>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">
<p>&nbsp;</p>
</td>
<td width="22">&nbsp;</td>
</tr>
</tbody>
</table>


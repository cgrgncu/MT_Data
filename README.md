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

### edi繪圖範例:

```matlab
%**************************************************************************
%   Name: yeh_export_edi_rhoxy_v20220928a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20220928a
%   Description: 輸出HsiupoYeh建議的大地電磁法視電阻率圖(WxH=300x270)
%                經過測試可用於MATLAB R2009a版本。
%**************************************************************************
clear;clc;close all
%==========================================================================
%--------------------------------------------------------------------------
% 因為MTALAB每個版本的繪圖引擎可能有差異，可能造成輸出異常。故限制版本。
MATLAB_Version=version;
if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
    disp('提示:正確運行在MATLAB R2009a版本...')
    MATLAB_Version_str='R2009a';
else
    disp('未測試通過的MATLAB版本,return!')
    return
end
%--------------------------------------------------------------------------
% MATLAB產生的繪圖視窗figure只能比當前螢幕尺寸小，目前只允許螢幕解析度大於720p的
% 狀況下(且螢幕沒有旋轉，寬度=1920，高度=1080)運行此程式，以免錯誤發生。
%--
% 取得螢幕的尺寸，MonitorPositions會比ScreenSize準確。
current_screen_resolution=get(0, 'MonitorPositions');
current_screen_width=current_screen_resolution(3);
current_screen_height=current_screen_resolution(4);
if current_screen_width>=1920 && current_screen_height>=1080
    disp('解析度大於1080p，可正常執行!')
else
    disp('解析度太小，可能會造成錯誤，不允許執行。return!')
    return
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% MATLAB產生的繪圖視窗figure只能比當前螢幕尺寸小，目前只允許螢幕解析度大於720p的
% 狀況下(且螢幕沒有旋轉，寬度=1920，高度=1080)運行此程式，以免錯誤發生。
%--
% 取得螢幕的尺寸，MonitorPositions會比ScreenSize準確。
current_screen_resolution=get(0, 'MonitorPositions');
current_screen_width=current_screen_resolution(3);
current_screen_height=current_screen_resolution(4);
if current_screen_width>=1920 && current_screen_height>=1080
    disp('解析度大於1080p，可正常執行!')
else
    disp('解析度太小，可能會造成錯誤，不允許執行。return!')
    return
end
%--------------------------------------------------------------------------
%==========================================================================
%==========================================================================
WinGLinkEdiFile=read_WinGLink_edi_to_mat(['Input_winglink_0d\TVG201_Org.edi']);
Site_full_name='TVG201';
%========================================================================== 
Export_PNG_Width=300;%注意這個值不能太大...
main_axes_with=225;%300*0.75
    %----------------------------------------------------------------------
    % 建立預設的空白figure視窗
    figure_handle=figure('Visible','on','Position',[0,0,500,1000]);
    movegui(figure_handle,'center')    
    %--
    % 設定背景
    set(figure_handle,'color',[1,1,1])
    %----------------------------------------------------------------------
    % 空白繪圖。調整字體與資料單位等比例。
    axes_handle=gca;
    set(axes_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(axes_handle,'DataAspectRatio',[1,1,1]);%[1,1,1]->資料單位等比例，這個設定之後PlotBoxAspectRatio就自動強制計算了。
    %----------------------------------------------------------------------
    % 設定空白座標刻度。設定座標軸上下限。
my_xlim_vector=[-4,5];
    set(axes_handle,'Xlim',my_xlim_vector)
    set(axes_handle,'XTick',[])
    set(axes_handle,'XDir','reverse')
    %--
my_ylim_vector=[-2,5];
    set(axes_handle,'Ylim',my_ylim_vector)
    set(axes_handle,'YTick',[])
    %----------------------------------------------------------------------
    % 設定空白標題
    % 手動設定過title的位置，就不會因自動調整而影響到原來座標軸的位置
    title_handle=title('');
    set(title_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_title_xyz=get(title_handle,'Position');
    % 故意手動將title位置的z值增加一點點，這個對2D圖的畫面幾乎沒影響。
    set(title_handle,'Position',[temp_title_xyz(1),temp_title_xyz(2),temp_title_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % 設定空白xlabel
    % 手動設定過xlabel的位置，就不會因自動調整而影響到原來座標軸的位置
    xlabel_handle=xlabel('');
    set(xlabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_xlabel_xyz=get(xlabel_handle,'Position');
    % 故意手動將xlabel位置的z值增加一點點，這個對2D圖的畫面幾乎沒影響。
    set(xlabel_handle,'Position',[temp_xlabel_xyz(1),temp_xlabel_xyz(2),temp_xlabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % 設定空白ylabel
    % 手動設定過ylabel的位置，就不會卡到原來座標軸的範圍
    ylabel_handle=ylabel('');
    set(ylabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_ylabel_xyz=get(ylabel_handle,'Position');
    % 故意手動將ylabel位置的z值增加一點點，這個對2D圖的畫面幾乎沒影響。
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % 加框。
    box on    
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    % 調整自訂Position，使座標軸依照所需尺寸正確地出現在畫面中。
    set(axes_handle,'Units','pixels')
    set(axes_handle,'Position',[100,100,main_axes_with,900])
    %--
    % 擷取視窗像素資料
    temp_frame=getframe(figure_handle);
    %--
    % 從正中間取出一條垂直線的像素資料，找出左右邊界
    vertical_line=double(temp_frame.cdata(:,102,1));
    find_result=find(vertical_line~=255);
    if length(find_result)==2
        distance=find_result(2)-find_result(1);
        axes_top_pexel_index=find_result(1);
        disp(['上邊界像素索引值=',num2str(axes_top_pexel_index)])        
        axes_bottom_pexel_index=find_result(2);
        disp(['下邊界像素索引值=',num2str(axes_bottom_pexel_index)])
        disp(['找到垂直方向黑色界線，距離=',num2str(distance)])
    else
        disp('找不到垂直方向黑色界線')
    end        
    %--
    disp('--')
    %--
    % 從正中間取出一條水平線的像素資料，找出左右邊界
    horizontal_line=double(temp_frame.cdata(axes_bottom_pexel_index-2,:,1));    
    find_result=find(horizontal_line~=255);
    if length(find_result)==2
        distance=find_result(2)-find_result(1);
        axes_left_pexel_index=find_result(1);
        disp(['左邊界像素索引值=',num2str(axes_left_pexel_index)])
        axes_right_pexel_index=find_result(2);
        disp(['右邊界像素索引值=',num2str(axes_right_pexel_index)])
        disp(['找到水平方向黑色界線，距離=',num2str(distance)])
    else
        disp('找不到目標水平方向黑色界線')
    end
    %--
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
%==========================================================================
%==========================================================================
% 開始正常繪圖
%--
% 資料曲線
hold on
errorbar(log10(WinGLinkEdiFile.FREQ.Data),log10(WinGLinkEdiFile.RHOXY.Data),WinGLinkEdiFile.RHOXY_ERR.Data,'r.');
errorbar(log10(WinGLinkEdiFile.FREQ.Data),log10(WinGLinkEdiFile.RHOYX.Data),WinGLinkEdiFile.RHOYX_ERR.Data,'b.');
%--
%--------------------------------------------------------------------------
%把標題設定回去
set(title_handle,'String','TVG102 Rot: 0.0 [°]')
% 調整位置比座標軸上邊界高5[px]
set(title_handle,'Units','pixels')
temp_title_xyz=get(title_handle,'Position');
set(title_handle,'Position',[temp_title_xyz(1),5+(axes_bottom_pexel_index-axes_top_pexel_index),temp_title_xyz(3)]);
%--------------------------------------------------------------------------
% 設定XTick
set(axes_handle,'Xlim',my_xlim_vector)
set(axes_handle,'XTick',[my_xlim_vector(1):my_xlim_vector(2)])
%--
% 設定X標題
set(xlabel_handle,'String','Frequency [10^x Hz]')
    set(xlabel_handle,'Units','pixels')
    temp_xlabel_xyz=get(xlabel_handle,'Position');
% 設定y為-18px
 temp_xlabel_xyz(2)=-18;
    set(xlabel_handle,'Position',[temp_xlabel_xyz(1),temp_xlabel_xyz(2),temp_xlabel_xyz(3)])
%--------------------------------------------------------------------------
% 設定YTick
set(axes_handle,'Ylim',my_ylim_vector)
set(axes_handle,'YTick',[my_ylim_vector(1):my_ylim_vector(2)])
%--
% 設定Y標題
set(ylabel_handle,'String','App.Res [10^x \Omegam]')
    set(ylabel_handle,'Units','pixels')
    temp_ylabel_xyz=get(ylabel_handle,'Position');
% 設定x為-10[px]
temp_ylabel_xyz(1)=-18;
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)])
%--------------------------------------------------------------------------
% 設定網格線
grid on
%--------------------------------------------------------------------------
    % 設定圖說
    legend_handle=legend('XY','YX','Location','SouthOutside');
    set(legend_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(legend_handle,'Orientation','horizontal') 
    set(legend_handle,'Units','pixels')
    set(legend_handle,'Box','off')
set(legend_handle,'PlotBoxAspectRatio',[100,20,1])
    temp_legend_xyz=get(legend_handle,'Position');
set(legend_handle,'Position',[axes_left_pexel_index+56,1000-axes_bottom_pexel_index-62,100,20]);
%--------------------------------------------------------------------------
    % 截圖
    temp_frame=getframe(figure_handle);
%--
% 輸出圖片比box線還要往上多少像素
box_padding_top_px=34;
box_padding_bottom_px=60;
box_padding_left_px=46;
box_padding_right_px=28;
    % 輸出目標區域到檔案
    output_png_file_name=['yeh_export_edi_rhoxy_v20220928a_',MATLAB_Version_str,'.png'];
    image_data=temp_frame.cdata(axes_top_pexel_index-box_padding_top_px:axes_bottom_pexel_index+box_padding_bottom_px,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    %--
    % 輸出圖檔
    disp(['開始輸出圖檔(WxH=',num2str(length(image_data(1,:,1))),'x',num2str(length(image_data(:,1,1))),')...'])
    imwrite(image_data,output_png_file_name);
    disp('輸出圖檔結束!')
    disp('-----------------------------------------------------------')
%--------------------------------------------------------------------------
close(figure_handle);
%==========================================================================
```

```matlab
%**************************************************************************
%   Name: yeh_export_edi_phsxy_v20220928a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20220928a
%   Description: 輸出HsiupoYeh建議的大地電磁法相位圖(WxH=300x260)
%                經過測試可用於MATLAB R2009a版本。
%**************************************************************************
clear;clc;close all
%==========================================================================
%--------------------------------------------------------------------------
% 因為MTALAB每個版本的繪圖引擎可能有差異，可能造成輸出異常。故限制版本。
MATLAB_Version=version;
if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
    disp('提示:正確運行在MATLAB R2009a版本...')
    MATLAB_Version_str='R2009a';
else
    disp('未測試通過的MATLAB版本,return!')
    return
end
%--------------------------------------------------------------------------
% MATLAB產生的繪圖視窗figure只能比當前螢幕尺寸小，目前只允許螢幕解析度大於720p的
% 狀況下(且螢幕沒有旋轉，寬度=1920，高度=1080)運行此程式，以免錯誤發生。
%--
% 取得螢幕的尺寸，MonitorPositions會比ScreenSize準確。
current_screen_resolution=get(0, 'MonitorPositions');
current_screen_width=current_screen_resolution(3);
current_screen_height=current_screen_resolution(4);
if current_screen_width>=1920 && current_screen_height>=1080
    disp('解析度大於1080p，可正常執行!')
else
    disp('解析度太小，可能會造成錯誤，不允許執行。return!')
    return
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% MATLAB產生的繪圖視窗figure只能比當前螢幕尺寸小，目前只允許螢幕解析度大於720p的
% 狀況下(且螢幕沒有旋轉，寬度=1920，高度=1080)運行此程式，以免錯誤發生。
%--
% 取得螢幕的尺寸，MonitorPositions會比ScreenSize準確。
current_screen_resolution=get(0, 'MonitorPositions');
current_screen_width=current_screen_resolution(3);
current_screen_height=current_screen_resolution(4);
if current_screen_width>=1920 && current_screen_height>=1080
    disp('解析度大於1080p，可正常執行!')
else
    disp('解析度太小，可能會造成錯誤，不允許執行。return!')
    return
end
%--------------------------------------------------------------------------
%==========================================================================
%==========================================================================
WinGLinkEdiFile=read_WinGLink_edi_to_mat(['Input_winglink_0d\TVG201_Org.edi']);
Site_full_name='TVG201';
%========================================================================== 
Export_PNG_Width=300;%注意這個值不能太大...
main_axes_with=225;%300*0.75
    %----------------------------------------------------------------------
    % 建立預設的空白figure視窗
    figure_handle=figure('Visible','on','Position',[0,0,1000,1000]);
    movegui(figure_handle,'center')    
    %--
    % 設定背景
    set(figure_handle,'color',[1,1,1])
    %----------------------------------------------------------------------
    % 空白繪圖。調整字體與資料單位等比例。
    axes_handle=gca;
    set(axes_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    %----------------------------------------------------------------------
    % 設定空白座標刻度。設定座標軸上下限。
my_xlim_vector=[-4,5];
    set(axes_handle,'Xlim',my_xlim_vector)
    set(axes_handle,'XTick',[])
    set(axes_handle,'XDir','reverse')
    %--
my_ylim_vector=[-180,180];
    set(axes_handle,'Ylim',my_ylim_vector)
    set(axes_handle,'YTick',[])
    %----------------------------------------------------------------------
    % 設定空白標題
    % 手動設定過title的位置，就不會因自動調整而影響到原來座標軸的位置
    title_handle=title('');
    set(title_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_title_xyz=get(title_handle,'Position');
    % 故意手動將title位置的z值增加一點點，這個對2D圖的畫面幾乎沒影響。
    set(title_handle,'Position',[temp_title_xyz(1),temp_title_xyz(2),temp_title_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % 設定空白xlabel
    % 手動設定過xlabel的位置，就不會因自動調整而影響到原來座標軸的位置
    xlabel_handle=xlabel('');
    set(xlabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_xlabel_xyz=get(xlabel_handle,'Position');
    % 故意手動將xlabel位置的z值增加一點點，這個對2D圖的畫面幾乎沒影響。
    set(xlabel_handle,'Position',[temp_xlabel_xyz(1),temp_xlabel_xyz(2),temp_xlabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % 設定空白ylabel
    % 手動設定過ylabel的位置，就不會卡到原來座標軸的範圍
    ylabel_handle=ylabel('');
    set(ylabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_ylabel_xyz=get(ylabel_handle,'Position');
    % 故意手動將ylabel位置的z值增加一點點，這個對2D圖的畫面幾乎沒影響。
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % 加框。
    box on    
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    % 調整自訂Position，使座標軸依照所需尺寸正確地出現在畫面中。
    set(axes_handle,'Units','pixels')
set(axes_handle,'Position',[100,100,main_axes_with,165])% 165=main_axes_with*0.75加微調    
    %--
    % 擷取視窗像素資料
    temp_frame=getframe(figure_handle);
    %--
    % 從正中間取出一條垂直線的像素資料，找出左右邊界
    vertical_line=double(temp_frame.cdata(:,102,1));
    find_result=find(vertical_line~=255);
    if length(find_result)==2
        distance=find_result(2)-find_result(1);
        axes_top_pexel_index=find_result(1);
        disp(['上邊界像素索引值=',num2str(axes_top_pexel_index)])        
        axes_bottom_pexel_index=find_result(2);
        disp(['下邊界像素索引值=',num2str(axes_bottom_pexel_index)])
        disp(['找到垂直方向黑色界線，距離=',num2str(distance)])
    else
        disp('找不到垂直方向黑色界線')
    end        
    %--
    disp('--')
    %--
    % 從正中間取出一條水平線的像素資料，找出左右邊界
    horizontal_line=double(temp_frame.cdata(axes_bottom_pexel_index-2,:,1));    
    find_result=find(horizontal_line~=255);
    if length(find_result)==2
        distance=find_result(2)-find_result(1);
        axes_left_pexel_index=find_result(1);
        disp(['左邊界像素索引值=',num2str(axes_left_pexel_index)])
        axes_right_pexel_index=find_result(2);
        disp(['右邊界像素索引值=',num2str(axes_right_pexel_index)])
        disp(['找到水平方向黑色界線，距離=',num2str(distance)])
    else
        disp('找不到目標水平方向黑色界線')
    end
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
%==========================================================================
%==========================================================================
% 開始正常繪圖
%--
% 資料曲線
hold on
errorbar(log10(WinGLinkEdiFile.FREQ.Data),WinGLinkEdiFile.PHSXY.Data,WinGLinkEdiFile.PHSXY_ERR.Data,'r.');
errorbar(log10(WinGLinkEdiFile.FREQ.Data),WinGLinkEdiFile.PHSYX.Data,WinGLinkEdiFile.PHSYX_ERR.Data,'b.');
%--
%--------------------------------------------------------------------------
%把標題設定回去
set(title_handle,'String','TVG102 Rot: 0.0 [°]')
% 調整位置比座標軸上邊界高5[px]
set(title_handle,'Units','pixels')
temp_title_xyz=get(title_handle,'Position');
set(title_handle,'Position',[temp_title_xyz(1),5+(axes_bottom_pexel_index-axes_top_pexel_index),temp_title_xyz(3)]);
%--------------------------------------------------------------------------
% 設定XTick
set(axes_handle,'Xlim',my_xlim_vector)
set(axes_handle,'XTick',[my_xlim_vector(1):my_xlim_vector(2)])
%--
% 設定X標題
set(xlabel_handle,'String','Frequency [10^x Hz]')
    set(xlabel_handle,'Units','pixels')
    temp_xlabel_xyz=get(xlabel_handle,'Position');
% 設定y為-18px
 temp_xlabel_xyz(2)=-18;
    set(xlabel_handle,'Position',[temp_xlabel_xyz(1),temp_xlabel_xyz(2),temp_xlabel_xyz(3)])
%--------------------------------------------------------------------------
% 設定YTick
set(axes_handle,'Ylim',my_ylim_vector)
set(axes_handle,'YTick',[my_ylim_vector(1):45:my_ylim_vector(2)])
%--
% 設定Y標題
set(ylabel_handle,'String','Phase [°]')
    set(ylabel_handle,'Units','pixels')
    temp_ylabel_xyz=get(ylabel_handle,'Position');
% 設定x為-10[px]
temp_ylabel_xyz(1)=-25;
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)])
%--------------------------------------------------------------------------
% 設定網格線
grid on
%--------------------------------------------------------------------------
    % 設定圖說
    legend_handle=legend('XY','YX','Location','SouthOutside');
    set(legend_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(legend_handle,'Orientation','horizontal') 
    set(legend_handle,'Units','pixels')
    set(legend_handle,'Box','off')
set(legend_handle,'PlotBoxAspectRatio',[100,20,1])
    temp_legend_xyz=get(legend_handle,'Position');
set(legend_handle,'Position',[axes_left_pexel_index+56,1000-axes_bottom_pexel_index-62,100,20]);
%--------------------------------------------------------------------------
    % 截圖
    temp_frame=getframe(figure_handle);
%--
% 輸出圖片比box線還要往上多少像素
box_padding_top_px=34;
box_padding_bottom_px=60;
box_padding_left_px=46;
box_padding_right_px=28;
    % 輸出目標區域到檔案
    output_png_file_name=['yeh_export_edi_phsxy_v20220928a_',MATLAB_Version_str,'.png'];
    image_data=temp_frame.cdata(axes_top_pexel_index-box_padding_top_px:axes_bottom_pexel_index+box_padding_bottom_px,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    %--
    % 輸出圖檔
    disp(['開始輸出圖檔(WxH=',num2str(length(image_data(1,:,1))),'x',num2str(length(image_data(:,1,1))),')...'])
    imwrite(image_data,output_png_file_name);
    disp('輸出圖檔結束!')
    disp('-----------------------------------------------------------')
%--------------------------------------------------------------------------
close(figure_handle);
%==========================================================================
```

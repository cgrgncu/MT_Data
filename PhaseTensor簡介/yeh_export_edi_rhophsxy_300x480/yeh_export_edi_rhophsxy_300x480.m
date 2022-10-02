%**************************************************************************
%   Name: yeh_export_edi_rhophsxy_300x480.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221002a
%   Description: 輸出HsiupoYeh建議的大地電磁法視電阻率及相位圖(WxH=300x480)
%                經過測試可用於以下MATLAB版本:「R2009a」、「R2014a」、
%               「R2014b」。
%**************************************************************************
function ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name)
    %----------------------------------------------------------------------
    ExportEdiPNG.FileFullName=[];
    ExportEdiPNG.Error.String='';
    %----------------------------------------------------------------------
    % 使用提醒
    if ~exist('Input_WinGLinkEdi_mat','var') || ...
            ~exist('Input_title','var') || ...
            ~exist('output_png_path','var') || ...
            ~exist('output_png_file_name','var')            
        disp('Usage:')
        disp('Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat([''xxx.edi'']);') 
        disp('Input_title=''DEMO001 Rot: 0.0 [°]'';') 
        disp('output_png_path=''.\Output\'';')
        disp('output_png_file_name=[''yeh_export_edi_rhophsxy_300x480_v20221001a.png''];')
        disp('ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name);')
        disp('imshow(ExportEdiPNG.FileFullName)')        
        ExportEdiPNG.Error.String='請依照使用說明操作本程式...';
        return
    end
    %----------------------------------------------------------------------
    %==========================================================================
    %--------------------------------------------------------------------------
    % 因為MTALAB每個版本的繪圖引擎可能有差異，可能造成輸出異常。
    % 根據https://en.wikipedia.org/wiki/MATLAB的資訊
    % MATLAB R2014b起，採用新一代的繪圖引擎，可支援硬體顯示卡繪圖功能，預設開啟。
    % 但強制要求主機必須有硬體顯示卡存在，故虛擬機中或顯示卡驅動異常的狀況下無法使
    % 用進階功能，以致於繪圖不太美觀。
    % 本程式部分功能需進行大量調整才能相容R2014b以後的版本。
    %--
    % 這裡限制僅有測試過的版本可運行。
    MATLAB_Version=version;
    if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
        disp('提示:正確運行在MATLAB R2009a版本...')
        %MATLAB_Version_str='R2009a';
    elseif strcmp(MATLAB_Version,'8.3.0.532 (R2014a)')
        disp('提示:正確運行在MATLAB R2014a版本...')
        %MATLAB_Version_str='R2014a'; 
    elseif strcmp(MATLAB_Version,'8.4.0.150421 (R2014b)')
        disp('提示:正確運行在MATLAB R2014b版本...')
        %MATLAB_Version_str='R2014b'; 
    else
        disp('錯誤:未測試通過的MATLAB版本,return!')
        ExportEdiPNG.Error.String='錯誤:未測試通過的MATLAB版本,return!';
        return
    end
    %--
    % 繪圖引擎相容性處理...
    if verLessThan('matlab', '8.4.0.150421')
        disp('提示:正在使用舊的繪圖引擎...')
    else
        disp('提示:正在使用新的繪圖引擎...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!')
            ExportEdiPNG.Error.String='錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!';
            return
        else
            disp('提示:正在使用Hareware OpenGL，使用硬體顯示卡，允許進階繪圖功能...')
        end
    end
    %--------------------------------------------------------------------------
    % MATLAB產生的繪圖視窗figure只能比當前螢幕尺寸小，目前只允許螢幕解析度大於720p的
    % 狀況下(且螢幕沒有旋轉，寬度=1280，高度=720)運行此程式，以免錯誤發生。
        %--
        % 使用的figure尺寸暫定為500x500，也就是每個小部分圖片最大不超過500x500。
        % 這樣讓開發期間比較美觀的Debug。
            figure_max_width=500;%[px]
            figure_max_height=500;%[px]
        %--
        % 取得螢幕的尺寸，MATLAB內建的好像有點問題，改用JAVA的函數。
        eval('current_screen_width=java.awt.Toolkit.getDefaultToolkit().getScreenSize().getWidth();')
        eval('current_screen_height=java.awt.Toolkit.getDefaultToolkit().getScreenSize().getHeight();')
        disp(['提示:螢幕解析度(WxH)=',num2str(current_screen_width),'x',num2str(current_screen_height)])
        if current_screen_width>=1280 && current_screen_height>=720
            disp('提示:解析度大於720p，可正常執行!')
        else
            disp('錯誤:解析度小於720p，可能會造成錯誤，不允許執行。return!')
            ExportEdiPNG.Error.String='錯誤:解析度小於720p，可能會造成錯誤，不允許執行。return!';
            return
        end
        disp('--')
    %--------------------------------------------------------------------------
    %==========================================================================
%==========================================================================

%==========================================================================
    disp('===========================================================')
%--------------------------------------------------------------------------
% 視電阻率部分:    
    disp('繪製電阻率部分圖片...開始!')
    disp('-----------------------------------------------------------')
%--------------------------------------------------------------------------
% 目標輸出的圖片寬度=300[px]，高度依照等比例微調。
% 以建議的頻率範圍及電阻率範圍，視電阻率部分圖片尺寸為300x255。
% 
main_axes_with=225;%300*0.75
    %----------------------------------------------------------------------
    % 建立預設的空白figure視窗
    figure_handle=figure('Visible','off','Position',[0,0,figure_max_width,figure_max_height]);
    movegui(figure_handle,'center')  
    %--
    % 設定背景
    set(figure_handle,'color',[1,1,1])
    %--
    % 繪圖引擎相容性處理...
    if verLessThan('matlab', '8.4.0.150421')
        disp('提示:正在使用舊的繪圖引擎...')
    else
        disp('提示:正在使用新的繪圖引擎...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!')
            ExportEdiPNG.Error.String='錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!';
            return
        else
            disp('提示:正在使用Hareware OpenGL，使用硬體顯示卡，允許進階繪圖功能...')
        end
        disp('關閉圖形平滑化功能，使畫素更單純...')
        figure_handle.GraphicsSmoothing='off';
    end    
    %----------------------------------------------------------------------
    % 空白繪圖。調整字體與資料單位等比例。
    axes_handle=gca;
    set(axes_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(axes_handle,'DataAspectRatio',[1,1,1]);%[1,1,1]->資料單位等比例，這個設定之後PlotBoxAspectRatio就自動強制計算了。
    %--
    % 繪圖引擎相容性處理...
    if verLessThan('matlab', '8.4.0.150421')
        disp('提示:正在使用舊的繪圖引擎...')
    else
        disp('提示:正在使用新的繪圖引擎...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!')
            ExportEdiPNG.Error.String='錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!';
            return
        else
            disp('提示:正在使用Hareware OpenGL，使用硬體顯示卡，允許進階繪圖功能...')
        end
        disp('關閉座標軸文字平滑化功能，使畫素更單純...')
        axes_handle.FontSmoothing='off';
        % figure不可見的狀況下，把線條寬度條小一些才會正常，原因不明...
        if strcmp(figure_handle.Visible,'off')
            axes_handle.LineWidth=0.4;
        end
    end    
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
    set(title_handle,'Interpreter','none')
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
    set(axes_handle,'Position',[100,100,main_axes_with,figure_max_height])
    %--
    % 擷取視窗像素資料
    temp_frame=getframe(figure_handle);
    %--
    % 找出邊界
    temp_cdata=double(temp_frame.cdata(:,:,1));
    % 找出左右邊界
    all_horizontal_line_pixel_count=sum(temp_cdata~=255,1);
    find_result=find(all_horizontal_line_pixel_count>=2);
    axes_left_pexel_index=find_result(1);
	disp(['左邊界像素索引值=',num2str(axes_left_pexel_index)])
	axes_right_pexel_index=find_result(end);
	disp(['右邊界像素索引值=',num2str(axes_right_pexel_index)])
	disp(['找到水平方向黑色界線，距離=',num2str(axes_right_pexel_index-axes_left_pexel_index)])
    disp('--')
    % 找出上下邊界
    all_vertical_line_pixel_count=sum(temp_cdata~=255,2);
    find_result=find(all_vertical_line_pixel_count>=2);
    axes_top_pexel_index=find_result(1);
	disp(['上邊界像素索引值=',num2str(axes_top_pexel_index)])
	axes_bottom_pexel_index=find_result(end);
	disp(['下邊界像素索引值=',num2str(axes_bottom_pexel_index)])
	disp(['找到水平方向黑色界線，距離=',num2str(axes_bottom_pexel_index-axes_top_pexel_index)])
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
%==========================================================================
%==========================================================================
    % 開始正常繪圖
    %--
    % 資料曲線
    hold on
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),log10(Input_WinGLinkEdi_mat.RHOXY.Data),Input_WinGLinkEdi_mat.RHOXY_ERR.Data,'r.');
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),log10(Input_WinGLinkEdi_mat.RHOYX.Data),Input_WinGLinkEdi_mat.RHOYX_ERR.Data,'b.');
    %--
    %--------------------------------------------------------------------------
    %把標題設定回去
set(title_handle,'String',Input_title)
    %--
    set(title_handle,'Units','pixels')
    temp_title_xyz=get(title_handle,'Position');
% 調整位置比座標軸上邊界高5[px]
set(title_handle,'Position',[temp_title_xyz(1),5+(axes_bottom_pexel_index-axes_top_pexel_index),temp_title_xyz(3)]);
%--------------------------------------------------------------------------
% 設定XTick
set(axes_handle,'Xlim',my_xlim_vector)
set(axes_handle,'XTick',[my_xlim_vector(1):my_xlim_vector(2)])
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
    %--
    % 繪圖引擎相容性處理...
    if verLessThan('matlab', '8.4.0.150421')
        disp('提示:正在使用舊的繪圖引擎...')
set(legend_handle,'PlotBoxAspectRatio',[100,20,1])
set(legend_handle,'Position',[axes_left_pexel_index+56,4,100,20]);
    else
        disp('提示:正在使用新的繪圖引擎...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!')
            ExportEdiPNG.Error.String='錯誤:未測試通過的MATLAB版本,return!';
            return
        else
            disp('提示:正在使用Hareware OpenGL，使用硬體顯示卡，允許進階繪圖功能...')
        end
        disp('關閉圖說文字平滑化功能，使畫素更單純...')
        drawnow
        legend_handle.EntryContainer.Children(1).Label.FontSmoothing='off';
        legend_handle.EntryContainer.Children(2).Label.FontSmoothing='off';
legend_handle.ItemTokenSize=[20,18];
set(legend_handle,'Position',[axes_left_pexel_index+58,4,100,20]);
    end
%--------------------------------------------------------------------------
    % 截圖
    temp_frame=getframe(figure_handle);
%--
% 輸出圖片比box線還要往上多少像素
box_padding_top_px=34;
box_padding_bottom_px=20;
box_padding_left_px=46;
box_padding_right_px=28;
    % 取出目標區域影像資料
    disp('取出目標區域影像資料')
    rho_image_data=temp_frame.cdata(axes_top_pexel_index-box_padding_top_px:axes_bottom_pexel_index+box_padding_bottom_px,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    legend_image_data=temp_frame.cdata(end-24:end,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    rho_image_data=[rho_image_data;legend_image_data];
    disp(['尺寸: WxH=',num2str(length(rho_image_data(1,:,1))),'x',num2str(length(rho_image_data(:,1,1))),'[px]'])
%--------------------------------------------------------------------------
    close(figure_handle);
%--------------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    disp('繪製電阻率部分圖片...結束!')
    disp('===========================================================')
    % imshow(rho_image_data)
%==========================================================================

%==========================================================================
disp('===========================================================')
%--------------------------------------------------------------------------
% 相位部分:    
    disp('繪製相位部分圖片...開始!')
    disp('-----------------------------------------------------------')
%--------------------------------------------------------------------------
% 目標輸出的圖片寬度=300[px]，高度依照等比例微調。
% 以建議的頻率範圍及電阻率範圍，視電阻率部分圖片尺寸為300x225。
% 
main_axes_with=225;%300*0.75
    %----------------------------------------------------------------------
    % 建立預設的空白figure視窗
    figure_handle=figure('Visible','off','Position',[0,0,figure_max_width,figure_max_height]);
    movegui(figure_handle,'center')    
    %--
    % 設定背景
    set(figure_handle,'color',[1,1,1])
    %--
    % 繪圖引擎相容性處理...
    if verLessThan('matlab', '8.4.0.150421')
        disp('提示:正在使用舊的繪圖引擎...')
    else
        disp('提示:正在使用新的繪圖引擎...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!')
            ExportEdiPNG.Error.String='錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!';
            return
        else
            disp('提示:正在使用Hareware OpenGL，使用硬體顯示卡，允許進階繪圖功能...')
        end
        disp('關閉圖形平滑化功能，使畫素更單純...')
        figure_handle.GraphicsSmoothing='off';       
    end
    %----------------------------------------------------------------------
    % 空白繪圖。調整字體與資料單位等比例。
    axes_handle=gca;
    set(axes_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    %--
     % 繪圖引擎相容性處理...
    if verLessThan('matlab', '8.4.0.150421')
        disp('提示:正在使用舊的繪圖引擎...')
    else
        disp('提示:正在使用新的繪圖引擎...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!')
            ExportEdiPNG.Error.String='錯誤:正在使用Software OpenGL，推測您沒有硬體顯示卡。return!';
            return
        else
            disp('提示:正在使用Hareware OpenGL，使用硬體顯示卡，允許進階繪圖功能...')
        end
        disp('關閉座標軸文字平滑化功能，使畫素更單純...')
        axes_handle.FontSmoothing='off';
        % figure不可見的狀況下，把線條寬度條小一些才會正常，原因不明...
        if strcmp(figure_handle.Visible,'off')
            axes_handle.LineWidth=0.4;
        end
    end   
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
    % 找出邊界
    temp_cdata=double(temp_frame.cdata(:,:,1));
    % 找出左右邊界
    all_horizontal_line_pixel_count=sum(temp_cdata~=255,1);
    find_result=find(all_horizontal_line_pixel_count>=2);
    axes_left_pexel_index=find_result(1);
	disp(['左邊界像素索引值=',num2str(axes_left_pexel_index)])
	axes_right_pexel_index=find_result(end);
	disp(['右邊界像素索引值=',num2str(axes_right_pexel_index)])
	disp(['找到水平方向黑色界線，距離=',num2str(axes_right_pexel_index-axes_left_pexel_index)])
    disp('--')
    % 找出上下邊界
    all_vertical_line_pixel_count=sum(temp_cdata~=255,2);
    find_result=find(all_vertical_line_pixel_count>=2);
    axes_top_pexel_index=find_result(1);
	disp(['上邊界像素索引值=',num2str(axes_top_pexel_index)])
	axes_bottom_pexel_index=find_result(end);
	disp(['下邊界像素索引值=',num2str(axes_bottom_pexel_index)])
	disp(['找到水平方向黑色界線，距離=',num2str(axes_bottom_pexel_index-axes_top_pexel_index)])
    %----------------------------------------------------------------------    
    disp('-----------------------------------------------------------')
%==========================================================================
%==========================================================================
    % 開始正常繪圖
    %--
    % 資料曲線
    hold on
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),Input_WinGLinkEdi_mat.PHSXY.Data,Input_WinGLinkEdi_mat.PHSXY_ERR.Data,'r.');
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),Input_WinGLinkEdi_mat.PHSYX.Data,Input_WinGLinkEdi_mat.PHSYX_ERR.Data,'b.');
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
    % 截圖
    temp_frame=getframe(figure_handle);
%--
% 輸出圖片比box線還要往上多少像素
box_padding_top_px=4;
box_padding_bottom_px=55;
box_padding_left_px=46;
box_padding_right_px=28;    
    %--
    % 取出目標區域影像資料
    disp('取出目標區域影像資料')
    phs_image_data=temp_frame.cdata(axes_top_pexel_index-box_padding_top_px:axes_bottom_pexel_index+box_padding_bottom_px,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    disp(['尺寸: WxH=',num2str(length(phs_image_data(1,:,1))),'x',num2str(length(phs_image_data(:,1,1))),'[px]'])
   %--------------------------------------------------------------------------
    close(figure_handle);
%--------------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    disp('繪製相位部分圖片...結束!')
    disp('===========================================================')
    % imshow(phs_image_data)
%==========================================================================

%==========================================================================
% 輸出目標區域到檔案
    disp('===========================================================')
    disp('-----------------------------------------------------------')
    % 建立輸出資料夾
    if ~(exist(output_png_path,'dir')==7)
        mkdir(output_png_path)
    end
    %--
    all_image_data=[rho_image_data;phs_image_data];
    disp(['開始輸出圖檔(WxH=',num2str(length(all_image_data(1,:,1))),'x',num2str(length(all_image_data(:,1,1))),')...'])
    ExportEdiPNG.FileFullName=[output_png_path,output_png_file_name];
    disp([output_png_path,output_png_file_name])
	imwrite(all_image_data,[output_png_path,output_png_file_name]);
	disp('輸出圖檔結束!')
    disp('-----------------------------------------------------------')
    disp('===========================================================')
%==========================================================================

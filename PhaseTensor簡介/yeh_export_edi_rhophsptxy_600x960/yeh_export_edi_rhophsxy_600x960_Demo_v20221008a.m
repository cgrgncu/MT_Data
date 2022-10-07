%**************************************************************************
%   Name: yeh_export_edi_rhophsxy_600x880_MAIN_v20221008a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221008a
%   Description: 輸出HsiupoYeh建議的大地電磁法視電阻率及相位圖(WxH=600x960)
%                經過測試可用於以下MATLAB版本:「R2009a」、「R2014a」、
%               「R2014b」。
%**************************************************************************
clear;clc;close all
%--------------------------------------------------------------------------
% 基本呼叫範例:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [°]';
Input_smooth_phasetensor_600x110_png_file_name='';
output_png_path='.\Output\';
output_png_file_name=['yeh_export_edi_rhophsxy_600x960_v20221008a.png'];
ExportEdiPNG=yeh_export_edi_rhophsptxy_600x960(Input_WinGLinkEdi_filename,Input_title,Input_smooth_phasetensor_600x110_png_file_name,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% 利用版本命名的呼叫範例:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [°]';
Input_smooth_phasetensor_600x110_png_file_name='';
output_png_path='.\Output2\';
MATLAB_Version=version;
if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
    disp('提示:正確運行在MATLAB R2009a版本...')
    MATLAB_Version_str='R2009a';
elseif strcmp(MATLAB_Version,'8.3.0.532 (R2014a)')
    disp('提示:正確運行在MATLAB R2014a版本...')
    MATLAB_Version_str='R2014a'; 
elseif strcmp(MATLAB_Version,'8.4.0.150421 (R2014b)')
    disp('提示:正確運行在MATLAB R2014b版本...')
    MATLAB_Version_str='R2014b'; 
else
    disp('錯誤:未測試通過的MATLAB版本,return!')
    return
end
output_png_file_name=['yeh_export_edi_rhophsxy_600x960_v20221008a_',MATLAB_Version_str,'.png'];
ExportEdiPNG=yeh_export_edi_rhophsptxy_600x960(Input_WinGLinkEdi_filename,Input_title,Input_smooth_phasetensor_600x110_png_file_name,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% 套用MATLAB R2014平滑圖的呼叫範例:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [°]';
Input_smooth_phasetensor_600x110_png_file_name='temp_smoothPT_600x110.png';
output_png_path='.\Output3\';
output_png_file_name=['yeh_export_edi_rhophsxy_600x960_v20221008a.png'];
disp('呼叫外部EXE執行檔(MATLAB R2014b編譯，需安裝Runtime。初次執行時需要較多時間啟動)...')
system(['yeh_export_edi_smoothPT_600x110_R2014b.exe "',Input_WinGLinkEdi_filename,...
    '" ".\\" "',Input_smooth_phasetensor_600x110_png_file_name,'"']);
disp('運行結束!')
ExportEdiPNG=yeh_export_edi_rhophsptxy_600x960(Input_WinGLinkEdi_filename,Input_title,Input_smooth_phasetensor_600x110_png_file_name,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
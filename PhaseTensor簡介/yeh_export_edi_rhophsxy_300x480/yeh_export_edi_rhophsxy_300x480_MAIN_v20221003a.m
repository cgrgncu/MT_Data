%**************************************************************************
%   Name: yeh_export_edi_rhophsxy_300x480_MAIN_v20221003a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221002a
%   Description: 輸出HsiupoYeh建議的大地電磁法視電阻率及相位圖(WxH=300x480)
%                經過測試可用於以下MATLAB版本:「R2009a」、「R2014a」、
%               「R2014b」。
%**************************************************************************
clear;clc;close all
%--------------------------------------------------------------------------
% 基本呼叫範例:
Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat(['Input_winglink_0d\TVGm03-2.edi']);
Input_title='DEMO_001 Rot: 0.0 [°]';
output_png_path='.\Output\';
output_png_file_name='yeh_export_edi_rhophsxy_300x480_v20221003a.png';
ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name);
imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
% 利用版本命名的呼叫範例:
% Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat(['Input_winglink_0d\TVGm03-2.edi']);
% Input_title='TVG103 Rot: 0.0 [°]';
% output_png_path='.\Output2\';
% MATLAB_Version=version;
% if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
%     disp('提示:正確運行在MATLAB R2009a版本...')
%     MATLAB_Version_str='R2009a';
% elseif strcmp(MATLAB_Version,'8.3.0.532 (R2014a)')
%     disp('提示:正確運行在MATLAB R2014a版本...')
%     MATLAB_Version_str='R2014a'; 
% elseif strcmp(MATLAB_Version,'8.4.0.150421 (R2014b)')
%     disp('提示:正確運行在MATLAB R2014b版本...')
%     MATLAB_Version_str='R2014b'; 
% else
%     disp('錯誤:未測試通過的MATLAB版本,return!')
%     ExportEdiPNG.Error.String='錯誤:未測試通過的MATLAB版本,return!';
%     return
% end
% output_png_file_name=['yeh_export_edi_rhophsxy_300x480_v20221003a_',MATLAB_Version_str,'.png'];
% ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
%**************************************************************************
%   Name: yeh_export_edi_rhophs_300x480_MAIN_v20221009a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221009a
%   Description: 輸出HsiupoYeh建議的大地電磁法視電阻率及相位圖(WxH=300x480)
%                經過測試可用於以下MATLAB版本:「R2009a」、「R2014a」、
%               「R2014b」。
%**************************************************************************
clear;clc;close all
%--------------------------------------------------------------------------
% 基本呼叫範例:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [°]';
output_png_path='.\Output\';
output_png_file_name='yeh_export_edi_rhophs_A_300x480_v20221009a.png';
ExportEdiPNG_A=yeh_export_edi_rhophs_A_300x480(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
output_png_file_name='yeh_export_edi_rhophs_B_300x480_v20221009a.png';
ExportEdiPNG_B=yeh_export_edi_rhophs_B_300x480(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
output_png_file_name='yeh_export_edi_rhophs_C_300x480_v20221009a.png';
ExportEdiPNG_C=yeh_export_edi_rhophs_C_300x480(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG_C.FileFullName)
%--------------------------------------------------------------------------

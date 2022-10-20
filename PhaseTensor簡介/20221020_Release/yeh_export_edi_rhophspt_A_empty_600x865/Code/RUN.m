%**************************************************************************
%   Name: yeh_export_edi_rhophsxy_600x960_Demo_v20221016a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221016a
%   Description: 輸出HsiupoYeh建議的大地電磁法視電阻率及相位圖(WxH=600x960)
%                經過測試可用於以下MATLAB版本:「R2009a」、「R2014a」、
%               「R2014b」。
%**************************************************************************
clear;clc;close all
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO001 Rot: 0.0 [°]';
output_png_path='.\Output\';
output_png_file_name=['yeh_export_edi_rhophspt_A_600x865_v20221019a.png'];
ExportEdiPNG=yeh_export_edi_rhophspt_A_empty_600x865(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
imshow([output_png_path,output_png_file_name])
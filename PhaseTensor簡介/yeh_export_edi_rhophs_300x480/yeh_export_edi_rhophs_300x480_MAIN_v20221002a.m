%**************************************************************************
%   Name: yeh_export_edi_rhophs_300x480_MAIN_v20221009a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221009a
%   Description: ��XHsiupoYeh��ĳ���j�a�q�Ϫk���q���v�άۦ��(WxH=300x480)
%                �g�L���եi�Ω�H�UMATLAB����:�uR2009a�v�B�uR2014a�v�B
%               �uR2014b�v�C
%**************************************************************************
clear;clc;close all
%--------------------------------------------------------------------------
% �򥻩I�s�d��:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [�X]';
output_png_path='.\Output\';
output_png_file_name='yeh_export_edi_rhophs_A_300x480_v20221009a.png';
ExportEdiPNG_A=yeh_export_edi_rhophs_A_300x480(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
output_png_file_name='yeh_export_edi_rhophs_B_300x480_v20221009a.png';
ExportEdiPNG_B=yeh_export_edi_rhophs_B_300x480(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
output_png_file_name='yeh_export_edi_rhophs_C_300x480_v20221009a.png';
ExportEdiPNG_C=yeh_export_edi_rhophs_C_300x480(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG_C.FileFullName)
%--------------------------------------------------------------------------

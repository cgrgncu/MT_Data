
clear;clc;close all
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO001 Rot: 0.0 [�X]';
output_png_path='.\Output\';
output_png_file_name=['yeh_export_edi_rhophspt_B_600x865_v20221019a.png'];
ExportEdiPNG=yeh_export_edi_rhophspt_B_empty_600x865(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
imshow([output_png_path,output_png_file_name])
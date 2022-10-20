clear;clc;close all
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO001 Rot: 0.0 [¢X]';
output_png_path='.\Output\';
output_png_file_name=['yeh_export_edi_rhophs_C_300x410_v20221019a.png'];
ExportEdiPNG=yeh_export_edi_rhophs_C_300x410(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);
imshow([output_png_path,output_png_file_name])
clear;clc;close all
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
output_png_path='.\Output\';
output_png_file_name='yeh_export_edi_smoothPT_525x47_R2014b.png';
ExportEdiPNG=yeh_export_edi_smoothPT_525x47_R2014b(Input_WinGLinkEdi_filename,output_png_path,output_png_file_name);
imshow([output_png_path,output_png_file_name])
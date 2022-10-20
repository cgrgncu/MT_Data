clear;clc;close all
Input_600x865_PNG='Input_PNG\600x865_PNG.png';
Input_525x47_PNG='Input_PNG\525x47_PNG.png';
output_png_path='.\Output\';
output_png_file_name=['yeh_export_edi_smoothPT_replace_v20221020a.png'];
ExportEdiPNG=yeh_export_edi_smoothPT_replace(Input_600x865_PNG,Input_525x47_PNG,output_png_path,output_png_file_name);
imshow([output_png_path,output_png_file_name])


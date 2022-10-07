%**************************************************************************
%   Name: yeh_export_edi_rhophsxy_600x880_MAIN_v20221008a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221008a
%   Description: ��XHsiupoYeh��ĳ���j�a�q�Ϫk���q���v�άۦ��(WxH=600x960)
%                �g�L���եi�Ω�H�UMATLAB����:�uR2009a�v�B�uR2014a�v�B
%               �uR2014b�v�C
%**************************************************************************
clear;clc;close all
%--------------------------------------------------------------------------
% �򥻩I�s�d��:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [�X]';
Input_smooth_phasetensor_600x110_png_file_name='';
output_png_path='.\Output\';
output_png_file_name=['yeh_export_edi_rhophsxy_600x960_v20221008a.png'];
ExportEdiPNG=yeh_export_edi_rhophsptxy_600x960(Input_WinGLinkEdi_filename,Input_title,Input_smooth_phasetensor_600x110_png_file_name,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% �Q�Ϊ����R�W���I�s�d��:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [�X]';
Input_smooth_phasetensor_600x110_png_file_name='';
output_png_path='.\Output2\';
MATLAB_Version=version;
if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
    disp('����:���T�B��bMATLAB R2009a����...')
    MATLAB_Version_str='R2009a';
elseif strcmp(MATLAB_Version,'8.3.0.532 (R2014a)')
    disp('����:���T�B��bMATLAB R2014a����...')
    MATLAB_Version_str='R2014a'; 
elseif strcmp(MATLAB_Version,'8.4.0.150421 (R2014b)')
    disp('����:���T�B��bMATLAB R2014b����...')
    MATLAB_Version_str='R2014b'; 
else
    disp('���~:�����ճq�L��MATLAB����,return!')
    return
end
output_png_file_name=['yeh_export_edi_rhophsxy_600x960_v20221008a_',MATLAB_Version_str,'.png'];
ExportEdiPNG=yeh_export_edi_rhophsptxy_600x960(Input_WinGLinkEdi_filename,Input_title,Input_smooth_phasetensor_600x110_png_file_name,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% �M��MATLAB R2014���ƹϪ��I�s�d��:
Input_WinGLinkEdi_filename='Input_winglink_0d\TVGm03-2.edi';
Input_title='DEMO_001 Rot: 0.0 [�X]';
Input_smooth_phasetensor_600x110_png_file_name='temp_smoothPT_600x110.png';
output_png_path='.\Output3\';
output_png_file_name=['yeh_export_edi_rhophsxy_600x960_v20221008a.png'];
disp('�I�s�~��EXE������(MATLAB R2014b�sĶ�A�ݦw��Runtime�C�즸����ɻݭn���h�ɶ��Ұ�)...')
system(['yeh_export_edi_smoothPT_600x110_R2014b.exe "',Input_WinGLinkEdi_filename,...
    '" ".\\" "',Input_smooth_phasetensor_600x110_png_file_name,'"']);
disp('�B�浲��!')
ExportEdiPNG=yeh_export_edi_rhophsptxy_600x960(Input_WinGLinkEdi_filename,Input_title,Input_smooth_phasetensor_600x110_png_file_name,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
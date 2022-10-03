%**************************************************************************
%   Name: yeh_export_edi_rhophsxy_300x480_MAIN_v20221003a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221002a
%   Description: ��XHsiupoYeh��ĳ���j�a�q�Ϫk���q���v�άۦ��(WxH=300x480)
%                �g�L���եi�Ω�H�UMATLAB����:�uR2009a�v�B�uR2014a�v�B
%               �uR2014b�v�C
%**************************************************************************
clear;clc;close all
%--------------------------------------------------------------------------
% �򥻩I�s�d��:
Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat(['Input_winglink_0d\TVGm03-2.edi']);
Input_title='DEMO_001 Rot: 0.0 [�X]';
output_png_path='.\Output\';
output_png_file_name='yeh_export_edi_rhophsxy_300x480_v20221003a.png';
ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name);
imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
% �Q�Ϊ����R�W���I�s�d��:
% Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat(['Input_winglink_0d\TVGm03-2.edi']);
% Input_title='TVG103 Rot: 0.0 [�X]';
% output_png_path='.\Output2\';
% MATLAB_Version=version;
% if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
%     disp('����:���T�B��bMATLAB R2009a����...')
%     MATLAB_Version_str='R2009a';
% elseif strcmp(MATLAB_Version,'8.3.0.532 (R2014a)')
%     disp('����:���T�B��bMATLAB R2014a����...')
%     MATLAB_Version_str='R2014a'; 
% elseif strcmp(MATLAB_Version,'8.4.0.150421 (R2014b)')
%     disp('����:���T�B��bMATLAB R2014b����...')
%     MATLAB_Version_str='R2014b'; 
% else
%     disp('���~:�����ճq�L��MATLAB����,return!')
%     ExportEdiPNG.Error.String='���~:�����ճq�L��MATLAB����,return!';
%     return
% end
% output_png_file_name=['yeh_export_edi_rhophsxy_300x480_v20221003a_',MATLAB_Version_str,'.png'];
% ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name);
% imshow(ExportEdiPNG.FileFullName)
%--------------------------------------------------------------------------
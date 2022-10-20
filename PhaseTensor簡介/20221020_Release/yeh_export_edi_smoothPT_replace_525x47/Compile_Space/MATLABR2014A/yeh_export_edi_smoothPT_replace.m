%**************************************************************************
%   Name: yeh_export_edi_smoothPT_replace.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221020a
%   Description: ���N��XHsiupoYeh��ĳ���j�a�q�Ϫk���ƪ��ۦ�i�q��(WxH=600x865)
%**************************************************************************
function ExportEdiPNG=yeh_export_edi_smoothPT_replace(varargin)
%----------------------------------------------------------------------
    Program_Version_str='v20221020a';
    %----------------------------------------------------------------------
    ExportEdiPNG.Error.String='';
    %----------------------------------------------------------------------
    % �ϥδ���
    if nargin==4 
        Input_600x865_PNG=varargin{1};
        Input_525x47_PNG=varargin{2};
        output_png_path=varargin{3};
        output_png_file_name=varargin{4};
    else    
        disp('--')
        disp(['Program Version: ',Program_Version_str])
        disp('MATLAB Usage:')
        disp('Input_600x865_PNG=''Input_PNG\600x865_PNG.png'';') 
        disp('Input_525x47_PNG=''Input_PNG\525x47_PNG.png'';') 
        disp('output_png_path=''.\Output\'';')
        disp('output_png_file_name=[''yeh_export_edi_smoothPT_replace_v20221020a.png''];')
        disp('ExportEdiPNG=yeh_export_edi_smoothPT_replace(Input_600x865_PNG,Input_525x47_PNG,output_png_path,output_png_file_name);')
        disp('imshow([output_png_path,output_png_file_name])')        
        disp('DOS Usage:')
        disp('yeh_export_edi_smoothPT_replace.exe "./Input_PNG/600x865_PNG.png" "./Input_PNG/525x47_PNG.png" "./Output/" "yeh_export_edi_smoothPT_replace_v20221020a.png"')   
        ExportEdiPNG.Error.String='�Ш̷Өϥλ����ާ@���{��...';
        disp('--')
        return
    end   
    %----------------------------------------------------------------------    
%==========================================================================
    % �إ߿�X��Ƨ�
    if ~(exist(output_png_path,'dir')==7)
        mkdir(output_png_path)
    end
%==========================================================================
    % Ū�����ɨýT�{���A(Input_600x865_PNG)
    try 
        empty_image_data=imread(Input_600x865_PNG);
        [empty_image_data_H,empty_image_data_W]=size(empty_image_data(:,:,1));
        if (empty_image_data_H==865 && empty_image_data_W==600)
            disp(['�T�{���ɤؤo��600x865!'])
        else
            disp(['���~!�����ɤؤo������600x865!return!'])
            return
        end
    catch  ME
        disp(['�o�Ϳ��~!return! ��]:',ME.message])
        return
    end
    %--
    % Ū�����ɨýT�{���A(Input_600x865_PNG)
    try 
        smoothPT_image_data=imread(Input_525x47_PNG);
        [smoothPT_image_data_H,smoothPT_image_data_W]=size(smoothPT_image_data(:,:,1));
        if (smoothPT_image_data_H==47 && smoothPT_image_data_W==525)
            disp(['�T�{���ɤؤo��525x47!'])
        else
            disp(['���~!�����ɤؤo������525x47!return!'])
            return
        end
    catch  ME
        disp(['�o�Ϳ��~!return! ��]:',ME.message])
        return
    end
%==========================================================================
	disp('===========================================================')
    disp('�л\�Ϥ�...�}�l!')
    %--------------------------------------------------------------------------
    % �T�{��m�A�Ϸ|���n�л\���y�жb�A�o�qDebug��
    % check_image_data=empty_image_data;
    % x_shift=47;
    % y_shift=770;
    % check_image_data([1:smoothPT_image_data_H]+y_shift,[1:smoothPT_image_data_W]+x_shift,:)=smoothPT_image_data(:,:,:);
    % imshow(check_image_data)
    %--------------------------------------------------------------------------
    % ��smoothPT���P�ؤo���Ϥ�
    %--
    % �զ⩳��
    temp_smoothPT_image_data=uint8(ones(865,600,3)*255);
    % �л\
    x_shift=47;
    y_shift=770;
    temp_smoothPT_image_data([1:smoothPT_image_data_H]+y_shift,[1:smoothPT_image_data_W]+x_shift,:)=smoothPT_image_data(:,:,:);
    % imshow(temp_smoothPT_image_data)
    %--------------------------------------------------------------------------
    % ��D�զ�ϰ��л\�W�h
    %--
    output_image_data=empty_image_data;
    %--
    % ���XRGB����
    temp_smoothPT_image_data_R=temp_smoothPT_image_data(:,:,1);
    temp_smoothPT_image_data_G=temp_smoothPT_image_data(:,:,2);
    temp_smoothPT_image_data_B=temp_smoothPT_image_data(:,:,3);
    % 
    output_image_data_R=output_image_data(:,:,1);
    output_image_data_G=output_image_data(:,:,2);
    output_image_data_B=output_image_data(:,:,3);
    %--
    % ����colorbar�C��]�p�A�զ�I�����|�X�{�b��ꤤ�A�ҥH����X���Ҧb���e����m
    match_array_R=double(temp_smoothPT_image_data_R==255);
    match_array_G=double(temp_smoothPT_image_data_G==255);
    match_array_B=double(temp_smoothPT_image_data_B==255);
    temp_smoothPT_match_array=(match_array_R+match_array_G+match_array_B)~=3;
    %--
    % ����W���Υ��ƪ�����л\��
    output_image_data_R(temp_smoothPT_match_array)=temp_smoothPT_image_data_R(temp_smoothPT_match_array);
    output_image_data_G(temp_smoothPT_match_array)=temp_smoothPT_image_data_G(temp_smoothPT_match_array);
    output_image_data_B(temp_smoothPT_match_array)=temp_smoothPT_image_data_B(temp_smoothPT_match_array);
    %--    
    output_image_data(:,:,1)=output_image_data_R;
    output_image_data(:,:,2)=output_image_data_G;
    output_image_data(:,:,3)=output_image_data_B;
    %--
%     imshow(output_image_data)
    disp('�л\�Ϥ�...����!')
    %----------------------------------------------------------------------
    disp('��X�ؼйϤ�...�}�l!')    
    imwrite(output_image_data,[output_png_path,output_png_file_name]); 
    disp('��X�ؼйϤ�...����!') 
    disp('===========================================================')	
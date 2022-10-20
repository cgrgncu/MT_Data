%**************************************************************************
%   Name: yeh_export_edi_smoothPT_replace.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221020a
%   Description: 取代輸出HsiupoYeh建議的大地電磁法平滑的相位張量圖(WxH=600x865)
%**************************************************************************
function ExportEdiPNG=yeh_export_edi_smoothPT_replace(varargin)
%----------------------------------------------------------------------
    Program_Version_str='v20221020a';
    %----------------------------------------------------------------------
    ExportEdiPNG.Error.String='';
    %----------------------------------------------------------------------
    % 使用提醒
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
        ExportEdiPNG.Error.String='請依照使用說明操作本程式...';
        disp('--')
        return
    end   
    %----------------------------------------------------------------------    
%==========================================================================
    % 建立輸出資料夾
    if ~(exist(output_png_path,'dir')==7)
        mkdir(output_png_path)
    end
%==========================================================================
    % 讀取圖檔並確認狀態(Input_600x865_PNG)
    try 
        empty_image_data=imread(Input_600x865_PNG);
        [empty_image_data_H,empty_image_data_W]=size(empty_image_data(:,:,1));
        if (empty_image_data_H==865 && empty_image_data_W==600)
            disp(['確認圖檔尺寸為600x865!'])
        else
            disp(['錯誤!此圖檔尺寸必須為600x865!return!'])
            return
        end
    catch  ME
        disp(['發生錯誤!return! 原因:',ME.message])
        return
    end
    %--
    % 讀取圖檔並確認狀態(Input_600x865_PNG)
    try 
        smoothPT_image_data=imread(Input_525x47_PNG);
        [smoothPT_image_data_H,smoothPT_image_data_W]=size(smoothPT_image_data(:,:,1));
        if (smoothPT_image_data_H==47 && smoothPT_image_data_W==525)
            disp(['確認圖檔尺寸為525x47!'])
        else
            disp(['錯誤!此圖檔尺寸必須為525x47!return!'])
            return
        end
    catch  ME
        disp(['發生錯誤!return! 原因:',ME.message])
        return
    end
%==========================================================================
	disp('===========================================================')
    disp('覆蓋圖片...開始!')
    %--------------------------------------------------------------------------
    % 確認位置，圖會剛剛好覆蓋掉座標軸，這段Debug用
    % check_image_data=empty_image_data;
    % x_shift=47;
    % y_shift=770;
    % check_image_data([1:smoothPT_image_data_H]+y_shift,[1:smoothPT_image_data_W]+x_shift,:)=smoothPT_image_data(:,:,:);
    % imshow(check_image_data)
    %--------------------------------------------------------------------------
    % 把smoothPT放到同尺寸的圖中
    %--
    % 白色底圖
    temp_smoothPT_image_data=uint8(ones(865,600,3)*255);
    % 覆蓋
    x_shift=47;
    y_shift=770;
    temp_smoothPT_image_data([1:smoothPT_image_data_H]+y_shift,[1:smoothPT_image_data_W]+x_shift,:)=smoothPT_image_data(:,:,:);
    % imshow(temp_smoothPT_image_data)
    %--------------------------------------------------------------------------
    % 把非白色區域覆蓋上去
    %--
    output_image_data=empty_image_data;
    %--
    % 取出RGB成分
    temp_smoothPT_image_data_R=temp_smoothPT_image_data(:,:,1);
    temp_smoothPT_image_data_G=temp_smoothPT_image_data(:,:,2);
    temp_smoothPT_image_data_B=temp_smoothPT_image_data(:,:,3);
    % 
    output_image_data_R=output_image_data(:,:,1);
    output_image_data_G=output_image_data(:,:,2);
    output_image_data_B=output_image_data(:,:,3);
    %--
    % 按照colorbar顏色設計，白色背景不會出現在橢圓中，所以先找出橢圓所在的畫素位置
    match_array_R=double(temp_smoothPT_image_data_R==255);
    match_array_G=double(temp_smoothPT_image_data_G==255);
    match_array_B=double(temp_smoothPT_image_data_B==255);
    temp_smoothPT_match_array=(match_array_R+match_array_G+match_array_B)~=3;
    %--
    % 把粗糙橢圓用平滑的橢圓覆蓋掉
    output_image_data_R(temp_smoothPT_match_array)=temp_smoothPT_image_data_R(temp_smoothPT_match_array);
    output_image_data_G(temp_smoothPT_match_array)=temp_smoothPT_image_data_G(temp_smoothPT_match_array);
    output_image_data_B(temp_smoothPT_match_array)=temp_smoothPT_image_data_B(temp_smoothPT_match_array);
    %--    
    output_image_data(:,:,1)=output_image_data_R;
    output_image_data(:,:,2)=output_image_data_G;
    output_image_data(:,:,3)=output_image_data_B;
    %--
%     imshow(output_image_data)
    disp('覆蓋圖片...結束!')
    %----------------------------------------------------------------------
    disp('輸出目標圖片...開始!')    
    imwrite(output_image_data,[output_png_path,output_png_file_name]); 
    disp('輸出目標圖片...結束!') 
    disp('===========================================================')	
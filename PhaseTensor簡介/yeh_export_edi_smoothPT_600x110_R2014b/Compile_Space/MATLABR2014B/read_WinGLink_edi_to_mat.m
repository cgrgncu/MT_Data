%**************************************************************************
%   Name: read_WinGLink_edi_to_mat.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20210208a
%   Description: 讀取WinGLink輸出的「*.edi」檔案文字內容至Matlab結構體中。
%                結構體細節請見程式碼。
%**************************************************************************
function WinGLinkEdiFile=read_WinGLink_edi_to_mat(Input_WinGLinkEdiFileEdiFileName)
    %----------------------------------------------------------------------
    % 使用提醒
    if ~exist('Input_WinGLinkEdiFileEdiFileName','var')
        disp('Usage:')
        disp('WinGLinkEdiFile=read_WinGLink_edi_to_mat(''xxxx.edi'')')        
        return
    end
    %----------------------------------------------------------------------
%clear;clc;close all
    WinGLinkEdiFile.EdiFileName=Input_WinGLinkEdiFileEdiFileName;
    %======================================================================
    % 將檔案內容全部載入到記憶體中 開始
    %disp(['讀取檔案: ',WinGLinkEdiFile.EdiFileName])
    %----------------------------------------------------------------------
    % 開啟檔案
    f1=fopen(WinGLinkEdiFile.EdiFileName,'rt');
    if (f1<0)
        %disp('開啟檔案失敗!return!')
        WinGLinkEdiFile.Error.String='開啟檔案失敗!return!';
        return
    end
    %--
    edi_Key_index=0;
    edi_Value_index=0;
    while(~feof(f1))
        temp_one_line_str=fgetl(f1);
        if length(temp_one_line_str)>=1 && temp_one_line_str(1)=='>'
            edi_Key_index=edi_Key_index+1;
            WinGLinkEdiFile.RawCell{edi_Key_index,1}.Key=temp_one_line_str;
            edi_Value_index=0;
        else
            edi_Value_index=edi_Value_index+1;
            WinGLinkEdiFile.RawCell{edi_Key_index,1}.Value{edi_Value_index,1}=temp_one_line_str;
        end        
    end
    %----------------------------------------------------------------------
    % 關閉檔案
    fclose(f1);
    %----------------------------------------------------------------------
    %disp(['關閉檔案: ',WinGLinkEdiFile.EdiFileName])
    % 將檔案內容全部載入到記憶體中 結束
    %======================================================================
    %----------------------------------------------------------------------
    % 「HEAD」
    temp_target_key='>HEAD';
    for i=1:length(WinGLinkEdiFile.RawCell(:,1))
        temp_edi_key=(WinGLinkEdiFile.RawCell{i,1}.Key);
        if strncmp(temp_target_key,temp_edi_key,length(temp_target_key))
            disp(['找到:',temp_target_key])
            temp_edi_value_cell=WinGLinkEdiFile.RawCell{i,1}.Value;            
            break
        end
    end
    for i=1:length(temp_edi_value_cell)
        temp_strfind_index=strfind(temp_edi_value_cell{i},'=');
        % 檢查
        if (isempty(temp_strfind_index))    
            %disp('警告!沒有找到「=」!略過此參數!')
        else
            %disp('找到「=」!')
            %--
            % 取出SubKey
            temp_SubKey_str=temp_edi_value_cell{i}(1:temp_strfind_index(1)-1);
            % 取出SubValue
            temp_SubValue_str=temp_edi_value_cell{i}(temp_strfind_index(1)+1:end);
            if temp_SubValue_str(1)=='"' && temp_SubValue_str(end)=='"'
                temp_SubValue_str=strrep(temp_SubValue_str,'"','');
            end
            eval(['WinGLinkEdiFile.HEAD.',temp_SubKey_str,'.String=temp_SubValue_str;'])
            if strncmp(temp_SubKey_str,'LAT',length('LAT'))
                disp(['LAT=',temp_SubValue_str])
                % 取出字串
                temp_split_str_cell=str2double(regexp(temp_SubValue_str, ':', 'split'));
                WinGLinkEdiFile.HEAD.LAT.Data_Header={'Latitude[degrees]'};
                WinGLinkEdiFile.HEAD.LAT.Data=temp_split_str_cell(1)+temp_split_str_cell(2)/60+temp_split_str_cell(3)/3600;                
                disp(['Latitude[degrees]=',sprintf('%.6f',WinGLinkEdiFile.HEAD.LAT.Data)])
            elseif strncmp(temp_SubKey_str,'LONG',length('LONG'))
                disp(['LONG=',temp_SubValue_str])
                % 取出字串
                temp_split_str_cell=str2double(regexp(temp_SubValue_str, ':', 'split'));
                WinGLinkEdiFile.HEAD.LONG.Data_Header={'Longitude[degrees]'};
                WinGLinkEdiFile.HEAD.LONG.Data=temp_split_str_cell(1)+temp_split_str_cell(2)/60+temp_split_str_cell(3)/3600;                
                disp(['Latitude[degrees]=',sprintf('%.6f',WinGLinkEdiFile.HEAD.LONG.Data)])
            end
        end
    end
    %----------------------------------------------------------------------
    % 需要的資料項目清單
    need_Key_list_cell={
    'FREQ','Frequency[Hz]'
    'ZROT','ZROT[degrees]'
    'ZXXR','ZXXR[Ohm]'
    'ZXXI','ZXXI[Ohm]'
    'ZXX.VAR','ZXX_VAR[Ohm]'
    'ZXYR','ZXYR[Ohm]'
    'ZXYI','ZXYI[Ohm]'
    'ZXY.VAR','ZXY_VAR[Ohm]'
    'ZYXR','ZYXR[Ohm]'
    'ZYXI','ZYXI[Ohm]'
    'ZYX.VAR','ZYX_VAR[Ohm]'
    'ZYYR','ZYYR[Ohm]'
    'ZYYI','ZYYI[Ohm]'
    'ZYY.VAR','ZYY_VAR[Ohm]'
    'RHOROT','RHOROT[degrees]'
    'RHOXY','RHOXY[Ohm-m]'
    'RHOXY.ERR','RHOXY_ERR[Ohm-m]'
    'RHOYX','RHOYX[Ohm-m]'
    'RHOYX.ERR','RHOYX_ERR[Ohm-m]'
    'RHOXX','RHOXX[Ohm-m]'
    'RHOXX.ERR','RHOXX_ERR[Ohm-m]'
    'RHOYY','RHOYY[Ohm-m]'
    'RHOYY.ERR','RHOYY_ERR[Ohm-m]'
    'PHSXY','PHSXY[degrees]'
    'PHSXY.ERR','PHSXY_ERR[degrees]'
    'PHSYX','PHSYX[degrees]'
    'PHSYX.ERR','PHSYX_ERR[degrees]'
    'PHSXX','PHSXX[degrees]'
    'PHSXX.ERR','PHSXX_ERR[degrees]'
    'PHSYY','PHSYY[degrees]'
    'PHSYY.ERR','PHSYY_ERR[degrees]'
    'TROT.EXP',''
    'TXR.EXP',''
    'TXI.EXP',''
    'TXVAR.EXP',''
    'TYR.EXP',''
    'TYI.EXP',''
    'TYVAR.EXP',''
    'TIPMAG',''
    'TIPMAG.VAR',''
    'TIPPHS',''
    'ZSTRIKE',''
    'ZSKEW',''
    'ZELLIP',''
    'TSTRIKE',''
    'TSKEW',''
    'TELLIP',''
    'INDMAGR.EXP',''
    'INDMAGI.EXP',''
    'INDANGR.EXP',''
    'INDANGI.EXP',''
    };
    %--
    % 依序整理
    for i_need_Key_list_cell=1:length(need_Key_list_cell(:,1))
        temp_target_key=need_Key_list_cell{i_need_Key_list_cell,1};
        temp_data_header=need_Key_list_cell{i_need_Key_list_cell,2};
         % 參數整理
        for i=1:length(WinGLinkEdiFile.RawCell(:,1))
            temp_edi_key=(WinGLinkEdiFile.RawCell{i,1}.Key);
            if strncmp(['>',temp_target_key],temp_edi_key,length(['>',temp_target_key]))
                disp(['找到:',['>',temp_target_key]])
                temp_edi_value_cell=WinGLinkEdiFile.RawCell{i,1}.Value;            
                break
            end
        end
        temp_all_data=[];
        for i=1:length(temp_edi_value_cell)
            %disp(temp_edi_value_cell{i,1})
            temp_data=str2double(regexp(temp_edi_value_cell{i,1}, ' ', 'split'));
            temp_data(isnan(temp_data))=[];
            temp_all_data=[temp_all_data,temp_data];        
        end
        eval(['WinGLinkEdiFile.',strrep(temp_target_key,'.','_'),'.Data_Header={temp_data_header};']);
        eval(['WinGLinkEdiFile.',strrep(temp_target_key,'.','_'),'.Data=temp_all_data'';']);
    end
    %----------------------------------------------------------------------
end
    
    
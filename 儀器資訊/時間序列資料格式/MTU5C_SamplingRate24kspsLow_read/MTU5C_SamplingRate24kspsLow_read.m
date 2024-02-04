%**************************************************************************
%   Name: MTU5C_SamplingRate24kspsLow_read.m v20240202a
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20240202a
%   Description: 讀取PHOENIX MTU-5C的原始時間序列檔案。
%                           此版本僅支援Config檔的「SamplingRate」設定為「24ksps Low」。
%                           「24ksps Low」為目前台灣MT觀測主要選用紀錄模式。每小時約40.60[MB]。
%                           在「24ksps Low」設定下，儲存檔案為降取樣型時間序列資料格式(format of decimated time series)
%                           細節可參考文件。
%  REF: DAA09 - DataFormat 3rd Party v2.0 - 210915.pdf   (下載位置: https://github.com/torresolmx/PhoenixGeoPy/blob/main/Docs/DAA09%20-%20DataFormat%203rd%20Party%20v2.0%20-%20210915.pdf)
%   呼叫方式:
%       PHOENIX_TS=MTU5C_SamplingRate24kspsLow_read('10615_63EAE53A_0_00000001.td_24k')
%**************************************************************************
function PHOENIX_TS=MTU5C_SamplingRate24kspsLow_read(Input_td24k_FileName)
% clear;clc;close all
% Input_td24k_FileName='10615_63EAE53A_0_00000001.td_24k';

    %-------------------------------------------------------------------------
    % 驗證PHOENIX Geophysics MTU-5C td_24k檔案名稱格式: 
    % 降取樣型時間序列資料格式(format of decimated time series): AAAAA_BBBBBBBB_C_DDDDDDDD.td24k
    % XXXXX為5個數字，代表儀器序號，例如: 12345 。
    % BBBBBBBB為8個英數字，為32位元無號數十六進制標籤，表示記錄開始時間的時間戳，與序列號一起構成記錄的唯一ID。
    % C為1個數字，做為頻道代號ID，從0開始。與所在紀錄資料夾相同數字，例如:「0」、「1」、「2」、「3」、「4」。通常是指:「H2(Hy)」、「E1(Ex)」、「H1(Hx)」、「H3(Hz)」、「E2(Ey)」。
    % DDDDDDDD為8個英數字，為32位元無號數十六進制標籤，紀錄器每一段時間將資料儲存為一個檔案，此標籤為該檔案的索引。每個檔案6分鐘或10分鐘儲存一次，此索引值的極限設計為可以儲存超過10000年的連續數據。索引從「00000001」開始，依序「00000002」、「00000003」、「00000004」、「00000005」、「00000006」、「00000007」、「0000000A」...，若照Windows檔案名稱排序可能部分資料會排到後面去。
    % 「td_24k」表示取樣率為24000[SPS]。
    %--
    % 說明:
    % 用match加上split模式，可以取得匹配的部分與不匹配的部分。
    % 這裡去找匹配數量是1，此時不匹配數量一定是2，而且不匹配的變數之
    % 第一個細胞矩陣內是匹配之前的字元，不匹配的變數之第二個細胞矩陣
    % 是匹配之後的字元，當這兩個都是空的，表示輸入字串數量與格式均符合。
    %--
    input_regexp_str=Input_td24k_FileName;
    input_regexp_expression=['\d{5}_[A-Z0-9]{8}_\d{1}_[A-Z0-9]{8}.td_24k',];% 格式: AAAAA_BBBBBBBB_C_DDDDDDDD.td_24k
    [out_regexp_Match,out_regexp_noMatch] = regexp(input_regexp_str,input_regexp_expression,'match','split');
    if (length(out_regexp_Match)==1 && isempty(out_regexp_noMatch{1}) && isempty(out_regexp_noMatch{2}))
        %disp('降取樣型時間序列資料格式正確')
    else
        disp('降取樣型時間序列資料格式錯誤!return!')
        PHOENIX_TS.Error.String='降取樣型時間序列資料格式錯誤!return!';
        return
    end
    %--
    % 展示:
    PHOENIX_TS.FileName=Input_td24k_FileName;
    %disp(['紀錄檔案名稱: ',PHOENIX_TS.FileName])
    %--
    Input_AAAAA_part_str=PHOENIX_TS.FileName(1:5);
    %disp(['「AAAAA」部分: ',Input_AAAAA_part_str])
    %--
    Input_BBBBBBBB_part_str=PHOENIX_TS.FileName(7:14);
    %disp(['「BBBBBBBB」部分: ',Input_BBBBBBBB_part_str])
    %--
    Input_C_part_str=PHOENIX_TS.FileName(16:16);
    %disp(['「C」部分: ',Input_C_part_str])
    %--
    Input_DDDDDDDD_part_str=PHOENIX_TS.FileName(18:25);
    %disp(['「DDDDDDDD」部分: ',Input_DDDDDDDD_part_str])
    %----------------------------------------------------------------------
    % 計算日期
    %--
    % UNIX時間起點
    JulianDate_datetime=datenum(1970,1,1,0,0,0);
    %--
    % 經過時間秒數
    elapsed_time_in_seconds=hex2dec(Input_BBBBBBBB_part_str);
    %--
    % 計算GPS +00:00時間
    GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
    %disp([GPS_date_str,' (GPS +00:00)'])
    %--
    % 計算GPS +08:00時間
    GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
    %disp([GPS_date_plus8_str,' (GPS +08:00)'])
    %----------------------------------------------------------------------
    %disp('--')
    %==========================================================================
    % 將檔案內容全部載入到記憶體中 開始
    %disp(['讀取檔案: ',PHOENIX_TS.FileName])
    %--------------------------------------------------------------------------
    % 開啟檔案
    f1=fopen(PHOENIX_TS.FileName,'r');
    if (f1<0)
        %disp('開啟檔案失敗!return!')
        PHOENIX_TS.Error.String='開啟檔案失敗!return!';
        return
    end
    %--
    % 用fread全部二進位資料
    temp_bin_data=fread(f1);
    % 
    PHOENIX_TS.FileLength=length(temp_bin_data);
    %--------------------------------------------------------------------------
    % 關閉檔案
    fclose(f1);
    %--------------------------------------------------------------------------
    %disp(['關閉檔案: ',PHOENIX_TS.FileName])
    % 將檔案內容全部載入到記憶體中 結束
    %==========================================================================
    %==========================================================================
    % Header資料解析
    %--
    % FileType:
    %     Size=1[Bytes],Offset=0[Bytes],DataType:uint8, 意義: 0x02 = 2 = decimated TS
    temp_FileType_data=temp_bin_data(1);
    if (temp_FileType_data==2)% 0x02 = 2 = decimated TS
        PHOENIX_TS.Header.FileType.Data=temp_FileType_data;
        PHOENIX_TS.Header.FileType.String=sprintf('0x%02x',temp_FileType_data);
        PHOENIX_TS.Header.FileType.README='1206 *MT decimated time series file';
    else
        disp('PHOENIX_TS.Header.FileType解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.FileType解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.FileType:'])
    %disp(PHOENIX_TS.Header.FileType)
    %--
    %disp('--')
    %--
    % FileVersion:
    %     Size=1[Bytes],Offset=1[Bytes],DataType:uint8, 意義: 0x03 = 3 = version 3
    temp_FileVersion_data=temp_bin_data(2);
    if (temp_FileVersion_data==3)% 0x03 = 3 = version 3
        PHOENIX_TS.Header.FileVersion.Data=temp_FileVersion_data;
        PHOENIX_TS.Header.FileVersion.String=sprintf('0x%02x',temp_FileVersion_data);
        PHOENIX_TS.Header.FileVersion.README='Decimated time series version 3 and up (described in this document) will have the correct timestamp.';
    elseif (temp_FileVersion_data<3) % 0x03之前的版本，例如0x02，
        PHOENIX_TS.Header.FileVersion.Data=temp_FileVersion_data;
        PHOENIX_TS.Header.FileVersion.String=sprintf('0x%02x',temp_FileVersion_data);
        PHOENIX_TS.Header.FileVersion.README='Note as well that for decimated time series with versions previous to 0x3 (before instrument firmware v2.0), this timestamp was one second behind the real GPS time due to an unexpected delay between the GPS chip hardware and its driver.';
    else
        disp('PHOENIX_TS.Header.FileVersion解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.FileVersion解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.FileVersion:'])
    %disp(PHOENIX_TS.Header.FileVersion)
    %--
    %disp('--')
    %--
    % HeaderLength:
    %     Size=2[Bytes],Offset=2[Bytes],DataType:uint16, 意義: 128 for version 3
    temp_HeaderLength_data=double(typecast(uint8(temp_bin_data(3:4)),'uint16'));    
    if (temp_HeaderLength_data==128)% 128 for version 3
        PHOENIX_TS.Header.HeaderLength.Data=temp_HeaderLength_data;
        PHOENIX_TS.Header.HeaderLength.README='128 for version 3';
    else
        disp('PHOENIX_TS.Header.HeaderLength解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.HeaderLength解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.HeaderLength:'])
    %disp(PHOENIX_TS.Header.HeaderLength)
    %--
    %disp('--')
    %--
    % InstrumentAssemblyType:
    %     Size=8[Bytes],Offset=4[Bytes],DataType:char, 意義: Example: XX999FF, the last two characters should be spaces for released products
    temp_InstrumentAssemblyType_data=temp_bin_data(5:12);    
    if (temp_InstrumentAssemblyType_data(end)==0 && temp_InstrumentAssemblyType_data(end-1) ==0)% the last two characters should be spaces for released products
        temp_InstrumentAssemblyType_Str=char(temp_InstrumentAssemblyType_data(temp_InstrumentAssemblyType_data>0)'); 
        PHOENIX_TS.Header.InstrumentAssemblyType.Data=temp_InstrumentAssemblyType_data;
        PHOENIX_TS.Header.InstrumentAssemblyType.String=temp_InstrumentAssemblyType_Str;
        PHOENIX_TS.Header.InstrumentAssemblyType.README='Example: XX999FF, the last two characters should be spaces for released products';
    else
        disp('PHOENIX_TS.Header.InstrumentAssemblyType解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.InstrumentAssemblyType解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.InstrumentAssemblyType:'])
    %disp(PHOENIX_TS.Header.InstrumentAssemblyType)
    %--
    %disp('--')
    %--
    % InstrumentSerialNumber:
    %    Size=8[Bytes],Offset=12[Bytes],DataType:char, 意義: Example: 99999 (Last two characters should be filled with null chars)
    temp_InstrumentSerialNumber_data=temp_bin_data(13:20);        
    if (temp_InstrumentSerialNumber_data(end)==0 && temp_InstrumentSerialNumber_data(end-1) ==0)% Last two characters should be filled with null chars
        temp_InstrumentSerialNumber_Str=char(temp_InstrumentSerialNumber_data(temp_InstrumentSerialNumber_data>0)'); 
        PHOENIX_TS.Header.InstrumentSerialNumber.Data=temp_InstrumentSerialNumber_data;
        PHOENIX_TS.Header.InstrumentSerialNumber.String=temp_InstrumentSerialNumber_Str;
        PHOENIX_TS.Header.InstrumentSerialNumber.README='Example: 99999 (Last two characters should be filled with null chars)';
    else
        disp('PHOENIX_TS.Header.InstrumentSerialNumber解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.InstrumentSerialNumber解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.InstrumentSerialNumber:'])
    %disp(PHOENIX_TS.Header.InstrumentSerialNumber)
    %--
    %disp('--')
    %--
    % RecordingID:
    %    Size=4[Bytes],Offset=20[Bytes],DataType:uint32, 意義: Timespamp at which the recording started, as the number of seconds elapsed since January 1st, 1970, 00:00:00 hours GPS time
    temp_RecordingID_data=temp_bin_data(21:24);      
    temp_RecordingID_str=sprintf('%02X%02X%02X%02X',temp_RecordingID_data(4),temp_RecordingID_data(3),temp_RecordingID_data(2),temp_RecordingID_data(1));
    if (strcmp(temp_RecordingID_str,PHOENIX_TS.FileName(7:14)))% 這個紀錄起始時間的HEX文字與檔名相同
        PHOENIX_TS.Header.RecordingID.Data=temp_RecordingID_data;
        PHOENIX_TS.Header.RecordingID.String=temp_RecordingID_str;
        PHOENIX_TS.Header.RecordingID.README='Timespamp at which the recording started, as the number of seconds elapsed since January 1st, 1970, 00:00:00 hours GPS time';
    else
        disp('PHOENIX_TS.Header.RecordingID解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.RecordingID解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.RecordingID:'])
    %disp(PHOENIX_TS.Header.RecordingID)
    %--
    %disp('--')
    %--
    % ChannelID:
    %    Size=1[Bytes],Offset=24[Bytes],DataType:uint8, 意義: Starting at 0
    temp_ChannelID_data=temp_bin_data(25);    
    temp_ChannelID_str=sprintf('%d',temp_ChannelID_data);
    if (strcmp(temp_ChannelID_str,PHOENIX_TS.FileName(16)))% 這個ChannelID文字與檔名相同
        PHOENIX_TS.Header.ChannelID.Data=temp_ChannelID_data;
        PHOENIX_TS.Header.ChannelID.String=temp_ChannelID_str;
        PHOENIX_TS.Header.ChannelID.README='Starting at 0';
    else
        disp('PHOENIX_TS.Header.ChannelID解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.ChannelID解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.ChannelID:'])
    %disp(PHOENIX_TS.Header.ChannelID)
    %--
    %disp('--')
    %--
    % FileSequence:
    %    Size=4[Bytes],Offset=25[Bytes],DataType:uint32, 意義: Starting at 0, increase every file
    temp_FileSequence_data=temp_bin_data(26:29);    
    temp_FileSequence_str=sprintf('%02X%02X%02X%02X',temp_FileSequence_data(4),temp_FileSequence_data(3),temp_FileSequence_data(2),temp_FileSequence_data(1));
    if (strcmp(temp_FileSequence_str,PHOENIX_TS.FileName(18:25)))% 這個FileSequence文字與檔名相同
        PHOENIX_TS.Header.FileSequence.Data=temp_FileSequence_data;
        PHOENIX_TS.Header.FileSequence.String=temp_FileSequence_str;
        PHOENIX_TS.Header.FileSequence.README='Starting at 0, increase every file';
    else
        disp('PHOENIX_TS.Header.FileSequence解析失敗!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.FileSequence解析失敗!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.FileSequence:'])
    %disp(PHOENIX_TS.Header.FileSequence)
    %--
    %disp('--')
    %--
    % FragmentationPeriod:
    %     Size=2[Bytes],Offset=29[Bytes],DataType:uint16, 意義: Time period covered (length) of each sequential file [s]
    temp_FragmentationPeriod_data=double(typecast(uint8(temp_bin_data(30:31)),'uint16'));    
    PHOENIX_TS.Header.FragmentationPeriod.Data=temp_FragmentationPeriod_data;
    PHOENIX_TS.Header.FragmentationPeriod.README='Time period covered (length) of each sequential file [s]';
    %disp(['PHOENIX_TS.Header.FragmentationPeriod:'])
    %disp(PHOENIX_TS.Header.FragmentationPeriod)
    %--
    %disp('--')
    %--
    % AcquisitionBoardModel:
    %    Size=8[Bytes],Offset=31[Bytes],DataType:char, 意義: Example: XX999FFF, the last three characters should be spaces for released boards
    temp_AcquisitionBoardModel_data=temp_bin_data(32:39);      
    temp_AcquisitionBoardModel_Str=char(temp_AcquisitionBoardModel_data(temp_AcquisitionBoardModel_data>0)');
    PHOENIX_TS.Header.AcquisitionBoardModel.Data=temp_AcquisitionBoardModel_data;
    PHOENIX_TS.Header.AcquisitionBoardModel.String=temp_AcquisitionBoardModel_Str;
    PHOENIX_TS.Header.AcquisitionBoardModel.README='Example: XX999FFF, the last three characters should be spaces for released boards';
    %disp(['PHOENIX_TS.Header.AcquisitionBoardModel:'])
    %disp(PHOENIX_TS.Header.AcquisitionBoardModel)
    %--
    %disp('--')
    %--
    % AcquisitionBoardSerial:
    %   Size=8[Bytes],Offset=39[Bytes],DataType:char, 意義: Example: 99999 (Last two characters should be filled with null chars)
    temp_AcquisitionBoardSerial_data=temp_bin_data(40:47);      
    temp_AcquisitionBoardSerial_Str=char(temp_AcquisitionBoardSerial_data(temp_AcquisitionBoardSerial_data>0)');
    PHOENIX_TS.Header.AcquisitionBoardSerial.Data=temp_AcquisitionBoardSerial_data;
    PHOENIX_TS.Header.AcquisitionBoardSerial.String=temp_AcquisitionBoardSerial_Str;
    PHOENIX_TS.Header.AcquisitionBoardSerial.README='Example: 99999 (Last two characters should be filled with null chars)';
    %disp(['PHOENIX_TS.Header.AcquisitionBoardSerial:'])
    %disp(PHOENIX_TS.Header.AcquisitionBoardSerial)
    %--
    %disp('--')
    %--
    % AcquisitionBoardFirmwareFingerprintR:
    %    Size=4[Bytes],Offset=47[Bytes],DataType:uint32, 意義: Pack as binary, converting the string returned by the instrument to 32 bit uint.
    temp_AcquisitionBoardFirmwareFingerprintR_data=temp_bin_data(48:51);    
    temp_AcquisitionBoardFirmwareFingerprintR_str=sprintf('%02X%02X%02X%02X',temp_AcquisitionBoardFirmwareFingerprintR_data(4),temp_AcquisitionBoardFirmwareFingerprintR_data(3),temp_AcquisitionBoardFirmwareFingerprintR_data(2),temp_AcquisitionBoardFirmwareFingerprintR_data(1));
    temp_AcquisitionBoardFirmwareFingerprintR_str=[temp_AcquisitionBoardFirmwareFingerprintR_str,'X'];
    PHOENIX_TS.Header.AcquisitionBoardFirmwareFingerprintR.Data=temp_AcquisitionBoardFirmwareFingerprintR_data;
    PHOENIX_TS.Header.AcquisitionBoardFirmwareFingerprintR.String=temp_AcquisitionBoardFirmwareFingerprintR_str;
    PHOENIX_TS.Header.AcquisitionBoardFirmwareFingerprintR.README='Pack as binary, converting the string returned by the instrument to 32 bit uint.';
    %disp(['PHOENIX_TS.Header.AcquisitionBoardFirmwareFingerprintR:'])
    %disp(PHOENIX_TS.Header.AcquisitionBoardFirmwareFingerprintR)
	%--
    %disp('--')
    %--
    % HardwareConfigurationFingerprint:
    %     Size=8[Bytes],Offset=51[Bytes],DataType:uint8, 意義: Hardware configuration flags, internal usage
    temp_HardwareConfigurationFingerprint_data=temp_bin_data(52:59);
    PHOENIX_TS.Header.HardwareConfigurationFingerprint.Data=temp_AcquisitionBoardFirmwareFingerprintR_data;
    PHOENIX_TS.Header.HardwareConfigurationFingerprint.README='Hardware configuration flags, internal usage';
    %disp(['PHOENIX_TS.Header.HardwareConfigurationFingerprint:'])
    %disp(PHOENIX_TS.Header.HardwareConfigurationFingerprint)
    %--
    %disp('--')
    %--
    % SamplingRateBase:
    %     Size=2[Bytes],Offset=59[Bytes],DataType:uint16, 意義: Examples: 24000 (or 9600 for MTU-5D, use exponent)
    temp_SamplingRateBase_data=double(typecast(uint8(temp_bin_data(60:61)),'uint16'));    
    PHOENIX_TS.Header.SamplingRateBase.Data=temp_SamplingRateBase_data;
    PHOENIX_TS.Header.SamplingRateBase.README='For the data payload contained for this file. Examples: 24000, 150, or for 96KS/s, it would read 9600, use exponent';
    %disp(['PHOENIX_TS.Header.SamplingRateBase:'])
    %disp(PHOENIX_TS.Header.SamplingRateBase)
    %--
    %disp('--')
    %--
    % SamplingRateExponent:
    %     Size=1[Bytes],Offset=61[Bytes],DataType:int8, 意義: Hardware configuration flags, internal usage
    temp_SamplingRateExponent_data=double(typecast(uint8(temp_bin_data(62)),'int8'));    
    PHOENIX_TS.Header.SamplingRateExponent.Data=temp_SamplingRateExponent_data;
    PHOENIX_TS.Header.SamplingRateExponent.README='Base 10, use 0 unless field above is not sufficien';
    %disp(['PHOENIX_TS.Header.SamplingRateExponent:'])
    %disp(PHOENIX_TS.Header.SamplingRateExponent)
    %--
    %disp('--')
    %--
    % BytesPerSampleR:
    %     Size=1[Bytes],Offset=62[Bytes],DataType:uint8, 意義: (4) for decimated time series
    temp_BytesPerSampleR_data=temp_bin_data(63);
    PHOENIX_TS.Header.BytesPerSampleR.Data=temp_BytesPerSampleR_data;
    PHOENIX_TS.Header.BytesPerSampleR.README='(4) for decimated time series';
    %disp(['PHOENIX_TS.Header.BytesPerSampleR:'])
    %disp(PHOENIX_TS.Header.BytesPerSampleR)
    %--
    %disp('--')
    %--
    % FutureExpansion1:
    %     Size=8[Bytes],Offset=63[Bytes],DataType:uint8, 意義: (to be defined)
    temp_FutureExpansion1_data=temp_bin_data(64:71);
    PHOENIX_TS.Header.FutureExpansion1.Data=temp_FutureExpansion1_data;
    PHOENIX_TS.Header.FutureExpansion1.README='(to be defined)';
    %disp(['PHOENIX_TS.Header.FutureExpansion1:'])
    %disp(PHOENIX_TS.Header.FutureExpansion1)
    %--
    %disp('--')
    %--
    % GPSLongitude:
    %     Size=4[Bytes],Offset=71[Bytes],DataType:float32, 意義: WGS84
    temp_GPSLongitude_data=double(typecast(uint8(temp_bin_data(72:75)),'single'));
    PHOENIX_TS.Header.GPSLongitude.Data=temp_GPSLongitude_data;
    PHOENIX_TS.Header.GPSLongitude.String=sprintf('%.6f',temp_GPSLongitude_data);
    PHOENIX_TS.Header.GPSLongitude.README='WGS84';
    %disp(['PHOENIX_TS.Header.GPSLongitude:'])
    %disp(PHOENIX_TS.Header.GPSLongitude)
    %--
    %disp('--')
    %--
    % GPSLatitude:
    %     Size=4[Bytes],Offset=75[Bytes],DataType:float32, 意義: WGS84
    temp_GPSLatitude_data=double(typecast(uint8(temp_bin_data(76:79)),'single'));
    PHOENIX_TS.Header.GPSLatitude.Data=temp_GPSLatitude_data;
    PHOENIX_TS.Header.GPSLatitude.String=sprintf('%.6f',temp_GPSLatitude_data);
    PHOENIX_TS.Header.GPSLatitude.README='WGS84';
    %disp(['PHOENIX_TS.Header.GPSLatitude:'])
    %disp(PHOENIX_TS.Header.GPSLatitude)
    %--
    %disp('--')
    %--
    % GPSElevationAboveMeanSeaLevel:
    %     Size=4[Bytes],Offset=79[Bytes],DataType:float32, 意義: WGS84
    temp_GPSElevationAboveMeanSeaLevel_data=double(typecast(uint8(temp_bin_data(80:83)),'single'));
    PHOENIX_TS.Header.GPSElevationAboveMeanSeaLevel.Data=temp_GPSElevationAboveMeanSeaLevel_data;
    PHOENIX_TS.Header.GPSElevationAboveMeanSeaLevel.String=sprintf('%.2f[m]',temp_GPSElevationAboveMeanSeaLevel_data);
    PHOENIX_TS.Header.GPSElevationAboveMeanSeaLevel.README='WGS84';
    %disp(['PHOENIX_TS.Header.GPSElevationAboveMeanSeaLevel:'])
    %disp(PHOENIX_TS.Header.GPSElevationAboveMeanSeaLevel)
    %--
    %disp('--')
    %--
    % GPSHorizonralResolutionFuture:
    %     Size=4[Bytes],Offset=83[Bytes],DataType:uint32, 意義: [mm]
    temp_GPSHorizonralResolutionFuture_data=double(typecast(uint8(temp_bin_data(84:87)),'uint32'));
    PHOENIX_TS.Header.GPSHorizonralResolutionFuture.Data=temp_GPSHorizonralResolutionFuture_data;
    PHOENIX_TS.Header.GPSHorizonralResolutionFuture.String=sprintf('%.2f[m]',temp_GPSHorizonralResolutionFuture_data/1000);
    PHOENIX_TS.Header.GPSHorizonralResolutionFuture.README='[mm]';
    %disp(['PHOENIX_TS.Header.GPSHorizonralResolutionFuture:'])
    %disp(PHOENIX_TS.Header.GPSHorizonralResolutionFuture)
    %--
    %disp('--')
    %--
    % GPSVerticalResolutionFuture:
    %     Size=4[Bytes],Offset=87[Bytes],DataType:uint32, 意義: [mm]
    temp_GPSVerticalResolutionFuture_data=double(typecast(uint8(temp_bin_data(88:91)),'uint32'));
    PHOENIX_TS.Header.GPSVerticalResolutionFuture.Data=temp_GPSVerticalResolutionFuture_data;
    PHOENIX_TS.Header.GPSVerticalResolutionFuture.String=sprintf('%.2f[m]',temp_GPSVerticalResolutionFuture_data/1000);
    PHOENIX_TS.Header.GPSVerticalResolutionFuture.README='[mm]';
    %disp(['PHOENIX_TS.Header.GPSVerticalResolutionFuture:'])
    %disp(PHOENIX_TS.Header.GPSVerticalResolutionFuture)
    %--
    %disp('--')
    %--
    % TimingAndLocationStatusFlags:
    %     Size=1[Bytes],Offset=91[Bytes],DataType:uint8, 意義: FlagsByte
    temp_TimingAndLocationStatusFlags_data=temp_bin_data(92);
    PHOENIX_TS.Header.TimingAndLocationStatusFlags.Data=temp_TimingAndLocationStatusFlags_data;
    PHOENIX_TS.Header.TimingAndLocationStatusFlags.README='FlagsByte';
    %disp(['PHOENIX_TS.Header.TimingAndLocationStatusFlags:'])
    %disp(PHOENIX_TS.Header.TimingAndLocationStatusFlags)
    %--
    %disp('--')
    %--
    % TimingAndLocationStatusNumSat:
    %     Size=1[Bytes],Offset=92[Bytes],DataType:uint8, 意義: FlagsByte
    temp_TimingAndLocationStatusNumSat_data=temp_bin_data(93);
    PHOENIX_TS.Header.TimingAndLocationStatusNumSat.Data=temp_TimingAndLocationStatusNumSat_data;
    PHOENIX_TS.Header.TimingAndLocationStatusNumSat.README='NumSatByte';
    %disp(['PHOENIX_TS.Header.TimingAndLocationStatusNumSat:'])
    %disp(PHOENIX_TS.Header.TimingAndLocationStatusNumSat)
    %--
    %disp('--')
    %--
    % TimingAndLocationStatusStability:
    %     Size=2[Bytes],Offset=93[Bytes],DataType:uint16, 意義: Stability_uint16
    temp_TimingAndLocationStatusStability_data=double(typecast(uint8(temp_bin_data(94:95)),'uint16'));    
    PHOENIX_TS.Header.TimingAndLocationStatusStability.Data=temp_TimingAndLocationStatusStability_data;
    PHOENIX_TS.Header.TimingAndLocationStatusStability.README='Stability_uint16';
    %disp(['PHOENIX_TS.Header.TimingAndLocationStatusStability:'])
    %disp(PHOENIX_TS.Header.TimingAndLocationStatusStability)
    %--
    %disp('--')
    %--
    % FutureExpansion2:
    %     Size=6[Bytes],Offset=95[Bytes],DataType:uint8, 意義: (to be defined)
    temp_FutureExpansion2_data=temp_bin_data(96:101);
    PHOENIX_TS.Header.FutureExpansion2.Data=temp_FutureExpansion2_data;
    PHOENIX_TS.Header.FutureExpansion2.README='(to be defined)';
    %disp(['PHOENIX_TS.Header.FutureExpansion2:'])
    %disp(PHOENIX_TS.Header.FutureExpansion2)
    %--
    %disp('--')
    %--
    % Reserved1:
    %     Size=4[Bytes],Offset=101[Bytes],DataType:uint8, 意義: Reserved
    temp_Reserved1_data=temp_bin_data(102:105);
    PHOENIX_TS.Header.Reserved1.Data=temp_Reserved1_data;
    PHOENIX_TS.Header.Reserved1.README='Reserved';
    %disp(['PHOENIX_TS.Header.Reserved1:'])
    %disp(PHOENIX_TS.Header.Reserved1)
    %--
    %disp('--')
	%--
    % BatteryLevel:
    %     Size=2[Bytes],Offset=105[Bytes],DataType:uint16, 意義: [mV]
    temp_BatteryLevel_data=double(typecast(uint8(temp_bin_data(106:107)),'uint16'));    
    PHOENIX_TS.Header.BatteryLevel.Data=temp_BatteryLevel_data;
    PHOENIX_TS.Header.BatteryLevel.String=sprintf('%.3f[V]',temp_BatteryLevel_data/1000);
    PHOENIX_TS.Header.BatteryLevel.README='[mV]';
    %disp(['PHOENIX_TS.Header.BatteryLevel:'])
    %disp(PHOENIX_TS.Header.BatteryLevel)
    %--
    %disp('--')
    %--
    % Reserved2:
    %     Size=12[Bytes],Offset=107[Bytes],DataType:uint8, 意義: Reserved
    temp_Reserved2_data=temp_bin_data(108:119);
    PHOENIX_TS.Header.Reserved2.Data=temp_Reserved2_data;
    PHOENIX_TS.Header.Reserved2.README='Reserved';
    %disp(['PHOENIX_TS.Header.Reserved2:'])
    %disp(PHOENIX_TS.Header.Reserved2)
    %--
    %disp('--')
    %--
    % DecimationSchemeID:
    %    Size=4[Bytes],Offset=119[Bytes],DataType:uint32, 意義: Numerical identifier of the decimation scheme used for this time series
    temp_DecimationSchemeID_data=double(typecast(uint8(temp_bin_data(120:123)),'uint32'));
    PHOENIX_TS.Header.DecimationSchemeID.Data=temp_DecimationSchemeID_data;
    PHOENIX_TS.Header.DecimationSchemeID.String=sprintf('%d',temp_DecimationSchemeID_data);
    PHOENIX_TS.Header.DecimationSchemeID.README='Numerical identifier of the decimation scheme used for this time series';
    %disp(['PHOENIX_TS.Header.DecimationSchemeID:'])
    %disp(PHOENIX_TS.Header.DecimationSchemeID)
    %--
    %disp('--')
    %--
    % FutureExpansion3:
    %     Size=5[Bytes],Offset=123[Bytes],DataType:uint8, 意義: (to be defined)
    temp_FutureExpansion3_data=temp_bin_data(124:128);
    PHOENIX_TS.Header.FutureExpansion3.Data=temp_FutureExpansion3_data;
    PHOENIX_TS.Header.FutureExpansion3.README='(to be defined)';
    %disp(['PHOENIX_TS.Header.FutureExpansion3:'])
    %disp(PHOENIX_TS.Header.FutureExpansion3)
    %--
    %disp('--')
    %--
    % 先解析一個子檔頭的必要資料，有利於驗證檔案尺寸正確性
    %--
    % FirstSegment資料解析，
    %--
    % NumSegmentSamples:
    %   Size=4[Bytes],Offset=132[Bytes],DataType:uint32, 意義: Number of Samples in one Segment
	temp_NumSegmentSamples_data=double(typecast(uint8(temp_bin_data(133:136)),'uint32'));
    temp_FirstSegment.NumSegmentSamples.Data=temp_NumSegmentSamples_data;
    temp_FirstSegment.NumSegmentSamples.String=sprintf('%d',temp_NumSegmentSamples_data);
    temp_FirstSegment.NumSegmentSamples.README='Number of Samples in one Segment';
    %disp(['temp_FirstSegment.NumSegmentSamples:'])
    %disp(temp_FirstSegment.NumSegmentSamples)
    %--
    % 檢查檔案長度
	FileLength_NoMainHeader=PHOENIX_TS.FileLength-PHOENIX_TS.Header.HeaderLength.Data;
    oneSegmentLength=(temp_FirstSegment.NumSegmentSamples.Data*4)+32;%子檔頭長度為32[Bytes]
    if (mod(FileLength_NoMainHeader,oneSegmentLength)==0)
        PHOENIX_TS.SegmentCount=FileLength_NoMainHeader/oneSegmentLength;
    else
        disp('PHOENIX_TS.SegmentCount解析失敗!檔案長度錯誤嗎?return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.SegmentCount解析失敗!檔案長度錯誤嗎?return!';
    end
	%--
    %disp('--')
    %--
    %==========================================================================
    
    
    %==========================================================================
    % Segment資料解析，
    % 註:MinVal數值怪怪的，不知原因，請勿使用
    current_cursor_position=128;
    PHOENIX_TS.Segments=[];    
    for i=1:PHOENIX_TS.SegmentCount        
        %--
        % TimeStamp:
        %     Size=4[Bytes],DataType:uint32, 意義: 舊版韌體的時間會差一秒，新版的不會
        temp_TimeStamp_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'uint32'));
        current_cursor_position=current_cursor_position+4;
        % 韌體問題之時間戳修正:
        if (PHOENIX_TS.Header.FileVersion.Data<3)
            temp_TimeStamp_data=temp_TimeStamp_data+1;
        end  
        %--
        temp_OneSegment.TimeStamp.Data=temp_TimeStamp_data;
        temp_OneSegment.TimeStamp.String=sprintf('%d',temp_TimeStamp_data);
        temp_OneSegment.TimeStamp.README='in json file : data.time_stamp';
        %disp(['temp_OneSegment.TimeStamp:'])
        %disp(temp_OneSegment.TimeStamp)
        %--
        %disp('--')
        %--
        % NumSegmentSamples:
        %   Size=4[Bytes],DataType:uint32, 意義: Number of Samples in one Segment
        temp_NumSegmentSamples_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'uint32'));
        current_cursor_position=current_cursor_position+4;
        if (temp_NumSegmentSamples_data==24000)
            temp_OneSegment.NumSegmentSamples.Data=temp_NumSegmentSamples_data;
            temp_OneSegment.NumSegmentSamples.String=sprintf('%d',temp_NumSegmentSamples_data);
            temp_OneSegment.NumSegmentSamples.README='Number of Samples in one Segment';
            %disp(['temp_OneSegment.NumSegmentSamples:'])
            %disp(temp_OneSegment.NumSegmentSamples)
        else
            disp([' 錯誤，NumSegmentSamples必須為24000，NumSegmentSamples=',num2str(temp_NumSegmentSamples_data),',return!'])
            PHOENIX_TS.Error.String=[' 錯誤，NumSegmentSamples必須為24000，NumSegmentSamples=',num2str(temp_NumSegmentSamples_data),',return!'];
            return
        end
        %--
        %disp('--')
        %--
        % FutureUsage1:
        %     Size=4[Bytes],DataType:uint32, 意義: FutureUsage
        temp_FutureUsage1_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'uint32'));
        current_cursor_position=current_cursor_position+4;
        temp_OneSegment.FutureUsage1.Data=temp_FutureUsage1_data;
        temp_OneSegment.FutureUsage1.README='FutureUsage';
        %disp(['temp_OneSegment.FutureUsage1:'])
        %disp(temp_OneSegment.FutureUsage1)
        %--
        %disp('--')
        %--
        % MinVal:
        %     Size=4[Bytes],DataType:float32, 意義: MinVal[V]
        temp_MinVal_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'single'));
        current_cursor_position=current_cursor_position+4;
        temp_OneSegment.MinVal.Data=temp_MinVal_data;
        temp_OneSegment.MinVal.String=sprintf('%.9f[V]',temp_MinVal_data);
        temp_OneSegment.MinVal.README='MinVal[V], notes: this value is wrong, dont ust this...';
        %disp(['temp_OneSegment.MinVal:'])
        %disp(temp_OneSegment.MinVal)
        %--
        %disp('--')
        %--
        % MaxVal:
        %     Size=4[Bytes],DataType:float32, 意義: MaxVal[V]
        temp_MaxVal_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'single'));
        current_cursor_position=current_cursor_position+4;
        temp_OneSegment.MaxVal.Data=temp_MaxVal_data;
        temp_OneSegment.MaxVal.String=sprintf('%.9f[V]',temp_MaxVal_data);
        temp_OneSegment.MaxVal.README='MaxVal';
        %disp(['temp_OneSegment.MaxVal:'])
        %disp(temp_OneSegment.MaxVal)
        %--
        %disp('--')
        %--
        % AverageVal:
        %     Size=4[Bytes],DataType:float32, 意義: AverageVal[V]
        temp_AverageVal_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'single'));
        current_cursor_position=current_cursor_position+4;
        temp_OneSegment.AverageVal.Data=temp_AverageVal_data;
        temp_OneSegment.AverageVal.String=sprintf('%.9f[V]',temp_AverageVal_data);
        temp_OneSegment.AverageVal.README='AverageVal[V]';
        %disp(['temp_OneSegment.AverageVal:'])
        %disp(temp_OneSegment.AverageVal)
        %--
        %disp('--')
        % FutureUsage2:
        %     Size=8[Bytes],DataType:uint8, 意義: FutureUsage
        temp_FutureUsage2_data=temp_bin_data(current_cursor_position+1:current_cursor_position+8);
        current_cursor_position=current_cursor_position+8;
        temp_OneSegment.FutureUsage2.Data=temp_FutureUsage2_data;
        temp_OneSegment.FutureUsage2.README='FutureUsage';
        %disp(['temp_OneSegment.FutureUsage2:'])
        %disp(temp_OneSegment.FutureUsage2)
        %--
        %disp('--')
        %--
        % 檢查長度無誤後向後解析時間序列數值:
        if (length(temp_bin_data)>=current_cursor_position+4*temp_OneSegment.NumSegmentSamples.Data)
            % Samples
            temp_Samples_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4*temp_OneSegment.NumSegmentSamples.Data)),'single'));
            current_cursor_position=current_cursor_position+4*temp_OneSegment.NumSegmentSamples.Data;
            temp_OneSegment.Samples.Data=temp_Samples_data;
            temp_OneSegment.Samples.README='[V]';
            %disp(['temp_OneSegment.Samples:'])
            %disp(temp_OneSegment.Samples)
        else
            disp('剩餘長度不足以解析資料!return!')
            PHOENIX_TS.Error.String='剩餘長度不足以解析資料!return!';
            return
        end
        %--
        PHOENIX_TS.Segments=[PHOENIX_TS.Segments,temp_OneSegment];        
    end
    %==========================================================================
    
    
    
    
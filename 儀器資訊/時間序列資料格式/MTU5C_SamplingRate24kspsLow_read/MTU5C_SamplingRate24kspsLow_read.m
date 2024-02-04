%**************************************************************************
%   Name: MTU5C_SamplingRate24kspsLow_read.m v20240202a
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20240202a
%   Description: Ū��PHOENIX MTU-5C����l�ɶ��ǦC�ɮסC
%                           �������Ȥ䴩Config�ɪ��uSamplingRate�v�]�w���u24ksps Low�v�C
%                           �u24ksps Low�v���ثe�x�WMT�[���D�n��ά����Ҧ��C�C�p�ɬ�40.60[MB]�C
%                           �b�u24ksps Low�v�]�w�U�A�x�s�ɮ׬������˫��ɶ��ǦC��Ʈ榡(format of decimated time series)
%                           �Ӹ`�i�ѦҤ��C
%  REF: DAA09 - DataFormat 3rd Party v2.0 - 210915.pdf   (�U����m: https://github.com/torresolmx/PhoenixGeoPy/blob/main/Docs/DAA09%20-%20DataFormat%203rd%20Party%20v2.0%20-%20210915.pdf)
%   �I�s�覡:
%       PHOENIX_TS=MTU5C_SamplingRate24kspsLow_read('10615_63EAE53A_0_00000001.td_24k')
%**************************************************************************
function PHOENIX_TS=MTU5C_SamplingRate24kspsLow_read(Input_td24k_FileName)
% clear;clc;close all
% Input_td24k_FileName='10615_63EAE53A_0_00000001.td_24k';

    %-------------------------------------------------------------------------
    % ����PHOENIX Geophysics MTU-5C td_24k�ɮצW�ٮ榡: 
    % �����˫��ɶ��ǦC��Ʈ榡(format of decimated time series): AAAAA_BBBBBBBB_C_DDDDDDDD.td24k
    % XXXXX��5�ӼƦr�A�N������Ǹ��A�Ҧp: 12345 �C
    % BBBBBBBB��8�ӭ^�Ʀr�A��32�줸�L���ƤQ���i����ҡA��ܰO���}�l�ɶ����ɶ��W�A�P�ǦC���@�_�c���O�����ߤ@ID�C
    % C��1�ӼƦr�A�����W�D�N��ID�A�q0�}�l�C�P�Ҧb������Ƨ��ۦP�Ʀr�A�Ҧp:�u0�v�B�u1�v�B�u2�v�B�u3�v�B�u4�v�C�q�`�O��:�uH2(Hy)�v�B�uE1(Ex)�v�B�uH1(Hx)�v�B�uH3(Hz)�v�B�uE2(Ey)�v�C
    % DDDDDDDD��8�ӭ^�Ʀr�A��32�줸�L���ƤQ���i����ҡA�������C�@�q�ɶ��N����x�s���@���ɮסA�����Ҭ����ɮת����ޡC�C���ɮ�6������10�����x�s�@���A�����ޭȪ������]�p���i�H�x�s�W�L10000�~���s��ƾڡC���ޱq�u00000001�v�}�l�A�̧ǡu00000002�v�B�u00000003�v�B�u00000004�v�B�u00000005�v�B�u00000006�v�B�u00000007�v�B�u0000000A�v...�A�Y��Windows�ɮצW�ٱƧǥi�ೡ����Ʒ|�ƨ�᭱�h�C
    % �utd_24k�v��ܨ��˲v��24000[SPS]�C
    %--
    % ����:
    % ��match�[�Wsplit�Ҧ��A�i�H���o�ǰt�������P���ǰt�������C
    % �o�̥h��ǰt�ƶq�O1�A���ɤ��ǰt�ƶq�@�w�O2�A�ӥB���ǰt���ܼƤ�
    % �Ĥ@�ӲӭM�x�}���O�ǰt���e���r���A���ǰt���ܼƤ��ĤG�ӲӭM�x�}
    % �O�ǰt���᪺�r���A��o��ӳ��O�Ū��A��ܿ�J�r��ƶq�P�榡���ŦX�C
    %--
    input_regexp_str=Input_td24k_FileName;
    input_regexp_expression=['\d{5}_[A-Z0-9]{8}_\d{1}_[A-Z0-9]{8}.td_24k',];% �榡: AAAAA_BBBBBBBB_C_DDDDDDDD.td_24k
    [out_regexp_Match,out_regexp_noMatch] = regexp(input_regexp_str,input_regexp_expression,'match','split');
    if (length(out_regexp_Match)==1 && isempty(out_regexp_noMatch{1}) && isempty(out_regexp_noMatch{2}))
        %disp('�����˫��ɶ��ǦC��Ʈ榡���T')
    else
        disp('�����˫��ɶ��ǦC��Ʈ榡���~!return!')
        PHOENIX_TS.Error.String='�����˫��ɶ��ǦC��Ʈ榡���~!return!';
        return
    end
    %--
    % �i��:
    PHOENIX_TS.FileName=Input_td24k_FileName;
    %disp(['�����ɮצW��: ',PHOENIX_TS.FileName])
    %--
    Input_AAAAA_part_str=PHOENIX_TS.FileName(1:5);
    %disp(['�uAAAAA�v����: ',Input_AAAAA_part_str])
    %--
    Input_BBBBBBBB_part_str=PHOENIX_TS.FileName(7:14);
    %disp(['�uBBBBBBBB�v����: ',Input_BBBBBBBB_part_str])
    %--
    Input_C_part_str=PHOENIX_TS.FileName(16:16);
    %disp(['�uC�v����: ',Input_C_part_str])
    %--
    Input_DDDDDDDD_part_str=PHOENIX_TS.FileName(18:25);
    %disp(['�uDDDDDDDD�v����: ',Input_DDDDDDDD_part_str])
    %----------------------------------------------------------------------
    % �p����
    %--
    % UNIX�ɶ��_�I
    JulianDate_datetime=datenum(1970,1,1,0,0,0);
    %--
    % �g�L�ɶ����
    elapsed_time_in_seconds=hex2dec(Input_BBBBBBBB_part_str);
    %--
    % �p��GPS +00:00�ɶ�
    GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
    %disp([GPS_date_str,' (GPS +00:00)'])
    %--
    % �p��GPS +08:00�ɶ�
    GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
    %disp([GPS_date_plus8_str,' (GPS +08:00)'])
    %----------------------------------------------------------------------
    %disp('--')
    %==========================================================================
    % �N�ɮפ��e�������J��O���餤 �}�l
    %disp(['Ū���ɮ�: ',PHOENIX_TS.FileName])
    %--------------------------------------------------------------------------
    % �}���ɮ�
    f1=fopen(PHOENIX_TS.FileName,'r');
    if (f1<0)
        %disp('�}���ɮץ���!return!')
        PHOENIX_TS.Error.String='�}���ɮץ���!return!';
        return
    end
    %--
    % ��fread�����G�i����
    temp_bin_data=fread(f1);
    % 
    PHOENIX_TS.FileLength=length(temp_bin_data);
    %--------------------------------------------------------------------------
    % �����ɮ�
    fclose(f1);
    %--------------------------------------------------------------------------
    %disp(['�����ɮ�: ',PHOENIX_TS.FileName])
    % �N�ɮפ��e�������J��O���餤 ����
    %==========================================================================
    %==========================================================================
    % Header��ƸѪR
    %--
    % FileType:
    %     Size=1[Bytes],Offset=0[Bytes],DataType:uint8, �N�q: 0x02 = 2 = decimated TS
    temp_FileType_data=temp_bin_data(1);
    if (temp_FileType_data==2)% 0x02 = 2 = decimated TS
        PHOENIX_TS.Header.FileType.Data=temp_FileType_data;
        PHOENIX_TS.Header.FileType.String=sprintf('0x%02x',temp_FileType_data);
        PHOENIX_TS.Header.FileType.README='1206 *MT decimated time series file';
    else
        disp('PHOENIX_TS.Header.FileType�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.FileType�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.FileType:'])
    %disp(PHOENIX_TS.Header.FileType)
    %--
    %disp('--')
    %--
    % FileVersion:
    %     Size=1[Bytes],Offset=1[Bytes],DataType:uint8, �N�q: 0x03 = 3 = version 3
    temp_FileVersion_data=temp_bin_data(2);
    if (temp_FileVersion_data==3)% 0x03 = 3 = version 3
        PHOENIX_TS.Header.FileVersion.Data=temp_FileVersion_data;
        PHOENIX_TS.Header.FileVersion.String=sprintf('0x%02x',temp_FileVersion_data);
        PHOENIX_TS.Header.FileVersion.README='Decimated time series version 3 and up (described in this document) will have the correct timestamp.';
    elseif (temp_FileVersion_data<3) % 0x03���e�������A�Ҧp0x02�A
        PHOENIX_TS.Header.FileVersion.Data=temp_FileVersion_data;
        PHOENIX_TS.Header.FileVersion.String=sprintf('0x%02x',temp_FileVersion_data);
        PHOENIX_TS.Header.FileVersion.README='Note as well that for decimated time series with versions previous to 0x3 (before instrument firmware v2.0), this timestamp was one second behind the real GPS time due to an unexpected delay between the GPS chip hardware and its driver.';
    else
        disp('PHOENIX_TS.Header.FileVersion�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.FileVersion�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.FileVersion:'])
    %disp(PHOENIX_TS.Header.FileVersion)
    %--
    %disp('--')
    %--
    % HeaderLength:
    %     Size=2[Bytes],Offset=2[Bytes],DataType:uint16, �N�q: 128 for version 3
    temp_HeaderLength_data=double(typecast(uint8(temp_bin_data(3:4)),'uint16'));    
    if (temp_HeaderLength_data==128)% 128 for version 3
        PHOENIX_TS.Header.HeaderLength.Data=temp_HeaderLength_data;
        PHOENIX_TS.Header.HeaderLength.README='128 for version 3';
    else
        disp('PHOENIX_TS.Header.HeaderLength�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.HeaderLength�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.HeaderLength:'])
    %disp(PHOENIX_TS.Header.HeaderLength)
    %--
    %disp('--')
    %--
    % InstrumentAssemblyType:
    %     Size=8[Bytes],Offset=4[Bytes],DataType:char, �N�q: Example: XX999FF, the last two characters should be spaces for released products
    temp_InstrumentAssemblyType_data=temp_bin_data(5:12);    
    if (temp_InstrumentAssemblyType_data(end)==0 && temp_InstrumentAssemblyType_data(end-1) ==0)% the last two characters should be spaces for released products
        temp_InstrumentAssemblyType_Str=char(temp_InstrumentAssemblyType_data(temp_InstrumentAssemblyType_data>0)'); 
        PHOENIX_TS.Header.InstrumentAssemblyType.Data=temp_InstrumentAssemblyType_data;
        PHOENIX_TS.Header.InstrumentAssemblyType.String=temp_InstrumentAssemblyType_Str;
        PHOENIX_TS.Header.InstrumentAssemblyType.README='Example: XX999FF, the last two characters should be spaces for released products';
    else
        disp('PHOENIX_TS.Header.InstrumentAssemblyType�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.InstrumentAssemblyType�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.InstrumentAssemblyType:'])
    %disp(PHOENIX_TS.Header.InstrumentAssemblyType)
    %--
    %disp('--')
    %--
    % InstrumentSerialNumber:
    %    Size=8[Bytes],Offset=12[Bytes],DataType:char, �N�q: Example: 99999 (Last two characters should be filled with null chars)
    temp_InstrumentSerialNumber_data=temp_bin_data(13:20);        
    if (temp_InstrumentSerialNumber_data(end)==0 && temp_InstrumentSerialNumber_data(end-1) ==0)% Last two characters should be filled with null chars
        temp_InstrumentSerialNumber_Str=char(temp_InstrumentSerialNumber_data(temp_InstrumentSerialNumber_data>0)'); 
        PHOENIX_TS.Header.InstrumentSerialNumber.Data=temp_InstrumentSerialNumber_data;
        PHOENIX_TS.Header.InstrumentSerialNumber.String=temp_InstrumentSerialNumber_Str;
        PHOENIX_TS.Header.InstrumentSerialNumber.README='Example: 99999 (Last two characters should be filled with null chars)';
    else
        disp('PHOENIX_TS.Header.InstrumentSerialNumber�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.InstrumentSerialNumber�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.InstrumentSerialNumber:'])
    %disp(PHOENIX_TS.Header.InstrumentSerialNumber)
    %--
    %disp('--')
    %--
    % RecordingID:
    %    Size=4[Bytes],Offset=20[Bytes],DataType:uint32, �N�q: Timespamp at which the recording started, as the number of seconds elapsed since January 1st, 1970, 00:00:00 hours GPS time
    temp_RecordingID_data=temp_bin_data(21:24);      
    temp_RecordingID_str=sprintf('%02X%02X%02X%02X',temp_RecordingID_data(4),temp_RecordingID_data(3),temp_RecordingID_data(2),temp_RecordingID_data(1));
    if (strcmp(temp_RecordingID_str,PHOENIX_TS.FileName(7:14)))% �o�Ӭ����_�l�ɶ���HEX��r�P�ɦW�ۦP
        PHOENIX_TS.Header.RecordingID.Data=temp_RecordingID_data;
        PHOENIX_TS.Header.RecordingID.String=temp_RecordingID_str;
        PHOENIX_TS.Header.RecordingID.README='Timespamp at which the recording started, as the number of seconds elapsed since January 1st, 1970, 00:00:00 hours GPS time';
    else
        disp('PHOENIX_TS.Header.RecordingID�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.RecordingID�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.RecordingID:'])
    %disp(PHOENIX_TS.Header.RecordingID)
    %--
    %disp('--')
    %--
    % ChannelID:
    %    Size=1[Bytes],Offset=24[Bytes],DataType:uint8, �N�q: Starting at 0
    temp_ChannelID_data=temp_bin_data(25);    
    temp_ChannelID_str=sprintf('%d',temp_ChannelID_data);
    if (strcmp(temp_ChannelID_str,PHOENIX_TS.FileName(16)))% �o��ChannelID��r�P�ɦW�ۦP
        PHOENIX_TS.Header.ChannelID.Data=temp_ChannelID_data;
        PHOENIX_TS.Header.ChannelID.String=temp_ChannelID_str;
        PHOENIX_TS.Header.ChannelID.README='Starting at 0';
    else
        disp('PHOENIX_TS.Header.ChannelID�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.ChannelID�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.ChannelID:'])
    %disp(PHOENIX_TS.Header.ChannelID)
    %--
    %disp('--')
    %--
    % FileSequence:
    %    Size=4[Bytes],Offset=25[Bytes],DataType:uint32, �N�q: Starting at 0, increase every file
    temp_FileSequence_data=temp_bin_data(26:29);    
    temp_FileSequence_str=sprintf('%02X%02X%02X%02X',temp_FileSequence_data(4),temp_FileSequence_data(3),temp_FileSequence_data(2),temp_FileSequence_data(1));
    if (strcmp(temp_FileSequence_str,PHOENIX_TS.FileName(18:25)))% �o��FileSequence��r�P�ɦW�ۦP
        PHOENIX_TS.Header.FileSequence.Data=temp_FileSequence_data;
        PHOENIX_TS.Header.FileSequence.String=temp_FileSequence_str;
        PHOENIX_TS.Header.FileSequence.README='Starting at 0, increase every file';
    else
        disp('PHOENIX_TS.Header.FileSequence�ѪR����!return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.Header.FileSequence�ѪR����!return!';
        return
    end
    %disp(['PHOENIX_TS.Header.FileSequence:'])
    %disp(PHOENIX_TS.Header.FileSequence)
    %--
    %disp('--')
    %--
    % FragmentationPeriod:
    %     Size=2[Bytes],Offset=29[Bytes],DataType:uint16, �N�q: Time period covered (length) of each sequential file [s]
    temp_FragmentationPeriod_data=double(typecast(uint8(temp_bin_data(30:31)),'uint16'));    
    PHOENIX_TS.Header.FragmentationPeriod.Data=temp_FragmentationPeriod_data;
    PHOENIX_TS.Header.FragmentationPeriod.README='Time period covered (length) of each sequential file [s]';
    %disp(['PHOENIX_TS.Header.FragmentationPeriod:'])
    %disp(PHOENIX_TS.Header.FragmentationPeriod)
    %--
    %disp('--')
    %--
    % AcquisitionBoardModel:
    %    Size=8[Bytes],Offset=31[Bytes],DataType:char, �N�q: Example: XX999FFF, the last three characters should be spaces for released boards
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
    %   Size=8[Bytes],Offset=39[Bytes],DataType:char, �N�q: Example: 99999 (Last two characters should be filled with null chars)
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
    %    Size=4[Bytes],Offset=47[Bytes],DataType:uint32, �N�q: Pack as binary, converting the string returned by the instrument to 32 bit uint.
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
    %     Size=8[Bytes],Offset=51[Bytes],DataType:uint8, �N�q: Hardware configuration flags, internal usage
    temp_HardwareConfigurationFingerprint_data=temp_bin_data(52:59);
    PHOENIX_TS.Header.HardwareConfigurationFingerprint.Data=temp_AcquisitionBoardFirmwareFingerprintR_data;
    PHOENIX_TS.Header.HardwareConfigurationFingerprint.README='Hardware configuration flags, internal usage';
    %disp(['PHOENIX_TS.Header.HardwareConfigurationFingerprint:'])
    %disp(PHOENIX_TS.Header.HardwareConfigurationFingerprint)
    %--
    %disp('--')
    %--
    % SamplingRateBase:
    %     Size=2[Bytes],Offset=59[Bytes],DataType:uint16, �N�q: Examples: 24000 (or 9600 for MTU-5D, use exponent)
    temp_SamplingRateBase_data=double(typecast(uint8(temp_bin_data(60:61)),'uint16'));    
    PHOENIX_TS.Header.SamplingRateBase.Data=temp_SamplingRateBase_data;
    PHOENIX_TS.Header.SamplingRateBase.README='For the data payload contained for this file. Examples: 24000, 150, or for 96KS/s, it would read 9600, use exponent';
    %disp(['PHOENIX_TS.Header.SamplingRateBase:'])
    %disp(PHOENIX_TS.Header.SamplingRateBase)
    %--
    %disp('--')
    %--
    % SamplingRateExponent:
    %     Size=1[Bytes],Offset=61[Bytes],DataType:int8, �N�q: Hardware configuration flags, internal usage
    temp_SamplingRateExponent_data=double(typecast(uint8(temp_bin_data(62)),'int8'));    
    PHOENIX_TS.Header.SamplingRateExponent.Data=temp_SamplingRateExponent_data;
    PHOENIX_TS.Header.SamplingRateExponent.README='Base 10, use 0 unless field above is not sufficien';
    %disp(['PHOENIX_TS.Header.SamplingRateExponent:'])
    %disp(PHOENIX_TS.Header.SamplingRateExponent)
    %--
    %disp('--')
    %--
    % BytesPerSampleR:
    %     Size=1[Bytes],Offset=62[Bytes],DataType:uint8, �N�q: (4) for decimated time series
    temp_BytesPerSampleR_data=temp_bin_data(63);
    PHOENIX_TS.Header.BytesPerSampleR.Data=temp_BytesPerSampleR_data;
    PHOENIX_TS.Header.BytesPerSampleR.README='(4) for decimated time series';
    %disp(['PHOENIX_TS.Header.BytesPerSampleR:'])
    %disp(PHOENIX_TS.Header.BytesPerSampleR)
    %--
    %disp('--')
    %--
    % FutureExpansion1:
    %     Size=8[Bytes],Offset=63[Bytes],DataType:uint8, �N�q: (to be defined)
    temp_FutureExpansion1_data=temp_bin_data(64:71);
    PHOENIX_TS.Header.FutureExpansion1.Data=temp_FutureExpansion1_data;
    PHOENIX_TS.Header.FutureExpansion1.README='(to be defined)';
    %disp(['PHOENIX_TS.Header.FutureExpansion1:'])
    %disp(PHOENIX_TS.Header.FutureExpansion1)
    %--
    %disp('--')
    %--
    % GPSLongitude:
    %     Size=4[Bytes],Offset=71[Bytes],DataType:float32, �N�q: WGS84
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
    %     Size=4[Bytes],Offset=75[Bytes],DataType:float32, �N�q: WGS84
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
    %     Size=4[Bytes],Offset=79[Bytes],DataType:float32, �N�q: WGS84
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
    %     Size=4[Bytes],Offset=83[Bytes],DataType:uint32, �N�q: [mm]
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
    %     Size=4[Bytes],Offset=87[Bytes],DataType:uint32, �N�q: [mm]
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
    %     Size=1[Bytes],Offset=91[Bytes],DataType:uint8, �N�q: FlagsByte
    temp_TimingAndLocationStatusFlags_data=temp_bin_data(92);
    PHOENIX_TS.Header.TimingAndLocationStatusFlags.Data=temp_TimingAndLocationStatusFlags_data;
    PHOENIX_TS.Header.TimingAndLocationStatusFlags.README='FlagsByte';
    %disp(['PHOENIX_TS.Header.TimingAndLocationStatusFlags:'])
    %disp(PHOENIX_TS.Header.TimingAndLocationStatusFlags)
    %--
    %disp('--')
    %--
    % TimingAndLocationStatusNumSat:
    %     Size=1[Bytes],Offset=92[Bytes],DataType:uint8, �N�q: FlagsByte
    temp_TimingAndLocationStatusNumSat_data=temp_bin_data(93);
    PHOENIX_TS.Header.TimingAndLocationStatusNumSat.Data=temp_TimingAndLocationStatusNumSat_data;
    PHOENIX_TS.Header.TimingAndLocationStatusNumSat.README='NumSatByte';
    %disp(['PHOENIX_TS.Header.TimingAndLocationStatusNumSat:'])
    %disp(PHOENIX_TS.Header.TimingAndLocationStatusNumSat)
    %--
    %disp('--')
    %--
    % TimingAndLocationStatusStability:
    %     Size=2[Bytes],Offset=93[Bytes],DataType:uint16, �N�q: Stability_uint16
    temp_TimingAndLocationStatusStability_data=double(typecast(uint8(temp_bin_data(94:95)),'uint16'));    
    PHOENIX_TS.Header.TimingAndLocationStatusStability.Data=temp_TimingAndLocationStatusStability_data;
    PHOENIX_TS.Header.TimingAndLocationStatusStability.README='Stability_uint16';
    %disp(['PHOENIX_TS.Header.TimingAndLocationStatusStability:'])
    %disp(PHOENIX_TS.Header.TimingAndLocationStatusStability)
    %--
    %disp('--')
    %--
    % FutureExpansion2:
    %     Size=6[Bytes],Offset=95[Bytes],DataType:uint8, �N�q: (to be defined)
    temp_FutureExpansion2_data=temp_bin_data(96:101);
    PHOENIX_TS.Header.FutureExpansion2.Data=temp_FutureExpansion2_data;
    PHOENIX_TS.Header.FutureExpansion2.README='(to be defined)';
    %disp(['PHOENIX_TS.Header.FutureExpansion2:'])
    %disp(PHOENIX_TS.Header.FutureExpansion2)
    %--
    %disp('--')
    %--
    % Reserved1:
    %     Size=4[Bytes],Offset=101[Bytes],DataType:uint8, �N�q: Reserved
    temp_Reserved1_data=temp_bin_data(102:105);
    PHOENIX_TS.Header.Reserved1.Data=temp_Reserved1_data;
    PHOENIX_TS.Header.Reserved1.README='Reserved';
    %disp(['PHOENIX_TS.Header.Reserved1:'])
    %disp(PHOENIX_TS.Header.Reserved1)
    %--
    %disp('--')
	%--
    % BatteryLevel:
    %     Size=2[Bytes],Offset=105[Bytes],DataType:uint16, �N�q: [mV]
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
    %     Size=12[Bytes],Offset=107[Bytes],DataType:uint8, �N�q: Reserved
    temp_Reserved2_data=temp_bin_data(108:119);
    PHOENIX_TS.Header.Reserved2.Data=temp_Reserved2_data;
    PHOENIX_TS.Header.Reserved2.README='Reserved';
    %disp(['PHOENIX_TS.Header.Reserved2:'])
    %disp(PHOENIX_TS.Header.Reserved2)
    %--
    %disp('--')
    %--
    % DecimationSchemeID:
    %    Size=4[Bytes],Offset=119[Bytes],DataType:uint32, �N�q: Numerical identifier of the decimation scheme used for this time series
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
    %     Size=5[Bytes],Offset=123[Bytes],DataType:uint8, �N�q: (to be defined)
    temp_FutureExpansion3_data=temp_bin_data(124:128);
    PHOENIX_TS.Header.FutureExpansion3.Data=temp_FutureExpansion3_data;
    PHOENIX_TS.Header.FutureExpansion3.README='(to be defined)';
    %disp(['PHOENIX_TS.Header.FutureExpansion3:'])
    %disp(PHOENIX_TS.Header.FutureExpansion3)
    %--
    %disp('--')
    %--
    % ���ѪR�@�Ӥl���Y�����n��ơA���Q�������ɮפؤo���T��
    %--
    % FirstSegment��ƸѪR�A
    %--
    % NumSegmentSamples:
    %   Size=4[Bytes],Offset=132[Bytes],DataType:uint32, �N�q: Number of Samples in one Segment
	temp_NumSegmentSamples_data=double(typecast(uint8(temp_bin_data(133:136)),'uint32'));
    temp_FirstSegment.NumSegmentSamples.Data=temp_NumSegmentSamples_data;
    temp_FirstSegment.NumSegmentSamples.String=sprintf('%d',temp_NumSegmentSamples_data);
    temp_FirstSegment.NumSegmentSamples.README='Number of Samples in one Segment';
    %disp(['temp_FirstSegment.NumSegmentSamples:'])
    %disp(temp_FirstSegment.NumSegmentSamples)
    %--
    % �ˬd�ɮת���
	FileLength_NoMainHeader=PHOENIX_TS.FileLength-PHOENIX_TS.Header.HeaderLength.Data;
    oneSegmentLength=(temp_FirstSegment.NumSegmentSamples.Data*4)+32;%�l���Y���׬�32[Bytes]
    if (mod(FileLength_NoMainHeader,oneSegmentLength)==0)
        PHOENIX_TS.SegmentCount=FileLength_NoMainHeader/oneSegmentLength;
    else
        disp('PHOENIX_TS.SegmentCount�ѪR����!�ɮת��׿��~��?return!')
        PHOENIX_TS.Error.String='PHOENIX_TS.SegmentCount�ѪR����!�ɮת��׿��~��?return!';
    end
	%--
    %disp('--')
    %--
    %==========================================================================
    
    
    %==========================================================================
    % Segment��ƸѪR�A
    % ��:MinVal�ƭȩǩǪ��A������]�A�ФŨϥ�
    current_cursor_position=128;
    PHOENIX_TS.Segments=[];    
    for i=1:PHOENIX_TS.SegmentCount        
        %--
        % TimeStamp:
        %     Size=4[Bytes],DataType:uint32, �N�q: �ª����骺�ɶ��|�t�@��A�s�������|
        temp_TimeStamp_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'uint32'));
        current_cursor_position=current_cursor_position+4;
        % ������D���ɶ��W�ץ�:
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
        %   Size=4[Bytes],DataType:uint32, �N�q: Number of Samples in one Segment
        temp_NumSegmentSamples_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4)),'uint32'));
        current_cursor_position=current_cursor_position+4;
        if (temp_NumSegmentSamples_data==24000)
            temp_OneSegment.NumSegmentSamples.Data=temp_NumSegmentSamples_data;
            temp_OneSegment.NumSegmentSamples.String=sprintf('%d',temp_NumSegmentSamples_data);
            temp_OneSegment.NumSegmentSamples.README='Number of Samples in one Segment';
            %disp(['temp_OneSegment.NumSegmentSamples:'])
            %disp(temp_OneSegment.NumSegmentSamples)
        else
            disp([' ���~�ANumSegmentSamples������24000�ANumSegmentSamples=',num2str(temp_NumSegmentSamples_data),',return!'])
            PHOENIX_TS.Error.String=[' ���~�ANumSegmentSamples������24000�ANumSegmentSamples=',num2str(temp_NumSegmentSamples_data),',return!'];
            return
        end
        %--
        %disp('--')
        %--
        % FutureUsage1:
        %     Size=4[Bytes],DataType:uint32, �N�q: FutureUsage
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
        %     Size=4[Bytes],DataType:float32, �N�q: MinVal[V]
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
        %     Size=4[Bytes],DataType:float32, �N�q: MaxVal[V]
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
        %     Size=4[Bytes],DataType:float32, �N�q: AverageVal[V]
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
        %     Size=8[Bytes],DataType:uint8, �N�q: FutureUsage
        temp_FutureUsage2_data=temp_bin_data(current_cursor_position+1:current_cursor_position+8);
        current_cursor_position=current_cursor_position+8;
        temp_OneSegment.FutureUsage2.Data=temp_FutureUsage2_data;
        temp_OneSegment.FutureUsage2.README='FutureUsage';
        %disp(['temp_OneSegment.FutureUsage2:'])
        %disp(temp_OneSegment.FutureUsage2)
        %--
        %disp('--')
        %--
        % �ˬd���׵L�~��V��ѪR�ɶ��ǦC�ƭ�:
        if (length(temp_bin_data)>=current_cursor_position+4*temp_OneSegment.NumSegmentSamples.Data)
            % Samples
            temp_Samples_data=double(typecast(uint8(temp_bin_data(current_cursor_position+1:current_cursor_position+4*temp_OneSegment.NumSegmentSamples.Data)),'single'));
            current_cursor_position=current_cursor_position+4*temp_OneSegment.NumSegmentSamples.Data;
            temp_OneSegment.Samples.Data=temp_Samples_data;
            temp_OneSegment.Samples.README='[V]';
            %disp(['temp_OneSegment.Samples:'])
            %disp(temp_OneSegment.Samples)
        else
            disp('�Ѿl���פ����H�ѪR���!return!')
            PHOENIX_TS.Error.String='�Ѿl���פ����H�ѪR���!return!';
            return
        end
        %--
        PHOENIX_TS.Segments=[PHOENIX_TS.Segments,temp_OneSegment];        
    end
    %==========================================================================
    
    
    
    
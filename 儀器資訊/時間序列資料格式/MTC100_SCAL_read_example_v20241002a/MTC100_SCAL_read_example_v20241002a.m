%**************************************************************************
%   Name: MTC100_SCAL_read_example_v20241002a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20241002a
%   Description: example code for PHOENIX MTU-185 *.scal file read
%   REF: MTC-100_SERIES_SENSORS_DataFormat_Reverse_Engineering_Notes_v20241002a.pdf
%**************************************************************************
clear;clc;close all
%==============================
% Input FileName
SCAL.FileName='53495_64F0A5EE.scal';
disp(['Input SCAL FileName = ',SCAL.FileName])
%--
% read all the binary data to buffer
f1=fopen(SCAL.FileName);
temp_data=fread(f1);
fclose(f1);
%--
% get FileSize
SCAL.FileSize.Header={'[Bytes]'};
SCAL.FileSize.Data=length(temp_data);
disp(['Input SCAL FileSize = ',num2str(SCAL.FileSize.Data), ' [Bytes]'])
%--
% get NumberOfRecords
SCAL.NumberOfRecords.Header={'[Count]'};
SCAL.NumberOfRecords.Data=temp_data(340);
disp(['Input SCAL NumberOfRecords = ',num2str(SCAL.NumberOfRecords.Data), ' [Count]'])
%--
% double check FileSize
if (SCAL.FileSize.Data == 340+SCAL.NumberOfRecords.Data*32)
    disp('double check FileSize : PASS')
else
    disp('double check FileSize : FAIL')
    return
end
%==============================
disp('--')
%==============================
% get important information & Data
%--
SCAL.GPSTimestampHexString=sprintf('%X%X%X%X',temp_data(8),temp_data(7),temp_data(6),temp_data(5));
% --
% Instrument_Serial
SCAL.Instrument_Serial=char(temp_data(9:16)');
SCAL.Instrument_Serial=strrep(SCAL.Instrument_Serial,char(0),'');
%--
% Sensor_Serial
SCAL.Sensor_Serial=char(temp_data(60:67)');
SCAL.Sensor_Serial=strrep(SCAL.Sensor_Serial,char(0),'');
%--
% Sensor_Type
SCAL.Sensor_Type=char(temp_data(70:77)');
SCAL.Sensor_Type=strrep(SCAL.Sensor_Type,char(0),'');
%--
% GPSLatitude
SCAL.GPSLatitude.Header={'[degrees]'};
SCAL.GPSLatitude.Data=double(typecast(uint8(temp_data(112:115)),'single'));
%--
% GPSLongitude
SCAL.GPSLongitude.Header={'[degrees]'};
SCAL.GPSLongitude.Data=double(typecast(uint8(temp_data(116:119)),'single'));
%--
% GPSElevationAboveMeanSeaLevel
SCAL.GPSElevationAboveMeanSeaLevel.Header={'[m]'};
SCAL.GPSElevationAboveMeanSeaLevel.Data=double(typecast(uint8(temp_data(120:123)),'single'));
%--
temp_Freq_array=zeros(SCAL.NumberOfRecords.Data,1);
temp_Real_array=zeros(SCAL.NumberOfRecords.Data,1);
temp_Imag_array=zeros(SCAL.NumberOfRecords.Data,1);
temp_Magnitude_array=zeros(SCAL.NumberOfRecords.Data,1);
temp_PhaseInDegrees_array=zeros(SCAL.NumberOfRecords.Data,1);
%--
first_freq_index=341;
for i=1:SCAL.NumberOfRecords.Data
    temp_Freq_array(i)=typecast(uint8(temp_data(first_freq_index:first_freq_index+3)),'single');
    temp_Real_array(i)=typecast(uint8(temp_data(first_freq_index+4:first_freq_index+4+3)),'single');
    temp_Imag_array(i)=typecast(uint8(temp_data(first_freq_index+8:first_freq_index+8+3)),'single');
    temp_Magnitude_array(i)=abs(complex(temp_Real_array(i),temp_Imag_array(i)));
    temp_PhaseInDegrees_array(i)=angle(complex(temp_Real_array(i),temp_Imag_array(i)))*180/pi;
    first_freq_index=first_freq_index+32;
end
%--
SCAL.FrequencyResponse.Header={'Frequency[Hz]', 'Real Part[mV/nT]', 'Imaginary Part[mV/nT]', 'Magnitude[mV/nT]', 'Phase[degrees]'};
SCAL.FrequencyResponse.Data=[temp_Freq_array,temp_Real_array,temp_Imag_array,temp_Magnitude_array,temp_PhaseInDegrees_array];
%==============================
%==============================
% Show important information & Data
%--
disp('Calibration Infomation:')
disp(['Sensor Type = ',SCAL.Sensor_Type])
disp(['Sensor Serial = ',SCAL.Sensor_Serial])
%----------------------------------------------------------------------
% convert to datetime
%--
% UNIX time
JulianDate_datetime=datenum(1970,1,1,0,0,0);
%--
% elapsed_time_in_seconds
elapsed_time_in_seconds=hex2dec(SCAL.GPSTimestampHexString);
%--
% get GPS +00:00 time
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
disp(['Timestamps(GPS) = ',GPS_date_str,' (GPS +00:00)'])
%--
% get GPS +08:00 time
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
disp(['Timestamps(GPS) = ',GPS_date_plus8_str,' (GPS +08:00)'])
%----------------------------------------------------------------------
disp(['Receiver Serial = ',SCAL.Instrument_Serial])
disp(['Latitude[degrees] = ',sprintf('%.14f',SCAL.GPSLatitude.Data)])
disp(['Longitude[degrees] = ',sprintf('%.14f',SCAL.GPSLongitude.Data)])
disp(['Altitude[m] = ',sprintf('%.14f',SCAL.GPSElevationAboveMeanSeaLevel.Data)])
%--
disp('--')
%--
fprintf('%s,%s,%s,%s,%s\n',SCAL.FrequencyResponse.Header{:})
fprintf('%16.13f,%16.10f,%16.10f,%16.10f,%16.10f\n',SCAL.FrequencyResponse.Data')
disp('--')
%==============================
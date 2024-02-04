clear;clc;close all
PHOENIX_TS=MTU5C_SamplingRate24kspsLow_read('10615_63EAE53A_0_00000002.td_24k');
%--
% 使用範例: 取出重要的基本資訊
disp('--')
disp(['檔案名稱 = ',PHOENIX_TS.FileName])
disp(['本檔案涵蓋時間長度[秒]  = ',num2str(PHOENIX_TS.Header.FragmentationPeriod.Data)])
disp(['本檔案涵蓋時間內的代表電壓[mV]  = ',num2str(PHOENIX_TS.Header.BatteryLevel.Data)])
disp(['本檔案涵蓋時間內的代表經度[度]  = ',num2str(PHOENIX_TS.Header.GPSLongitude.Data)])
disp(['本檔案涵蓋時間內的代表緯度[度]  = ',num2str(PHOENIX_TS.Header.GPSLatitude.Data)])
disp(['本檔案涵蓋時間內的代表衛星數量[個]  = ',num2str(PHOENIX_TS.Header.TimingAndLocationStatusNumSat.Data)])
disp(['本檔案時間序列儲存時採用的資料取樣率[Hz]  = ',num2str(PHOENIX_TS.Header.SamplingRateBase.Data*10^PHOENIX_TS.Header.SamplingRateExponent.Data)])
disp('--')
%--
% 使用範例: 取出指定Segment的時間戳記
disp(['第2個Segment的起始時間時間戳記 = ',PHOENIX_TS.Segments(2).TimeStamp.String])
%--
% 使用範例: 一次性取出各Segment的時間戳記
% 使用範例: 一次性取出各Segment的時間戳記
temp_TimeStamp_struct=([PHOENIX_TS.Segments.TimeStamp]);
temp_TimeStamp_Data_array=[temp_TimeStamp_struct.Data];
disp(['各Segment的時間戳記:'])
disp(sprintf('%d\n',temp_TimeStamp_Data_array))
disp('--')
%--
% 使用範例: 一次性取出各Segment的時間序列資料
disp(['時間序列資料單位:',PHOENIX_TS.Segments(1).Samples.README])
temp_Sample_struct=([PHOENIX_TS.Segments.Samples]);
temp_Sample_Data_array=[temp_Sample_struct.Data];
%
figure('Position', [50 50 900 600])
%----------------------------------------------------------------------
subplot(6,1,1)
%
plot(temp_Sample_Data_array(:,1))
% 計算日期
% UNIX時間起點
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% 經過時間秒數
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,1);
% 計算GPS +00:00時間
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% 計算GPS +08:00時間
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
title(['檔案名稱 = ',PHOENIX_TS.FileName],'Interpreter', 'none')
%----------------------------------------------------------------------
subplot(6,1,2)
%
plot(temp_Sample_Data_array(:,2))
% 計算日期
% UNIX時間起點
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% 經過時間秒數
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,2);
% 計算GPS +00:00時間
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% 計算GPS +08:00時間
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,3)
%
plot(temp_Sample_Data_array(:,3))
% 計算日期
% UNIX時間起點
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% 經過時間秒數
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,3);
% 計算GPS +00:00時間
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% 計算GPS +08:00時間
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,4)
%
plot(temp_Sample_Data_array(:,4))
% 計算日期
% UNIX時間起點
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% 經過時間秒數
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,4);
% 計算GPS +00:00時間
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% 計算GPS +08:00時間
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,5)
%
plot(temp_Sample_Data_array(:,5))
% 計算日期
% UNIX時間起點
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% 經過時間秒數
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,5);
% 計算GPS +00:00時間
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% 計算GPS +08:00時間
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,6)
%
plot(temp_Sample_Data_array(:,6))
% 計算日期
% UNIX時間起點
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% 經過時間秒數
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,6);
% 計算GPS +00:00時間
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% 計算GPS +08:00時間
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------

%--
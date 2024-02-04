clear;clc;close all
PHOENIX_TS=MTU5C_SamplingRate24kspsLow_read('10615_63EAE53A_0_00000002.td_24k');
%--
% �ϥνd��: ���X���n���򥻸�T
disp('--')
disp(['�ɮצW�� = ',PHOENIX_TS.FileName])
disp(['���ɮײ[�\�ɶ�����[��]  = ',num2str(PHOENIX_TS.Header.FragmentationPeriod.Data)])
disp(['���ɮײ[�\�ɶ������N��q��[mV]  = ',num2str(PHOENIX_TS.Header.BatteryLevel.Data)])
disp(['���ɮײ[�\�ɶ������N��g��[��]  = ',num2str(PHOENIX_TS.Header.GPSLongitude.Data)])
disp(['���ɮײ[�\�ɶ������N��n��[��]  = ',num2str(PHOENIX_TS.Header.GPSLatitude.Data)])
disp(['���ɮײ[�\�ɶ������N��ìP�ƶq[��]  = ',num2str(PHOENIX_TS.Header.TimingAndLocationStatusNumSat.Data)])
disp(['���ɮ׮ɶ��ǦC�x�s�ɱĥΪ���ƨ��˲v[Hz]  = ',num2str(PHOENIX_TS.Header.SamplingRateBase.Data*10^PHOENIX_TS.Header.SamplingRateExponent.Data)])
disp('--')
%--
% �ϥνd��: ���X���wSegment���ɶ��W�O
disp(['��2��Segment���_�l�ɶ��ɶ��W�O = ',PHOENIX_TS.Segments(2).TimeStamp.String])
%--
% �ϥνd��: �@���ʨ��X�USegment���ɶ��W�O
% �ϥνd��: �@���ʨ��X�USegment���ɶ��W�O
temp_TimeStamp_struct=([PHOENIX_TS.Segments.TimeStamp]);
temp_TimeStamp_Data_array=[temp_TimeStamp_struct.Data];
disp(['�USegment���ɶ��W�O:'])
disp(sprintf('%d\n',temp_TimeStamp_Data_array))
disp('--')
%--
% �ϥνd��: �@���ʨ��X�USegment���ɶ��ǦC���
disp(['�ɶ��ǦC��Ƴ��:',PHOENIX_TS.Segments(1).Samples.README])
temp_Sample_struct=([PHOENIX_TS.Segments.Samples]);
temp_Sample_Data_array=[temp_Sample_struct.Data];
%
figure('Position', [50 50 900 600])
%----------------------------------------------------------------------
subplot(6,1,1)
%
plot(temp_Sample_Data_array(:,1))
% �p����
% UNIX�ɶ��_�I
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% �g�L�ɶ����
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,1);
% �p��GPS +00:00�ɶ�
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% �p��GPS +08:00�ɶ�
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
title(['�ɮצW�� = ',PHOENIX_TS.FileName],'Interpreter', 'none')
%----------------------------------------------------------------------
subplot(6,1,2)
%
plot(temp_Sample_Data_array(:,2))
% �p����
% UNIX�ɶ��_�I
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% �g�L�ɶ����
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,2);
% �p��GPS +00:00�ɶ�
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% �p��GPS +08:00�ɶ�
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,3)
%
plot(temp_Sample_Data_array(:,3))
% �p����
% UNIX�ɶ��_�I
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% �g�L�ɶ����
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,3);
% �p��GPS +00:00�ɶ�
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% �p��GPS +08:00�ɶ�
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,4)
%
plot(temp_Sample_Data_array(:,4))
% �p����
% UNIX�ɶ��_�I
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% �g�L�ɶ����
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,4);
% �p��GPS +00:00�ɶ�
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% �p��GPS +08:00�ɶ�
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,5)
%
plot(temp_Sample_Data_array(:,5))
% �p����
% UNIX�ɶ��_�I
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% �g�L�ɶ����
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,5);
% �p��GPS +00:00�ɶ�
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% �p��GPS +08:00�ɶ�
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------
subplot(6,1,6)
%
plot(temp_Sample_Data_array(:,6))
% �p����
% UNIX�ɶ��_�I
JulianDate_datetime=datenum(1970,1,1,0,0,0);
% �g�L�ɶ����
elapsed_time_in_seconds=temp_TimeStamp_Data_array(:,6);
% �p��GPS +00:00�ɶ�
GPS_date_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_str,' (GPS +00:00)'])
% �p��GPS +08:00�ɶ�
GPS_date_plus8_str=datestr(JulianDate_datetime+elapsed_time_in_seconds/86400+3600*8/86400,'yyyy-mm-dd HH:MM:SS');
%disp([GPS_date_plus8_str,' (GPS +08:00)'])
%
legend([GPS_date_plus8_str,' (GPS +08:00)'],'Location','EastOutside')
%----------------------------------------------------------------------

%--
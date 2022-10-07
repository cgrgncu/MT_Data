%**************************************************************************
%   Name: plot_edi_site_pt_v20220910a.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20220908a
%   Description: 讀取資料夾中所有WinGLink輸出的「*.edi」檔案文字內容至Matlab結
%                構體中並對照清單後以完整名稱繪製地圖上的相位張量
%**************************************************************************
function PhaseTensor=get_WinGLink_mat_phase_tensor(Input_WinGLink_edi_mat)
    %----------------------------------------------------------------------
    % 使用提醒
    if ~exist('Input_WinGLink_edi_mat','var')
        disp('Usage:')
        disp('Input_WinGLink_edi_mat=read_WinGLink_edi_to_mat([''xxx.edi'']);')
        disp('PhaseTensor=get_WinGLink_mat_phase_tensor(Input_WinGLink_edi_mat);')        
        return
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    % clear;clc;close all
    % Input_WinGLink_edi_mat=read_WinGLink_edi_to_mat(['xxx.edi']);
    %--
%     Input_WinGLink_edi_mat
    % 將EDI資料整理為計算PhaseTensor所需格式
    Input_FREQ_vector=Input_WinGLink_edi_mat.FREQ.Data;
    Input_ZXXR_vector=Input_WinGLink_edi_mat.ZXXR.Data;
    Input_ZXXI_vector=Input_WinGLink_edi_mat.ZXXI.Data;
    Input_ZXYR_vector=Input_WinGLink_edi_mat.ZXYR.Data;
    Input_ZXYI_vector=Input_WinGLink_edi_mat.ZXYI.Data;
    Input_ZYXR_vector=Input_WinGLink_edi_mat.ZYXR.Data;
    Input_ZYXI_vector=Input_WinGLink_edi_mat.ZYXI.Data;
    Input_ZYYR_vector=Input_WinGLink_edi_mat.ZYYR.Data;
    Input_ZYYI_vector=Input_WinGLink_edi_mat.ZYYI.Data;
    %--------------------------------------------------------------------------
    % 開始計算Phase Tensor
    % disp('開始計算...')% Debug用
    %--
    % 準備單位資訊
    PhaseTensor.FREQ.Header={'Frequency[Hz]'};
    PhaseTensor.Phi_xx.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.Phi_xy.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.Phi_yx.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.Phi_yy.Header={'PhaseTensor[Unitless]'};
    PhaseTensor.trace.Header={'trace[Unitless]'};
    PhaseTensor.skew.Header={'skew[Unitless]'};
    PhaseTensor.determinant.Header={'determinant[Unitless]'};
    PhaseTensor.beta_in_radians.Header={'beta[rad]'};
    PhaseTensor.beta_in_degrees.Header={'beta[degrees]'};
    PhaseTensor.phimax.Header={'phimax[Unitless]'};
    PhaseTensor.phimax_angle_in_degrees.Header={'phimax_angle[degrees]'};
    PhaseTensor.phimin.Header={'phimin[Unitless]'};
    PhaseTensor.phimin_angle_in_degrees.Header={'phimax_angle[degrees]'};
    PhaseTensor.alpha_in_radians.Header={'alpha[rad]'};
    PhaseTensor.alpha_in_degrees.Header={'alpha[degrees]'};
    PhaseTensor.azimuth_in_radians.Header={'azimuth[rad]'};
    PhaseTensor.azimuth_in_degrees.Header={'azimuth[degrees]'};
    %--
    % 迴圈法計算阻抗張量(效率較差，不過計算蠻簡單的，目前評估不需要優化)
    for i_FREQ_index=1:length(Input_FREQ_vector)
        %disp(['目標頻率(',num2str(i_FREQ_index),'/',num2str(length(Input_FREQ_vector)),'):',num2str(Input_FREQ_vector(i_FREQ_index)),'[Hz]'])
        %----------------------------------------------------------------------
        % PhaseTensor.FREQ.Header={'Frequency[Hz]'};
        PhaseTensor.FREQ.Data(i_FREQ_index,1)=Input_FREQ_vector(i_FREQ_index);
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(9) eq(10)
        temp_Xxx=Input_ZXXR_vector(i_FREQ_index);
        temp_Xxy=Input_ZXYR_vector(i_FREQ_index);
        temp_Xyx=Input_ZYXR_vector(i_FREQ_index);
        temp_Xyy=Input_ZYYR_vector(i_FREQ_index);
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(12) eq(13)
        temp_Yxx=Input_ZXXI_vector(i_FREQ_index);
        temp_Yxy=Input_ZXYI_vector(i_FREQ_index);
        temp_Yyx=Input_ZYXI_vector(i_FREQ_index);
        temp_Yyy=Input_ZYYI_vector(i_FREQ_index);
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(18)
        temp_denominator=(temp_Xxx*temp_Xyy)-(temp_Xyx*temp_Xxy);
        if temp_denominator==0
            disp('錯誤，無法計算反矩陣!return!')
            return
        end
        temp_Phi_xx=((temp_Xyy*temp_Yxx)-(temp_Xxy*temp_Yyx))/temp_denominator;
        temp_Phi_xy=((temp_Xyy*temp_Yxy)-(temp_Xxy*temp_Yyy))/temp_denominator;
        temp_Phi_yx=((temp_Xxx*temp_Yyx)-(temp_Xyx*temp_Yxx))/temp_denominator;
        temp_Phi_yy=((temp_Xxx*temp_Yyy)-(temp_Xyx*temp_Yxy))/temp_denominator;
        %--
        % PhaseTensor.Phi_xx.Header={'PhaseTensor[Unitless]'};
        PhaseTensor.Phi_xx.Data(i_FREQ_index,1)=temp_Phi_xx;
        % PhaseTensor.Phi_xy.Header={'PhaseTensor[Unitless]'};
        PhaseTensor.Phi_xy.Data(i_FREQ_index,1)=temp_Phi_xy;
        % PhaseTensor.Phi_yx.Header={'PhaseTensor[Unitless]'};
        PhaseTensor.Phi_yx.Data(i_FREQ_index,1)=temp_Phi_yx;
        % PhaseTensor.Phi_yy.Header={'PhaseTensor[Unitless]'};
        PhaseTensor.Phi_yy.Data(i_FREQ_index,1)=temp_Phi_yy;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(22)    
        temp_phase_tensor_invariants_trace=temp_Phi_xx+temp_Phi_yy;
        %--
        % PhaseTensor.trace.Header={'trace[Unitless]'};
        PhaseTensor.trace.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_trace;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(23)    
        temp_phase_tensor_invariants_skew=temp_Phi_xy-temp_Phi_yx;
        %--
        % PhaseTensor.skew.Header={'skew[Unitless]'};
        PhaseTensor.skew.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_skew;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(24)
        temp_phase_tensor_invariants_determinant=(temp_Phi_xx*temp_Phi_yy)-(temp_Phi_xy*temp_Phi_yx);
        %--
        % PhaseTensor.determinant.Header={'determinant[Unitless]'};
        PhaseTensor.determinant.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_determinant;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(25)
        temp_phase_tensor_invariants_beta_in_radians=(0.5*atan2((temp_Phi_xy-temp_Phi_yx),(temp_Phi_xx+temp_Phi_yy)));
        temp_phase_tensor_invariants_beta_in_degrees=temp_phase_tensor_invariants_beta_in_radians/pi*180;
        %--
        % PhaseTensor.beta_in_radians.Header={'beta[rad]'};
        PhaseTensor.beta_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_beta_in_radians;
        %--
        % PhaseTensor.beta_in_degrees.Header={'beta[degrees]'};
        PhaseTensor.beta_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_beta_in_degrees;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(26)
        temp_phase_tensor_invariants_phimax= ...
            0.5*sqrt( (temp_Phi_xx+temp_Phi_yy)^2+(temp_Phi_xy-temp_Phi_yx)^2 )+ ...
            0.5*sqrt( (temp_Phi_xx-temp_Phi_yy)^2+(temp_Phi_xy+temp_Phi_yx)^2 );
        %--
        % PhaseTensor.phimax.Header={'phimax[Unitless]'};
        PhaseTensor.phimax.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimax;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(30)
        temp_phase_tensor_invariants_phimax_angle_in_degrees=atan(temp_phase_tensor_invariants_phimax)*180/pi;
        %--
        % PhaseTensor.phimax_angle_in_degrees.Header={'phimax_angle[degrees]'};
        PhaseTensor.phimax_angle_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimax_angle_in_degrees;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(27)
        temp_phase_tensor_invariants_phimin= ...
            0.5*sqrt( (temp_Phi_xx+temp_Phi_yy)^2+(temp_Phi_xy-temp_Phi_yx)^2 )- ...
            0.5*sqrt( (temp_Phi_xx-temp_Phi_yy)^2+(temp_Phi_xy+temp_Phi_yx)^2 );
        %--
        % PhaseTensor.phimin.Header={'phimin[Unitless]'};
        PhaseTensor.phimin.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimin;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(32)
        temp_phase_tensor_invariants_phimin_angle=atan(temp_phase_tensor_invariants_phimin)*180/pi;
        %--
        % PhaseTensor.phimin_angle_in_degrees.Header={'phimax_angle[degrees]'};
        PhaseTensor.phimin_angle_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimin_angle;
        %----------------------------------------------------------------------
        % PhaseTensor簡介 eq(28)
        temp_phase_tensor_alpha_in_radians=0.5*atan2((temp_Phi_xy+temp_Phi_yx),(temp_Phi_xx-temp_Phi_yy));
        temp_phase_tensor_alpha_in_degrees=temp_phase_tensor_alpha_in_radians/pi*180;
        %--
        % PhaseTensor.alpha_in_radians.Header={'alpha[rad]'};
        PhaseTensor.alpha_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_alpha_in_radians;
        %--
        % PhaseTensor.alpha_in_degrees.Header={'alpha[degrees]'};
        PhaseTensor.alpha_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_alpha_in_degrees;
        %----------------------------------------------------------------------    
        % PhaseTensor簡介 eq(33)
        temp_phase_tensor_ellipse_azimuth_in_radians=temp_phase_tensor_alpha_in_radians-temp_phase_tensor_invariants_beta_in_radians;
        temp_phase_tensor_ellipse_azimuth_in_degrees=temp_phase_tensor_ellipse_azimuth_in_radians/pi*180;
        %--
        % PhaseTensor.azimuth_in_radians.Header={'azimuth[rad]'};
        PhaseTensor.azimuth_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_ellipse_azimuth_in_radians;
        %--
        % PhaseTensor.azimuth_in_degrees.Header={'azimuth[degrees]'};
        PhaseTensor.azimuth_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_ellipse_azimuth_in_degrees;
        %----------------------------------------------------------------------
    end
    %disp('計算完畢!')
end

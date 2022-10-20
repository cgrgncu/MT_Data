%**************************************************************************
%   Name: yeh_export_edi_smoothPT_525x47_R2014b.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221020a
%   Description: ��XHsiupoYeh��ĳ���j�a�q�Ϫk���ƪ��ۦ�i�q��(WxH=525x47)
%                �g�L���եi�Ω�H�UMATLAB����:�uR2014b�v�C
%**************************************************************************
function ExportEdiPNG=yeh_export_edi_smoothPT_525x47_R2014b(varargin)
    %----------------------------------------------------------------------
    Program_Version_str='v20221020a';
    %----------------------------------------------------------------------
    ExportEdiPNG.Error.String='';
    %----------------------------------------------------------------------
    % �ϥδ���
    if nargin==3 
        Input_WinGLinkEdi_filename=varargin{1};
        output_png_path=varargin{2};
        output_png_file_name=varargin{3};
    else    
        disp('--')
        disp(['Program Version: ',Program_Version_str])
        disp('MATLAB Usage:')
        disp('Input_WinGLinkEdi_filename=''xxx.edi'';') 
        disp('output_png_path=''.\Output\'';')
        disp('output_png_file_name=[''yeh_export_edi_smoothPT_525x47_R2014b.png''];')
        disp('ExportEdiPNG=yeh_export_edi_smoothPT_525x47_R2014b(Input_WinGLinkEdi_filename,output_png_path,output_png_file_name);')
        disp('imshow([output_png_path,output_png_file_name])')        
        disp('DOS Usage:')
        disp('yeh_export_edi_smoothPT_525x47_R2014b.exe "./xxx.edi" "./Output/" "yeh_export_edi_smoothPT_525x47_R2014b.png"')   
        disp('Hint:')
        disp('Please make sure the "temp" folder is empty or not exist!"')           
        ExportEdiPNG.Error.String='�Ш̷Өϥλ����ާ@���{��...';
        disp('--')
        return
    end   
    %----------------------------------------------------------------------    
%==========================================================================
    %----------------------------------------------------------------------
    % �]��MTALAB�C�Ӫ�����ø�Ϥ����i�঳�t���A�i��y����X���`�C
    % �ھ�https://en.wikipedia.org/wiki/MATLAB����T
    % MATLAB R2014b�_�A�ĥηs�@�N��ø�Ϥ����A�i�䴩�w����ܥdø�ϥ\��A�w�]�}�ҡC
    % ���j��n�D�D���������w����ܥd�s�b�A�G������������ܥd�X�ʲ��`�����p�U�L�k��
    % �ζi���\��A�H�P��ø�Ϥ��Ӭ��[�C
    % ���{�������\��ݶi��j�q�վ�~��ۮeR2014b�H�᪺�����C
    %--
    % �o�̭���Ȧ����չL�������i�B��C
    MATLAB_Version=version;
    if strcmp(MATLAB_Version,'8.4.0.150421 (R2014b)')
        disp('����:���T�B��bMATLAB R2014b����...')
        %MATLAB_Version_str='R2014b'; 
    else
        disp('���~:�����ճq�L��MATLAB����,return!')
        ExportEdiPNG.Error.String='���~:�����ճq�L��MATLAB����,return!';
        return
    end
    %--
    % ø�Ϥ����ۮe�ʳB�z...
    disp('����:���b�ϥηs��ø�Ϥ���...')
    opengl_information=opengl('data');
    if opengl_information.Software==1
        disp('���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!')
        ExportEdiPNG.Error.String='���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!';
        return
    else
        disp('����:���b�ϥ�Hareware OpenGL�A�ϥεw����ܥd�A���\�i��ø�ϥ\��...')
    end
    %----------------------------------------------------------------------
%==========================================================================
    % �إ߿�X��Ƨ�
    if ~(exist(output_png_path,'dir')==7)
        mkdir(output_png_path)
    end
    % �إ߼Ȧs��Ƨ�
    if ~(exist('temp','dir')==7)
        mkdir('temp')
    end
%==========================================================================
    % Ū��WinGLink_edi�ɮ�
    Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat(Input_WinGLinkEdi_filename);
    if isfield(Input_WinGLinkEdi_mat, 'Error')
        if ~isempty(Input_WinGLinkEdi_mat.Error)
            disp(Input_WinGLinkEdi_mat.Error.String)
            ExportEdiPNG.Error.String=Input_WinGLinkEdi_mat.Error.String;
            return
        end
    end
%========================================================================== 
%==========================================================================
    % �p��ۦ�i�q
    PhaseTensor=get_WinGLink_mat_phase_tensor(Input_WinGLinkEdi_mat);    
%==========================================================================
%==========================================================================
    disp('===========================================================')
    %----------------------------------------------------------------------
    % �ۦ�i�q����(���`ø��):    
    disp('ø�s�ۦ�i�q�����Ϥ�...�}�l!')
	%----------------------------------------------------------------------
    % �ؼп�X���Ϥ��e��=600[px]�A���ר̷ӵ���ҷL�աC
    % �H��ĳ���W�v�d��ιq���v�d��A���q���v�����Ϥ��ؤo��600x225�C
    %----------------------------------------------------------------------
    % �إ�figure����
    figure_handle=figure('Visible','off','Position',[0,0,676,676]);
    movegui(figure_handle,'center')  
%     set(figure_handle,'Visible','on')
    set(figure_handle,'PaperUnits','points')
    %--
    % �]�w�I��
    set(figure_handle,'color',[1,1,1])
    %----------------------------------------------------------------------
    % �ť�ø�ϡC�վ�r��P��Ƴ�쵥��ҡC
    axes_handle=gca;
    set(axes_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(axes_handle,'DataAspectRatio',[1,1,1]);%[1,1,1]->��Ƴ�쵥��ҡA�o�ӳ]�w����PlotBoxAspectRatio�N�۰ʱj��p��F�C
    set(axes_handle,'Units','pixels')
    %----------------------------------------------------------------------
    % �]�w�ťծy�Ш�סC�]�w�y�жb�W�U���C
my_xlim_vector=[-4,5];
    set(axes_handle,'Xlim',my_xlim_vector)
    set(axes_handle,'XTick',[])
    set(axes_handle,'XDir','reverse')
    %--
my_ylim_vector=[-0.4,0.4];
    set(axes_handle,'Ylim',my_ylim_vector)
    set(axes_handle,'YTick',[])   
    %----------------------------------------------------------------------
    % �[�ءC
    box on    
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------    
    % �]�w����u
    grid on
    %----------------------------------------------------------------------     
    % �]�w�ۭqcolorbar�C��
    mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
    colormap(mycolormap);
    set(gca,'Clim',[-10,10])  
    %----------------------------------------------------------------------
    set(figure_handle,'PaperPosition',[0,0,507,507])%676x676
    figure_handle.GraphicsSmoothing='off';
    axes_handle.LineWidth=0.45;
    drawnow
    print(figure_handle,'-opengl','-dpng','-r0','temp/temp_pt_opengl_empty_676x676.png')
    %--
    % ��Ʀ��u
    hold on
    scale_facter=1/225;
    scale_facter_str='1/225';
    for i=1:length(PhaseTensor.FREQ.Data)        
        temp_ellipse_XYpoints=yeh_get_ellipse_XYpoints( ...
            PhaseTensor.phimax_angle_in_degrees.Data(i)*scale_facter, ...
            PhaseTensor.phimin_angle_in_degrees.Data(i)*scale_facter, ...
            PhaseTensor.azimuth_in_degrees.Data(i));        
        patch(temp_ellipse_XYpoints(:,1)+log10(PhaseTensor.FREQ.Data(i)),temp_ellipse_XYpoints(:,2),PhaseTensor.beta_in_degrees.Data(i));
        plot(log10(PhaseTensor.FREQ.Data(i)),0,'o','MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',1);hold on
    end
    %--
    figure_handle.GraphicsSmoothing='on';
    axes_handle.Visible='off';
    drawnow
    print(figure_handle,'-opengl','-dpng','-r0','temp/temp_pt_opengl_smooth_676x676.png')
    %----------------------------------------------------------------------
    close(figure_handle);
	%----------------------------------------------------------------------
    disp('ø�s�ۦ�i�q�����Ϥ�...����!')
    disp('===========================================================')
    disp('===========================================================')
    disp('����ۦ�i�q�����Ϥ��ÿ�XPNG...�}�l!')    
    pt_image_data=imread('temp/temp_pt_opengl_empty_676x676.png');
    disp(['�ؤo: WxH=',num2str(length(pt_image_data(1,:,1))),'x',num2str(length(pt_image_data(:,1,1))),'[px]'])
    pt_image_data_R=pt_image_data(:,:,1);
    pt_image_data_G=pt_image_data(:,:,2);
    pt_image_data_B=pt_image_data(:,:,3);
    pt_image_data_black=double(pt_image_data_R~=255)+double(pt_image_data_G~=255)+double(pt_image_data_B~=255);
    [image_height,image_width]=size(pt_image_data_black);
    each_vertical_line_RGB_sum=sum(pt_image_data_black,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(pt_image_data_black,2);% �ƶq����image_height
	[temp_sorted_array,temp_sorted_array_index]=sort(each_vertical_line_RGB_sum,'descend');
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#1=',num2str(temp_sorted_array_index(1))])
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#2=',num2str(temp_sorted_array_index(2))])
    disp(['�����V��Ӯy�жb�u���Z(�N�O�y�Юت��e��)=',num2str(1+abs(temp_sorted_array_index(1)-temp_sorted_array_index(2)))])
    vertical_line_index=sort([temp_sorted_array_index(1),temp_sorted_array_index(2)]);
    [temp_sorted_array,temp_sorted_array_index]=sort(each_horizontal_line_RGB_sum,'descend');
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#1=',num2str(temp_sorted_array_index(1))])
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#2=',num2str(temp_sorted_array_index(2))])
    disp(['�����V��Ӯy�жb�u���Z(�N�O�y�Юت�����)=',num2str(1+abs(temp_sorted_array_index(1)-temp_sorted_array_index(2)))])
    horizontal_line_index=sort([temp_sorted_array_index(1),temp_sorted_array_index(2)]);    
    %--
%     pt_image_data=(pt_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
%     imwrite(pt_image_data,'output_pt_opengl_empty_525x47.png'); 
	pt_image_data=imread('temp/temp_pt_opengl_smooth_676x676.png');
    pt_image_data=(pt_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
%     imwrite(pt_image_data,'output_pt_opengl_smooth_525x47.png'); 
    imwrite(pt_image_data,[output_png_path,output_png_file_name])
    %--
    delete('temp/temp_pt_opengl_empty_676x676.png');
    delete('temp/temp_pt_opengl_smooth_676x676.png');
	%--
    disp('����ۦ�i�q�����Ϥ��ÿ�XPNG...����!')
    disp('����: ���ӷ|�ݨ�525�P47...')
    disp('===========================================================')
%==========================================================================
end

%%
%**************************************************************************
%   Name: read_WinGLink_edi_to_mat.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20210208a
%   Description: Ū��WinGLink��X���u*.edi�v�ɮפ�r���e��Matlab���c�餤�C
%                ���c��Ӹ`�Ш��{���X�C
%**************************************************************************
function WinGLinkEdiFile=read_WinGLink_edi_to_mat(Input_WinGLinkEdiFileEdiFileName)
    %----------------------------------------------------------------------
    % �ϥδ���
    if ~exist('Input_WinGLinkEdiFileEdiFileName','var')
        disp('Usage:')
        disp('WinGLinkEdiFile=read_WinGLink_edi_to_mat(''xxxx.edi'')')        
        return
    end
    %----------------------------------------------------------------------
%clear;clc;close all
    WinGLinkEdiFile.EdiFileName=Input_WinGLinkEdiFileEdiFileName;
    %======================================================================
    % �N�ɮפ��e�������J��O���餤 �}�l
    %disp(['Ū���ɮ�: ',WinGLinkEdiFile.EdiFileName])
    %----------------------------------------------------------------------
    % �}���ɮ�
    f1=fopen(WinGLinkEdiFile.EdiFileName,'rt');
    if (f1<0)
        %disp('�}���ɮץ���!return!')
        WinGLinkEdiFile.Error.String='�}���ɮץ���!return!';
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
    % �����ɮ�
    fclose(f1);
    %----------------------------------------------------------------------
    %disp(['�����ɮ�: ',WinGLinkEdiFile.EdiFileName])
    % �N�ɮפ��e�������J��O���餤 ����
    %======================================================================
    %----------------------------------------------------------------------
    % �uHEAD�v
    temp_target_key='>HEAD';
    for i=1:length(WinGLinkEdiFile.RawCell(:,1))
        temp_edi_key=(WinGLinkEdiFile.RawCell{i,1}.Key);
        if strncmp(temp_target_key,temp_edi_key,length(temp_target_key))
            disp(['���:',temp_target_key])
            temp_edi_value_cell=WinGLinkEdiFile.RawCell{i,1}.Value;            
            break
        end
    end
    for i=1:length(temp_edi_value_cell)
        temp_strfind_index=strfind(temp_edi_value_cell{i},'=');
        % �ˬd
        if (isempty(temp_strfind_index))    
            %disp('ĵ�i!�S�����u=�v!���L���Ѽ�!')
        else
            %disp('���u=�v!')
            %--
            % ���XSubKey
            temp_SubKey_str=temp_edi_value_cell{i}(1:temp_strfind_index(1)-1);
            % ���XSubValue
            temp_SubValue_str=temp_edi_value_cell{i}(temp_strfind_index(1)+1:end);
            if temp_SubValue_str(1)=='"' && temp_SubValue_str(end)=='"'
                temp_SubValue_str=strrep(temp_SubValue_str,'"','');
            end
            eval(['WinGLinkEdiFile.HEAD.',temp_SubKey_str,'.String=temp_SubValue_str;'])
            if strncmp(temp_SubKey_str,'LAT',length('LAT'))
                disp(['LAT=',temp_SubValue_str])
                % ���X�r��
                temp_split_str_cell=str2double(regexp(temp_SubValue_str, ':', 'split'));
                WinGLinkEdiFile.HEAD.LAT.Data_Header={'Latitude[degrees]'};
                WinGLinkEdiFile.HEAD.LAT.Data=temp_split_str_cell(1)+temp_split_str_cell(2)/60+temp_split_str_cell(3)/3600;                
                disp(['Latitude[degrees]=',sprintf('%.6f',WinGLinkEdiFile.HEAD.LAT.Data)])
            elseif strncmp(temp_SubKey_str,'LONG',length('LONG'))
                disp(['LONG=',temp_SubValue_str])
                % ���X�r��
                temp_split_str_cell=str2double(regexp(temp_SubValue_str, ':', 'split'));
                WinGLinkEdiFile.HEAD.LONG.Data_Header={'Longitude[degrees]'};
                WinGLinkEdiFile.HEAD.LONG.Data=temp_split_str_cell(1)+temp_split_str_cell(2)/60+temp_split_str_cell(3)/3600;                
                disp(['Latitude[degrees]=',sprintf('%.6f',WinGLinkEdiFile.HEAD.LONG.Data)])
            end
        end
    end
    %----------------------------------------------------------------------
    % �ݭn����ƶ��زM��
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
    % �̧Ǿ�z
    for i_need_Key_list_cell=1:length(need_Key_list_cell(:,1))
        temp_target_key=need_Key_list_cell{i_need_Key_list_cell,1};
        temp_data_header=need_Key_list_cell{i_need_Key_list_cell,2};
         % �Ѽƾ�z
        for i=1:length(WinGLinkEdiFile.RawCell(:,1))
            temp_edi_key=(WinGLinkEdiFile.RawCell{i,1}.Key);
            if strncmp(['>',temp_target_key],temp_edi_key,length(['>',temp_target_key]))
                disp(['���:',['>',temp_target_key]])
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

%%
%**************************************************************************
%   Name: get_WinGLink_mat_phase_tensor.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221019a
%   Description: Ū��WinGLink��X���u*.edi�v�ɮרíp���ۦ�i�q
%**************************************************************************
function PhaseTensor=get_WinGLink_mat_phase_tensor(Input_WinGLink_edi_mat)
    %----------------------------------------------------------------------
    Program_Version_str='v20221019a';
    %----------------------------------------------------------------------
    PhaseTensor.Error.String='';
    %----------------------------------------------------------------------
    % �ϥδ���
    if ~exist('Input_WinGLink_edi_mat','var')
        disp('--')
        disp(['Program Version: ',Program_Version_str])
        disp('MATLAB Usage:')    
        disp('Usage:')
        disp('Input_WinGLink_edi_mat=read_WinGLink_edi_to_mat([''xxx.edi'']);')
        disp('PhaseTensor=get_WinGLink_mat_phase_tensor(Input_WinGLink_edi_mat);')   
        disp('--')
        PhaseTensor.Error.String='�Ш̷Өϥλ����ާ@���{��...';
        return
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    % �NEDI��ƾ�z���p��PhaseTensor�һݮ榡
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
    % �}�l�p��Phase Tensor
    % disp('�}�l�p��...')% Debug��
    %--
    % �ǳƳ���T
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
    % �j��k�p����ܱi�q(�Ĳv���t�A���L�p���Z²�檺�A�ثe�������ݭn�u��)
    for i_FREQ_index=1:length(Input_FREQ_vector)
        %disp(['�ؼ��W�v(',num2str(i_FREQ_index),'/',num2str(length(Input_FREQ_vector)),'):',num2str(Input_FREQ_vector(i_FREQ_index)),'[Hz]'])
        %----------------------------------------------------------------------
        % PhaseTensor.FREQ.Header={'Frequency[Hz]'};
        PhaseTensor.FREQ.Data(i_FREQ_index,1)=Input_FREQ_vector(i_FREQ_index);
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(9) eq(10)
        temp_Xxx=Input_ZXXR_vector(i_FREQ_index);
        temp_Xxy=Input_ZXYR_vector(i_FREQ_index);
        temp_Xyx=Input_ZYXR_vector(i_FREQ_index);
        temp_Xyy=Input_ZYYR_vector(i_FREQ_index);
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(12) eq(13)
        temp_Yxx=Input_ZXXI_vector(i_FREQ_index);
        temp_Yxy=Input_ZXYI_vector(i_FREQ_index);
        temp_Yyx=Input_ZYXI_vector(i_FREQ_index);
        temp_Yyy=Input_ZYYI_vector(i_FREQ_index);
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(18)
        temp_denominator=(temp_Xxx*temp_Xyy)-(temp_Xyx*temp_Xxy);
        if temp_denominator==0
            disp('���~�A�L�k�p��ϯx�}!return!')
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
        % PhaseTensor²�� eq(22)    
        temp_phase_tensor_invariants_trace=temp_Phi_xx+temp_Phi_yy;
        %--
        % PhaseTensor.trace.Header={'trace[Unitless]'};
        PhaseTensor.trace.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_trace;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(23)    
        temp_phase_tensor_invariants_skew=temp_Phi_xy-temp_Phi_yx;
        %--
        % PhaseTensor.skew.Header={'skew[Unitless]'};
        PhaseTensor.skew.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_skew;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(24)
        temp_phase_tensor_invariants_determinant=(temp_Phi_xx*temp_Phi_yy)-(temp_Phi_xy*temp_Phi_yx);
        %--
        % PhaseTensor.determinant.Header={'determinant[Unitless]'};
        PhaseTensor.determinant.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_determinant;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(25)
        temp_phase_tensor_invariants_beta_in_radians=(0.5*atan2((temp_Phi_xy-temp_Phi_yx),(temp_Phi_xx+temp_Phi_yy)));
        temp_phase_tensor_invariants_beta_in_degrees=temp_phase_tensor_invariants_beta_in_radians/pi*180;
        %--
        % PhaseTensor.beta_in_radians.Header={'beta[rad]'};
        PhaseTensor.beta_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_beta_in_radians;
        %--
        % PhaseTensor.beta_in_degrees.Header={'beta[degrees]'};
        PhaseTensor.beta_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_beta_in_degrees;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(26)
        temp_phase_tensor_invariants_phimax= ...
            0.5*sqrt( (temp_Phi_xx+temp_Phi_yy)^2+(temp_Phi_xy-temp_Phi_yx)^2 )+ ...
            0.5*sqrt( (temp_Phi_xx-temp_Phi_yy)^2+(temp_Phi_xy+temp_Phi_yx)^2 );
        %--
        % PhaseTensor.phimax.Header={'phimax[Unitless]'};
        PhaseTensor.phimax.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimax;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(30)
        temp_phase_tensor_invariants_phimax_angle_in_degrees=atan(temp_phase_tensor_invariants_phimax)*180/pi;
        %--
        % PhaseTensor.phimax_angle_in_degrees.Header={'phimax_angle[degrees]'};
        PhaseTensor.phimax_angle_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimax_angle_in_degrees;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(27)
        temp_phase_tensor_invariants_phimin= ...
            0.5*sqrt( (temp_Phi_xx+temp_Phi_yy)^2+(temp_Phi_xy-temp_Phi_yx)^2 )- ...
            0.5*sqrt( (temp_Phi_xx-temp_Phi_yy)^2+(temp_Phi_xy+temp_Phi_yx)^2 );
        %--
        % PhaseTensor.phimin.Header={'phimin[Unitless]'};
        PhaseTensor.phimin.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimin;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(32)
        temp_phase_tensor_invariants_phimin_angle=atan(temp_phase_tensor_invariants_phimin)*180/pi;
        %--
        % PhaseTensor.phimin_angle_in_degrees.Header={'phimax_angle[degrees]'};
        PhaseTensor.phimin_angle_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_invariants_phimin_angle;
        %----------------------------------------------------------------------
        % PhaseTensor²�� eq(28)
        temp_phase_tensor_alpha_in_radians=0.5*atan2((temp_Phi_xy+temp_Phi_yx),(temp_Phi_xx-temp_Phi_yy));
        temp_phase_tensor_alpha_in_degrees=temp_phase_tensor_alpha_in_radians/pi*180;
        %--
        % PhaseTensor.alpha_in_radians.Header={'alpha[rad]'};
        PhaseTensor.alpha_in_radians.Data(i_FREQ_index,1)=temp_phase_tensor_alpha_in_radians;
        %--
        % PhaseTensor.alpha_in_degrees.Header={'alpha[degrees]'};
        PhaseTensor.alpha_in_degrees.Data(i_FREQ_index,1)=temp_phase_tensor_alpha_in_degrees;
        %----------------------------------------------------------------------    
        % PhaseTensor²�� eq(33)
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
    %disp('�p�⧹��!')
end

%%
function ellipse_XYpoints=yeh_get_ellipse_XYpoints(semi_major_a,semi_minor_b,theta_in_degrees)
% �ϥΤ覡:
% ellipse_XYpoints=yeh_get_ellipse_XYpoints(10,1,80);
% plot(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2));axis equal
% patch(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2),0);axis equal

% �b���ba(semi_major_a)
% �b�u�bb(semi_minor_b)
% ���ਤ��[��](theta_in_degrees)

theta_in_radians=theta_in_degrees/180*pi;

temp_radians_vector=(0:0.1:2*pi+0.1)';

rotate_array=[cos(-theta_in_radians) -sin(-theta_in_radians)
            sin(-theta_in_radians) cos(-theta_in_radians)];
        
ellipse_XYpoints=[semi_major_a*cos(temp_radians_vector),semi_minor_b*sin(temp_radians_vector)]*rotate_array;


% plot(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2));axis equal
% patch(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2),0);axis equal
end

%%
% ----------------------------------------------------------------------- %
% FUNCTION "customcolormap" defines a customized colobar given the        %
% positions and the colors that are going to generate the gradients.      %
%                                                                         %
%   Input parameters:                                                     %
%       - positions:    Vector of positions, from 0 to 1. Note that the   %
%                       first position must be 0, and the last one must   %
%                       be 1.                                             %
%       - colors:       Colors to place in each position. This parameter  %
%                       can be specified as a RGB matrix (n_colors x 3), or
%                       as a cell vector, containing HTML values.         %
%                       For instance: {'#ffffff','#ff0000','#000000'} is  %
%                       equivalent to [1 1 1; 1 0 0; 0 0 0].              %
%       - m:            (Optional) Number of points (recommended: m > 64).%
%                                                                         %
%   Output variables:                                                     %
%       - J:            Colormap in RGB values (dimensions [mx3]).        %
% ----------------------------------------------------------------------- %
%   Example of use:                                                       %
%       J = customcolormap([0 0.5 1], {'#ffffff','#ff0000','#000000'});   %
%       colorbar; colormap(J);                                            %
% ----------------------------------------------------------------------- %
%   Versions:                                                             %
%       - v1.0.:    (19/11/2018) Original script.                         %
% ----------------------------------------------------------------------- %
%       - Author:   V?ctor Mart?nez-Cagigal                               %
%       - Date:     19/11/2018                                            %
%       - Version:  1.0                                                   %
%       - E-mail:   vicmarcag (at) gmail (dot) com                        %
%                                                                         %
%       Biomedical Engineering Group (University of Valladolid), Spain    %
% ----------------------------------------------------------------------- %
function J = customcolormap(positions, colors, m)
    % Error detection and defaults
    if nargin < 3
       f = get(gcf);
       if isempty(f)
          m = size(get(groot,'DefaultFigureColormap'),1);
       else
          m = size(f.Colormap,1);
       end
    end
    if ~isnumeric(m), error('Parameter m must be numeric.'); end
    if nargin < 2, error('Not enough parameters.'); end
    
    if iscell(colors)
        colors = colors(:);
        n_colors = length(colors);
        for i = 1:n_colors
            temp = colors{i};
            if ~ischar(temp)
                error(['Colors must be specified in HEX format (e.g., #FFFFFF).' ...
                ' Type "help colorbar" for further information']);
            elseif ~strcmp(temp(1),'#')
                error(['Character # is missing if %s.' ...
                ' Type "help colorbar" for further information'], temp);
            elseif length(temp)~=7
                error(['Not a valid color format: %s (use this format: #FFFFFF).' ...
                ' Type "help colorbar" for further information'], temp);
            end
        end
    elseif ismatrix(colors)
        n_colors = size(colors);
        if length(n_colors) ~= 2
            error(['RGB colors must be a 2D matrix.' ...
                ' Type "help colorbar" for further information']);
        elseif n_colors(2) ~= 3
            error(['RGB colors matrix must have 3 columns.' ...
                ' Type "help colorbar" for further information']);
        elseif min(colors(:))<0 || max(colors(:))>255
            error(['RGB colors matrix values must range from 0 to 255.' ...
                ' Type "help colorbar" for further information']);
        end
    else
        error(['Colors must be a cell vector or a matrix of RGB values.' ...
            ' Type "help colorbar" for further information']);
    end
    if ~isvector(positions)
        error(['Positions must be specified as a vector.' ...
            ' Type "help colorbar" for further information']);
    elseif min(positions)<0 || max(positions)>1
        error(['Positions must range from 0 to 1 in an ascending order.' ...
            ' Type "help colorbar" for further information']);
    elseif length(positions) ~= length(unique(positions))
        error(['Check the positions vector, there are some duplicates.' ...
            ' Type "help colorbar" for further information']);
    else
        positions = sort(positions, 'ascend');
        if positions(1)~=0
            error(['The first positions must be 0.' ...
            ' Type "help colorbar" for further information']);
        elseif positions(length(positions))~=1
            error(['The last positions must be 1.' ...
            ' Type "help colorbar" for further information']);
        elseif length(positions) ~= n_colors
            error(['The number of positions does not match the number of colors.' ...
            ' Type "help colorbar" for further information']);
        end
    end
    % Convert HEX colors into RGB colors if required
    if iscell(colors)
        hex_colors = colors;
        colors = NaN(n_colors,3);
        for i = 1:n_colors
            colors(i,:) = hex2rgb(hex_colors{i});
        end
    end
    
    % Compute positions along the samples
    color_samples = round((m-1)*positions)+1;
    % Make the gradients among colors
    J = zeros(m,3);
    J(color_samples,:) = colors;
    diff_samples = diff(color_samples)-1;
    for d = 1:1:length(diff_samples)
        if diff_samples(d)~=0
            color1 = colors(d,:);
            color2 = colors(d+1,:);
            G = zeros(diff_samples(d),3);
            for idx_rgb = 1:3
                g = linspace(color1(idx_rgb), color2(idx_rgb), diff_samples(d)+2);
                g([1, length(g)]) = [];
                G(:,idx_rgb) = g';
            end
            J(color_samples(d)+1:color_samples(d+1)-1,:) = G;
        end
    end
    J = flipud(J);
end
% Function that converts an HEX string (format: #FFFFFF) to the
% corresponding RGB color
function rgb = hex2rgb(hexString)
	if size(hexString,2) ~= 7
		error('Not a color! %s', hexString);
	else
		r = double(hex2dec(hexString(2:3)))/255;
		g = double(hex2dec(hexString(4:5)))/255;
		b = double(hex2dec(hexString(6:7)))/255;
		rgb = [r, g, b];
	end
end

%%
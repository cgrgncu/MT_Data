%**************************************************************************
%   Name: yeh_export_edi_rhophs_B_300x410.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221020a
%   Description: ��XHsiupoYeh��ĳ���j�a�q�Ϫk���q���v�άۦ��(WxH=300x410)
%                B�Ҧ��Uø�sXX�BYY�����C
%                �g�L���եi�Ω�H�UMATLAB����:�uR2009a�v�B�uR2014a�v�C
%**************************************************************************
function ExportEdiPNG=yeh_export_edi_rhophs_B_300x410(varargin)
    %----------------------------------------------------------------------
    Program_Version_str='v20221020a';
    %----------------------------------------------------------------------
    ExportEdiPNG.FileFullName=[];
    ExportEdiPNG.Error.String='';
    %----------------------------------------------------------------------
    % �ϥδ���
    if nargin==4 
        Input_WinGLinkEdi_filename=varargin{1};
        Input_title=varargin{2};
        output_png_path=varargin{3};
        output_png_file_name=varargin{4};
    else          
        disp('--')
        disp(['Program Version: ',Program_Version_str])
        disp('MATLAB Usage:')    
        disp('Input_WinGLinkEdi_filename=''xxx.edi'';') 
        disp('Input_title=''DEMO001 Rot: 0.0 [�X]'';')
        disp('output_png_path=''.\Output\'';')
        disp('output_png_file_name=[''yeh_export_edi_rhophs_B_300x410_v20221020a.png''];')
        disp('ExportEdiPNG=yeh_export_edi_rhophs_B_300x410(Input_WinGLinkEdi_filename,Input_title,output_png_path,output_png_file_name);')
        disp('imshow([output_png_path,output_png_file_name])')  
        disp('--')
        disp('DOS Usage:')
        disp('yeh_export_edi_rhophs_B_300x410.exe "./xxx.edi" "DEMO001 Rot: 0.0 [�X]" "./Output/" "yeh_export_edi_rhophs_B_300x410_v20221020a.png"')   
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
    if strcmp(MATLAB_Version,'7.8.0.347 (R2009a)')
        disp('����:���T�B��bMATLAB R2009a����...')
        %MATLAB_Version_str='R2009a';
    elseif strcmp(MATLAB_Version,'8.3.0.532 (R2014a)')
        disp('����:���T�B��bMATLAB R2014a����...')
        %MATLAB_Version_str='R2014a'; 
    else
        disp('���~:�����ճq�L��MATLAB����,return!')
        ExportEdiPNG.Error.String='���~:�����ճq�L��MATLAB����,return!';
        return
    end
    %----------------------------------------------------------------------
    % MATLAB���ͪ�ø�ϵ���figure�u����e�ù��ؤo�p�A�ثe�u���\�ù��ѪR�פj��720p��
    % ���p�U(�B�ù��S������A�e��=1280�A����=720)�B�榹�{���A�H�K���~�o�͡C
    %--
    % ���o�ù����ؤo�AMATLAB���ت��n�����I���D�A���JAVA����ơC
    eval('current_screen_width=java.awt.Toolkit.getDefaultToolkit().getScreenSize().getWidth();')
    eval('current_screen_height=java.awt.Toolkit.getDefaultToolkit().getScreenSize().getHeight();')
    disp(['����:�ù��ѪR��(WxH)=',num2str(current_screen_width),'x',num2str(current_screen_height)])
    if current_screen_width>=1280 && current_screen_height>=720
        disp('����:�ѪR�פj��720p�A�i���`����!')
    else
        disp('���~:�ѪR�פp��720p�A�i��|�y�����~�A�����\����Creturn!')
        ExportEdiPNG.Error.String='���~:�ѪR�פp��720p�A�i��|�y�����~�A�����\����Creturn!';
        return
    end
    disp('--')
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
    disp('===========================================================')
    %----------------------------------------------------------------------
    % ���q���v����(���`ø��):    
    disp('ø�s�q���v�����Ϥ�...�}�l!')
	%----------------------------------------------------------------------
    % �ؼп�X���Ϥ��e��=600[px]�A���ר̷ӵ���ҷL�աC
    % �H��ĳ���W�v�d��ιq���v�d��A���q���v�����Ϥ��ؤo��600x490�C
    %----------------------------------------------------------------------
    % �إ�figure����
    figure_handle=figure('Visible','off','Position',[0,0,512,512]);
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
my_ylim_vector=[-2,5];
    set(axes_handle,'Ylim',my_ylim_vector)
    set(axes_handle,'YTick',[])   
    %----------------------------------------------------------------------
    % �[�ءC
    box on    
    %----------------------------------------------------------------------
    % ��Ʀ��u
    hold on
errorbar_handle_03=errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),log10(Input_WinGLinkEdi_mat.RHOXX.Data),Input_WinGLinkEdi_mat.RHOXX_ERR.Data,'.','color',[0,0.5,0]);
errorbar_handle_04=errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),log10(Input_WinGLinkEdi_mat.RHOYY.Data),Input_WinGLinkEdi_mat.RHOYY_ERR.Data,'.','color',[140/255,60/255,140/255]);
    %----------------------------------------------------------------------
    % �]�w���D
    title_handle=title(Input_title);
    set(title_handle,'Interpreter','none')
    set(title_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal'); 
    %----------------------------------------------------------------------
    % �]�wylabel
    ylabel_handle=ylabel('App.Res [10^x \Omegam]');
    set(ylabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    %----------------------------------------------------------------------
% �]�wXTick
set(axes_handle,'Xlim',my_xlim_vector)
set(axes_handle,'XTick',[my_xlim_vector(1):my_xlim_vector(2)])
%--------------------------------------------------------------------------
% �]�wYTick
set(axes_handle,'Ylim',my_ylim_vector)
set(axes_handle,'YTick',[my_ylim_vector(1):my_ylim_vector(2)])   
    %----------------------------------------------------------------------    
    % �]�w����u
    grid on
    %----------------------------------------------------------------------  
    % �]�w�ϻ�
    legend_handle=legend('XX','YY','Location','SouthOutside');
    set(legend_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(legend_handle,'Orientation','horizontal') 
    set(legend_handle,'Units','pixels')    
    set(legend_handle,'box','off')
    %--    
set(legend_handle,'PlotBoxAspectRatio',[100,20,1])
    %----------------------------------------------------------------------
    set(figure_handle,'PaperPosition',[0,0,959.5,539.5])%1280x720=720p
%     print(figure_handle,'-painters','-dpng','-r0','temp\temp_rho_all_1280x720.png')
    set(title_handle,'Visible','off')
    set(ylabel_handle,'Visible','off')
    set(legend_handle,'box','on')
    set(legend_handle,'Visible','off')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_rho_1280x720.png')
    %--    
    set(errorbar_handle_03,'Visible','off')
    set(errorbar_handle_04,'Visible','off')
    set(axes_handle,'XColor','w')
    set(axes_handle,'YColor','w')
    set(title_handle,'Visible','on')
    set(title_handle,'EdgeColor','r')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_title_box_on_1280x720.png')
    set(title_handle,'EdgeColor','w')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_title_box_off_1280x720.png')
    %--
    set(title_handle,'Visible','off')
    set(ylabel_handle,'Visible','on')
    set(ylabel_handle,'Color','k')
    set(ylabel_handle,'EdgeColor','r')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_ylabel_box_on_1280x720.png')
    set(ylabel_handle,'EdgeColor','w')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_ylabel_box_off_1280x720.png')
    %--
    set(ylabel_handle,'Visible','off')
    set(legend_handle,'Visible','on')
    set(legend_handle,'EdgeColor','r')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_legend_box_on_1280x720.png')
    set(legend_handle,'box','off')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_legend_box_off_1280x720.png')
    %----------------------------------------------------------------------      
    close(figure_handle);
    %----------------------------------------------------------------------
    disp('ø�s�q���v�����Ϥ�...����!')
    disp('===========================================================')
    disp('===========================================================')
    disp('����q���v�����Ϥ�...�}�l!')    
    rho_image_data=imread('temp/temp_rho_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(rho_image_data(1,:,1))),'x',num2str(length(rho_image_data(:,1,1))),'[px]'])
    rho_image_data_R=rho_image_data(:,:,1);
    rho_image_data_G=rho_image_data(:,:,2);
    rho_image_data_B=rho_image_data(:,:,3);
    rho_image_data_black=double(rho_image_data_R==0)+double(rho_image_data_G==0)+double(rho_image_data_B==0);
    [image_height,image_width]=size(rho_image_data_black);
    each_vertical_line_RGB_sum=sum(rho_image_data_black,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(rho_image_data_black,2);% �ƶq����image_height
	[temp_sorted_array,temp_sorted_array_index]=sort(each_vertical_line_RGB_sum,'descend');
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#1=',num2str(temp_sorted_array_index(1))])
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#2=',num2str(temp_sorted_array_index(2))])
    disp(['�����V��Ӯy�жb�u���Z(�N�O�y�Юت��e��)=',num2str(1+abs(temp_sorted_array_index(1)-temp_sorted_array_index(2)))])
    [temp_sorted_array,temp_sorted_array_index]=sort(each_horizontal_line_RGB_sum,'descend');
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#1=',num2str(temp_sorted_array_index(1))])
    disp(['�i��O�����V�y�жb�u�Ҧb���ޭ�#2=',num2str(temp_sorted_array_index(2))])
    disp(['�����V��Ӯy�жb�u���Z(�N�O�y�Юت�����)=',num2str(1+abs(temp_sorted_array_index(1)-temp_sorted_array_index(2)))])
    disp('����q���v�����Ϥ�...����!')
    disp('����: ���ӷ|�ݨ�225�P176...')
%     imshow(rho_image_data(345:520,167:391,:));% �����y�жb
%     return
    disp('===========================================================')
    disp('===========================================================')
    disp('������D�����Ϥ�...�}�l!')    
    title_image_data=imread('temp/temp_title_box_on_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(title_image_data(1,:,1))),'x',num2str(length(title_image_data(:,1,1))),'[px]'])
    title_image_data_R=title_image_data(:,:,1);
    title_image_data_G=title_image_data(:,:,2);
    title_image_data_B=title_image_data(:,:,3);
    title_image_data_red=double(double(title_image_data_R==255)+double(title_image_data_G==0)+double(title_image_data_B==0)==3);
    [image_height,image_width]=size(title_image_data_red);
    each_vertical_line_RGB_sum=sum(title_image_data_red,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(title_image_data_red,2);% �ƶq����image_height
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
    disp('������D�����Ϥ�...����!')
    title_image_data=imread('temp/temp_title_box_off_1280x720.png');
    title_image_data=(title_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
    disp('===========================================================')
    disp('===========================================================')
    disp('����Y�b��r�����Ϥ�...�}�l!')    
    ylabel_image_data=imread('temp/temp_ylabel_box_on_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(ylabel_image_data(1,:,1))),'x',num2str(length(ylabel_image_data(:,1,1))),'[px]'])
    ylabel_image_data_R=ylabel_image_data(:,:,1);
    ylabel_image_data_G=ylabel_image_data(:,:,2);
    ylabel_image_data_B=ylabel_image_data(:,:,3);
    ylabel_image_data_red=double(double(ylabel_image_data_R==255)+double(ylabel_image_data_G==0)+double(ylabel_image_data_B==0)==3);
    [image_height,image_width]=size(ylabel_image_data_red);
    each_vertical_line_RGB_sum=sum(ylabel_image_data_red,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(ylabel_image_data_red,2);% �ƶq����image_height
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
    disp('����Y�b��r�����Ϥ�...����!')
    ylabel_image_data=imread('temp/temp_ylabel_box_off_1280x720.png');
    ylabel_image_data=(ylabel_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
    disp('===========================================================')
    disp('===========================================================')
    disp('����ϻ������Ϥ�...�}�l!')    
    legend_image_data=imread('temp/temp_legend_box_on_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(legend_image_data(1,:,1))),'x',num2str(length(legend_image_data(:,1,1))),'[px]'])
    legend_image_data_R=legend_image_data(:,:,1);
    legend_image_data_G=legend_image_data(:,:,2);
    legend_image_data_B=legend_image_data(:,:,3);
    legend_image_data_red=double(double(legend_image_data_R==255)+double(legend_image_data_G==0)+double(legend_image_data_B==0)==3);
    [image_height,image_width]=size(legend_image_data_red);
    each_vertical_line_RGB_sum=sum(legend_image_data_red,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(legend_image_data_red,2);% �ƶq����image_height
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
    disp('����ϻ������Ϥ�...����!')
    legend_image_data=imread('temp/temp_legend_box_off_1280x720.png');
    legend_image_data=(legend_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
    disp('===========================================================')
    disp('===========================================================')
    disp('���չq���v�����Ϥ�...�}�l!')   
    rho_image_data=imread('temp/temp_rho_1280x720.png');
%     disp(['�ؤo: WxH=',num2str(length(rho_image_data(1,:,1))),'x',num2str(length(rho_image_data(:,1,1))),'[px]'])
%     imshow(rho_image_data(345:520,167:391,:));% �����y�жb
box_padding_top_px=34;
box_padding_bottom_px=43;
box_padding_left_px=47;
box_padding_right_px=28;
    rho_image_data=(rho_image_data(345-box_padding_top_px:520+box_padding_bottom_px,167-box_padding_left_px:391+box_padding_right_px,:));
    %--
    % �N���D�л\�W�h
    [rho_image_data_H,rho_image_data_W]=size(rho_image_data(:,:,1));
    [title_image_data_H,title_image_data_W]=size(title_image_data(:,:,1));
    x_shift=box_padding_left_px+floor((rho_image_data_W-box_padding_left_px-box_padding_right_px-title_image_data_W)/2)-1;
    y_shift=15-4;%15��n�ئb�y�жb�u�W�A15-4�b�w�]��m
    rho_image_data([1:title_image_data_H]+y_shift,[1:title_image_data_W]+x_shift,:)=title_image_data(:,:,:);
    %--
    % �NY�b�y���л\�W�h
    [rho_image_data_H,rho_image_data_W]=size(rho_image_data(:,:,1));
    [ylabel_image_data_H,ylabel_image_data_W]=size(ylabel_image_data(:,:,1));
    x_shift=24-22;%24��n�ئb�y�жb�u�W�A24-20�b�w�]��m
    y_shift=box_padding_top_px+floor((rho_image_data_H-box_padding_top_px-box_padding_bottom_px-ylabel_image_data_H)/2)+2;
    rho_image_data([1:ylabel_image_data_H]+y_shift,[1:ylabel_image_data_W]+x_shift,:)=ylabel_image_data(:,:,:);
    %--
    % �N�ϻ��л\�W�h
    [rho_image_data_H,rho_image_data_W]=size(rho_image_data(:,:,1));
    [legend_image_data_H,legend_image_data_W]=size(legend_image_data(:,:,1));
    x_shift=box_padding_left_px+floor((rho_image_data_W-box_padding_left_px-box_padding_right_px-legend_image_data_W)/2)-1;
    y_shift=209+20;%209��n�ئb�y�жb�u�W
    rho_image_data([1:legend_image_data_H]+y_shift,[1:legend_image_data_W]+x_shift,:)=legend_image_data(:,:,:);
    %--
    % ��X�ɮ�
    imwrite(rho_image_data,'temp/temp_rho_new_300x253.png');    
%     imshow('temp/temp_rho_new_600x485.png');   
    %--
    delete('temp/temp_rho_1280x720.png');
    delete('temp/temp_title_box_on_1280x720.png');
    delete('temp/temp_title_box_off_1280x720.png');
    delete('temp/temp_ylabel_box_on_1280x720.png');
    delete('temp/temp_ylabel_box_off_1280x720.png');
    delete('temp/temp_legend_box_on_1280x720.png');
    delete('temp/temp_legend_box_off_1280x720.png');
    disp('���չq���v�����Ϥ�...����!') 
    disp('===========================================================')
%==========================================================================
%==========================================================================
    disp('===========================================================')
    %----------------------------------------------------------------------
    % �ۦ쳡��(���`ø��):    
    disp('ø�s�ۦ쳡���Ϥ�...�}�l!')
	%----------------------------------------------------------------------
    % �ؼп�X���Ϥ��e��=600[px]�A���ר̷ӵ���ҷL�աC
    % �H��ĳ���W�v�d��ιq���v�d��A���q���v�����Ϥ��ؤo��600x260�C
    %----------------------------------------------------------------------
    % �إ�figure����
    figure_handle=figure('Visible','off','Position',[0,0,290,290]);
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
    set(axes_handle,'DataAspectRatio',[1,90,1]);%[1,1,1]->��Ƴ�쵥��ҡA�o�ӳ]�w����PlotBoxAspectRatio�N�۰ʱj��p��F�C
    set(axes_handle,'Units','pixels')
    %----------------------------------------------------------------------
    % �]�w�ťծy�Ш�סC�]�w�y�жb�W�U���C
my_xlim_vector=[-4,5];
    set(axes_handle,'Xlim',my_xlim_vector)
    set(axes_handle,'XTick',[])
    set(axes_handle,'XDir','reverse')
    %--
my_ylim_vector=[-180,180];
    set(axes_handle,'Ylim',my_ylim_vector)
    set(axes_handle,'YTick',[])   
    %----------------------------------------------------------------------
    % �[�ءC
    box on    
    %----------------------------------------------------------------------
    % ��Ʀ��u
    hold on
errorbar_handle_03=errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),Input_WinGLinkEdi_mat.PHSXX.Data,Input_WinGLinkEdi_mat.PHSXX_ERR.Data,'.','color',[0,0.5,0]);
errorbar_handle_04=errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),Input_WinGLinkEdi_mat.PHSYY.Data,Input_WinGLinkEdi_mat.PHSYY_ERR.Data,'.','color',[140/255,60/255,140/255]);
    %----------------------------------------------------------------------
    % �]�wylabel
    ylabel_handle=ylabel('Phase [�X]');
    set(ylabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    %----------------------------------------------------------------------
% �]�wXTick
set(axes_handle,'Xlim',my_xlim_vector)
set(axes_handle,'XTick',[my_xlim_vector(1):my_xlim_vector(2)])
%--------------------------------------------------------------------------
% �]�wYTick
set(axes_handle,'Ylim',my_ylim_vector)
set(axes_handle,'YTick',[my_ylim_vector(1):45:my_ylim_vector(2)])  
    %----------------------------------------------------------------------    
    % �]�w����u
    grid on
    %----------------------------------------------------------------------     
    set(figure_handle,'PaperPosition',[0,0,959.5,539.5])%1280x720=720p
%     print(figure_handle,'-painters','-dpng','-r0','temp/temp_phs_all_1280x720.png')
    %--
    set(ylabel_handle,'Visible','off')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_phs_1280x720.png')
    %--        
	set(errorbar_handle_03,'Visible','off')
    set(errorbar_handle_04,'Visible','off')
    set(axes_handle,'XColor','w')
    set(axes_handle,'YColor','w')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_ylabel_box_on_1280x720.png')
    set(ylabel_handle,'Visible','on')    
    set(ylabel_handle,'EdgeColor','r')
    set(ylabel_handle,'Color','k')    
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_ylabel_box_on_1280x720.png')
    set(ylabel_handle,'EdgeColor','w')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_ylabel_box_off_1280x720.png') 
    % �]�wxlabel
    set(ylabel_handle,'Visible','off') 
    xlabel_handle=xlabel('Frequency [10^x Hz]');
    set(xlabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(xlabel_handle,'Visible','on')    
    set(xlabel_handle,'EdgeColor','r')
    set(xlabel_handle,'Color','k')    
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_xlabel_box_on_1280x720.png')
    set(xlabel_handle,'EdgeColor','w')
    print(figure_handle,'-painters','-dpng','-r0','temp/temp_xlabel_box_off_1280x720.png') 
    set(xlabel_handle,'Visible','off')
    %----------------------------------------------------------------------
    close(figure_handle);
    %----------------------------------------------------------------------
    disp('ø�s�ۦ쳡���Ϥ�...����!')
    disp('===========================================================')
    disp('===========================================================')
    disp('����ۦ쳡���Ϥ�...�}�l!')    
    phs_image_data=imread('temp/temp_phs_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(phs_image_data(1,:,1))),'x',num2str(length(phs_image_data(:,1,1))),'[px]'])
    phs_image_data_R=phs_image_data(:,:,1);
    phs_image_data_G=phs_image_data(:,:,2);
    phs_image_data_B=phs_image_data(:,:,3);
    phs_image_data_black=double(phs_image_data_R==0)+double(phs_image_data_G==0)+double(phs_image_data_B==0);
    [image_height,image_width]=size(phs_image_data_black);
    each_vertical_line_RGB_sum=sum(phs_image_data_black,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(phs_image_data_black,2);% �ƶq����image_height
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
    disp('����ۦ쳡���Ϥ�...����!')
    disp('����: ���ӷ|�ݨ�225�P100...')
%     imshow(phs_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
%     return
    disp('===========================================================')
    disp('===========================================================')
    disp('����Y�b��r�����Ϥ�...�}�l!')    
    ylabel_image_data=imread('temp/temp_ylabel_box_on_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(ylabel_image_data(1,:,1))),'x',num2str(length(ylabel_image_data(:,1,1))),'[px]'])
    ylabel_image_data_R=ylabel_image_data(:,:,1);
    ylabel_image_data_G=ylabel_image_data(:,:,2);
    ylabel_image_data_B=ylabel_image_data(:,:,3);
    ylabel_image_data_red=double(double(ylabel_image_data_R==255)+double(ylabel_image_data_G==0)+double(ylabel_image_data_B==0)==3);
    [image_height,image_width]=size(ylabel_image_data_red);
    each_vertical_line_RGB_sum=sum(ylabel_image_data_red,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(ylabel_image_data_red,2);% �ƶq����image_height
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
    disp('����Y�b��r�����Ϥ�...����!')
    ylabel_image_data=imread('temp/temp_ylabel_box_off_1280x720.png');
    ylabel_image_data=(ylabel_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
    disp('===========================================================')
    disp('===========================================================')
    disp('����X�b��r�����Ϥ�...�}�l!')    
    xlabel_image_data=imread('temp/temp_xlabel_box_on_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(xlabel_image_data(1,:,1))),'x',num2str(length(xlabel_image_data(:,1,1))),'[px]'])
    xlabel_image_data_R=xlabel_image_data(:,:,1);
    xlabel_image_data_G=xlabel_image_data(:,:,2);
    xlabel_image_data_B=xlabel_image_data(:,:,3);
    xlabel_image_data_red=double(double(xlabel_image_data_R==255)+double(xlabel_image_data_G==0)+double(xlabel_image_data_B==0)==3);
    [image_height,image_width]=size(xlabel_image_data_red);
    each_vertical_line_RGB_sum=sum(xlabel_image_data_red,1);% �ƶq����image_width
    each_horizontal_line_RGB_sum=sum(xlabel_image_data_red,2);% �ƶq����image_height
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
    disp('����X�b��r�����Ϥ�...����!')
    xlabel_image_data=imread('temp/temp_xlabel_box_off_1280x720.png');
    xlabel_image_data=(xlabel_image_data(horizontal_line_index(1):horizontal_line_index(2),vertical_line_index(1):vertical_line_index(2),:));% �����y�жb
    disp('===========================================================')
    disp('===========================================================')
    disp('���լۦ쳡���Ϥ�...�}�l!')   
    phs_image_data=imread('temp/temp_phs_1280x720.png');
    disp(['�ؤo: WxH=',num2str(length(phs_image_data(1,:,1))),'x',num2str(length(phs_image_data(:,1,1))),'[px]'])
%     imshow(phs_image_data(521:620,39:263,:));% �����y�жb
box_padding_top_px=5;
box_padding_bottom_px=52;
box_padding_left_px=47;
box_padding_right_px=28;
    phs_image_data=(phs_image_data(521-box_padding_top_px:620+box_padding_bottom_px,39-38:263+box_padding_right_px,:));
    [phs_image_data_H,phs_image_data_W]=size(phs_image_data(:,:,1));
    % �զ⩳��
    temp_image_data=uint8(ones(157,300,3)*255);
    % �л\
    x_shift=box_padding_left_px-38;
    y_shift=0;
    temp_image_data([1:phs_image_data_H]+y_shift,[1:phs_image_data_W]+x_shift,:)=phs_image_data(:,:,:);
    phs_image_data=temp_image_data;
    %--
    % �NY�b�y���л\�W�h
    [phs_image_data_H,phs_image_data_W]=size(phs_image_data(:,:,1));
    [ylabel_image_data_H,ylabel_image_data_W]=size(ylabel_image_data(:,:,1));
    x_shift=24-22;%24��n�ئb�y�жb�u�W�A24-20�b�w�]��m
    y_shift=box_padding_top_px+floor((phs_image_data_H-box_padding_top_px-box_padding_bottom_px-ylabel_image_data_H)/2)+2;
    phs_image_data([1:ylabel_image_data_H]+y_shift,[1:ylabel_image_data_W]+x_shift,:)=ylabel_image_data(:,:,:);
	%--
    % �NX�b�y���л\�W�h
    [phs_image_data_H,phs_image_data_W]=size(phs_image_data(:,:,1));
    [xlabel_image_data_H,xlabel_image_data_W]=size(xlabel_image_data(:,:,1));
    x_shift=box_padding_left_px+floor((phs_image_data_W-box_padding_left_px-box_padding_right_px-xlabel_image_data_W)/2)-1;
    y_shift=104+18;%104��n�ئb�y�жb�u�W
    phs_image_data([1:xlabel_image_data_H]+y_shift,[1:xlabel_image_data_W]+x_shift,:)=xlabel_image_data(:,:,:);
    %--    
    % ��X�ɮ�
    imwrite(phs_image_data,'temp/temp_phs_new_300x157.png');    
%     imshow('temp/temp_phs_new_300x157.png');   
    %--
    delete('temp/temp_phs_1280x720.png');
    delete('temp/temp_ylabel_box_on_1280x720.png');
    delete('temp/temp_ylabel_box_off_1280x720.png');
    delete('temp/temp_xlabel_box_on_1280x720.png');
    delete('temp/temp_xlabel_box_off_1280x720.png');
    disp('���լۦ쳡���Ϥ�...����!') 
    disp('===========================================================')	
%==========================================================================    
%==========================================================================
    disp('===========================================================')	
    disp('��X�ؼйϤ�...�}�l') 
    % �̷ӥؼвզX�Ϥ����X
    rho_image_data=imread('temp/temp_rho_new_300x253.png');
    phs_image_data=imread('temp/temp_phs_new_300x157.png');
    all_image_data=[rho_image_data;phs_image_data];
    imwrite(all_image_data,[output_png_path,output_png_file_name]); 
    %--
    delete('temp/temp_rho_new_300x253.png');
    delete('temp/temp_phs_new_300x157.png');
    disp('��X�ؼйϤ�...����!') 
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
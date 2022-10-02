%**************************************************************************
%   Name: yeh_export_edi_rhophsxy_300x480.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221002a
%   Description: ��XHsiupoYeh��ĳ���j�a�q�Ϫk���q���v�άۦ��(WxH=300x480)
%                �g�L���եi�Ω�H�UMATLAB����:�uR2009a�v�B�uR2014a�v�B
%               �uR2014b�v�C
%**************************************************************************
function ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name)
    %----------------------------------------------------------------------
    ExportEdiPNG.FileFullName=[];
    ExportEdiPNG.Error.String='';
    %----------------------------------------------------------------------
    % �ϥδ���
    if ~exist('Input_WinGLinkEdi_mat','var') || ...
            ~exist('Input_title','var') || ...
            ~exist('output_png_path','var') || ...
            ~exist('output_png_file_name','var')            
        disp('Usage:')
        disp('Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat([''xxx.edi'']);') 
        disp('Input_title=''DEMO001 Rot: 0.0 [�X]'';') 
        disp('output_png_path=''.\Output\'';')
        disp('output_png_file_name=[''yeh_export_edi_rhophsxy_300x480_v20221001a.png''];')
        disp('ExportEdiPNG=yeh_export_edi_rhophsxy_300x480(Input_WinGLinkEdi_mat,Input_title,output_png_path,output_png_file_name);')
        disp('imshow(ExportEdiPNG.FileFullName)')        
        ExportEdiPNG.Error.String='�Ш̷Өϥλ����ާ@���{��...';
        return
    end
    %----------------------------------------------------------------------
    %==========================================================================
    %--------------------------------------------------------------------------
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
    elseif strcmp(MATLAB_Version,'8.4.0.150421 (R2014b)')
        disp('����:���T�B��bMATLAB R2014b����...')
        %MATLAB_Version_str='R2014b'; 
    else
        disp('���~:�����ճq�L��MATLAB����,return!')
        ExportEdiPNG.Error.String='���~:�����ճq�L��MATLAB����,return!';
        return
    end
    %--
    % ø�Ϥ����ۮe�ʳB�z...
    if verLessThan('matlab', '8.4.0.150421')
        disp('����:���b�ϥ��ª�ø�Ϥ���...')
    else
        disp('����:���b�ϥηs��ø�Ϥ���...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!')
            ExportEdiPNG.Error.String='���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!';
            return
        else
            disp('����:���b�ϥ�Hareware OpenGL�A�ϥεw����ܥd�A���\�i��ø�ϥ\��...')
        end
    end
    %--------------------------------------------------------------------------
    % MATLAB���ͪ�ø�ϵ���figure�u����e�ù��ؤo�p�A�ثe�u���\�ù��ѪR�פj��720p��
    % ���p�U(�B�ù��S������A�e��=1280�A����=720)�B�榹�{���A�H�K���~�o�͡C
        %--
        % �ϥΪ�figure�ؤo�ȩw��500x500�A�]�N�O�C�Ӥp�����Ϥ��̤j���W�L500x500�C
        % �o�����}�o����������[��Debug�C
            figure_max_width=500;%[px]
            figure_max_height=500;%[px]
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
    %--------------------------------------------------------------------------
    %==========================================================================
%==========================================================================

%==========================================================================
    disp('===========================================================')
%--------------------------------------------------------------------------
% ���q���v����:    
    disp('ø�s�q���v�����Ϥ�...�}�l!')
    disp('-----------------------------------------------------------')
%--------------------------------------------------------------------------
% �ؼп�X���Ϥ��e��=300[px]�A���ר̷ӵ���ҷL�աC
% �H��ĳ���W�v�d��ιq���v�d��A���q���v�����Ϥ��ؤo��300x255�C
% 
main_axes_with=225;%300*0.75
    %----------------------------------------------------------------------
    % �إ߹w�]���ť�figure����
    figure_handle=figure('Visible','off','Position',[0,0,figure_max_width,figure_max_height]);
    movegui(figure_handle,'center')  
    %--
    % �]�w�I��
    set(figure_handle,'color',[1,1,1])
    %--
    % ø�Ϥ����ۮe�ʳB�z...
    if verLessThan('matlab', '8.4.0.150421')
        disp('����:���b�ϥ��ª�ø�Ϥ���...')
    else
        disp('����:���b�ϥηs��ø�Ϥ���...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!')
            ExportEdiPNG.Error.String='���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!';
            return
        else
            disp('����:���b�ϥ�Hareware OpenGL�A�ϥεw����ܥd�A���\�i��ø�ϥ\��...')
        end
        disp('�����ϧΥ��Ƥƥ\��A�ϵe������...')
        figure_handle.GraphicsSmoothing='off';
    end    
    %----------------------------------------------------------------------
    % �ť�ø�ϡC�վ�r��P��Ƴ�쵥��ҡC
    axes_handle=gca;
    set(axes_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(axes_handle,'DataAspectRatio',[1,1,1]);%[1,1,1]->��Ƴ�쵥��ҡA�o�ӳ]�w����PlotBoxAspectRatio�N�۰ʱj��p��F�C
    %--
    % ø�Ϥ����ۮe�ʳB�z...
    if verLessThan('matlab', '8.4.0.150421')
        disp('����:���b�ϥ��ª�ø�Ϥ���...')
    else
        disp('����:���b�ϥηs��ø�Ϥ���...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!')
            ExportEdiPNG.Error.String='���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!';
            return
        else
            disp('����:���b�ϥ�Hareware OpenGL�A�ϥεw����ܥd�A���\�i��ø�ϥ\��...')
        end
        disp('�����y�жb��r���Ƥƥ\��A�ϵe������...')
        axes_handle.FontSmoothing='off';
        % figure���i�������p�U�A��u���e�ױ��p�@�Ǥ~�|���`�A��]����...
        if strcmp(figure_handle.Visible,'off')
            axes_handle.LineWidth=0.4;
        end
    end    
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
    % �]�w�ťռ��D
    % ��ʳ]�w�Ltitle����m�A�N���|�]�۰ʽվ�Ӽv�T���Ӯy�жb����m
    title_handle=title('');
    set(title_handle,'Interpreter','none')
    set(title_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_title_xyz=get(title_handle,'Position');
    % �G�N��ʱNtitle��m��z�ȼW�[�@�I�I�A�o�ӹ�2D�Ϫ��e���X�G�S�v�T�C
    set(title_handle,'Position',[temp_title_xyz(1),temp_title_xyz(2),temp_title_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % �]�w�ť�xlabel
    % ��ʳ]�w�Lxlabel����m�A�N���|�]�۰ʽվ�Ӽv�T���Ӯy�жb����m
    xlabel_handle=xlabel('');
    set(xlabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_xlabel_xyz=get(xlabel_handle,'Position');
    % �G�N��ʱNxlabel��m��z�ȼW�[�@�I�I�A�o�ӹ�2D�Ϫ��e���X�G�S�v�T�C
    set(xlabel_handle,'Position',[temp_xlabel_xyz(1),temp_xlabel_xyz(2),temp_xlabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % �]�w�ť�ylabel
    % ��ʳ]�w�Lylabel����m�A�N���|�d���Ӯy�жb���d��
    ylabel_handle=ylabel('');
    set(ylabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_ylabel_xyz=get(ylabel_handle,'Position');
    % �G�N��ʱNylabel��m��z�ȼW�[�@�I�I�A�o�ӹ�2D�Ϫ��e���X�G�S�v�T�C
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % �[�ءC
    box on    
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    % �վ�ۭqPosition�A�Ϯy�жb�̷өһݤؤo���T�a�X�{�b�e�����C
    set(axes_handle,'Units','pixels')
    set(axes_handle,'Position',[100,100,main_axes_with,figure_max_height])
    %--
    % �^�������������
    temp_frame=getframe(figure_handle);
    %--
    % ��X���
    temp_cdata=double(temp_frame.cdata(:,:,1));
    % ��X���k���
    all_horizontal_line_pixel_count=sum(temp_cdata~=255,1);
    find_result=find(all_horizontal_line_pixel_count>=2);
    axes_left_pexel_index=find_result(1);
	disp(['����ɹ������ޭ�=',num2str(axes_left_pexel_index)])
	axes_right_pexel_index=find_result(end);
	disp(['�k��ɹ������ޭ�=',num2str(axes_right_pexel_index)])
	disp(['��������V�¦�ɽu�A�Z��=',num2str(axes_right_pexel_index-axes_left_pexel_index)])
    disp('--')
    % ��X�W�U���
    all_vertical_line_pixel_count=sum(temp_cdata~=255,2);
    find_result=find(all_vertical_line_pixel_count>=2);
    axes_top_pexel_index=find_result(1);
	disp(['�W��ɹ������ޭ�=',num2str(axes_top_pexel_index)])
	axes_bottom_pexel_index=find_result(end);
	disp(['�U��ɹ������ޭ�=',num2str(axes_bottom_pexel_index)])
	disp(['��������V�¦�ɽu�A�Z��=',num2str(axes_bottom_pexel_index-axes_top_pexel_index)])
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
%==========================================================================
%==========================================================================
    % �}�l���`ø��
    %--
    % ��Ʀ��u
    hold on
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),log10(Input_WinGLinkEdi_mat.RHOXY.Data),Input_WinGLinkEdi_mat.RHOXY_ERR.Data,'r.');
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),log10(Input_WinGLinkEdi_mat.RHOYX.Data),Input_WinGLinkEdi_mat.RHOYX_ERR.Data,'b.');
    %--
    %--------------------------------------------------------------------------
    %����D�]�w�^�h
set(title_handle,'String',Input_title)
    %--
    set(title_handle,'Units','pixels')
    temp_title_xyz=get(title_handle,'Position');
% �վ��m��y�жb�W��ɰ�5[px]
set(title_handle,'Position',[temp_title_xyz(1),5+(axes_bottom_pexel_index-axes_top_pexel_index),temp_title_xyz(3)]);
%--------------------------------------------------------------------------
% �]�wXTick
set(axes_handle,'Xlim',my_xlim_vector)
set(axes_handle,'XTick',[my_xlim_vector(1):my_xlim_vector(2)])
%--------------------------------------------------------------------------
% �]�wYTick
set(axes_handle,'Ylim',my_ylim_vector)
set(axes_handle,'YTick',[my_ylim_vector(1):my_ylim_vector(2)])
%--
% �]�wY���D
set(ylabel_handle,'String','App.Res [10^x \Omegam]')
    set(ylabel_handle,'Units','pixels')
    temp_ylabel_xyz=get(ylabel_handle,'Position');
% �]�wx��-10[px]
temp_ylabel_xyz(1)=-18;
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)])
%--------------------------------------------------------------------------
% �]�w����u
grid on
%--------------------------------------------------------------------------
    % �]�w�ϻ�
    legend_handle=legend('XY','YX','Location','SouthOutside');
    set(legend_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    set(legend_handle,'Orientation','horizontal') 
    set(legend_handle,'Units','pixels')
    set(legend_handle,'Box','off')
    %--
    % ø�Ϥ����ۮe�ʳB�z...
    if verLessThan('matlab', '8.4.0.150421')
        disp('����:���b�ϥ��ª�ø�Ϥ���...')
set(legend_handle,'PlotBoxAspectRatio',[100,20,1])
set(legend_handle,'Position',[axes_left_pexel_index+56,4,100,20]);
    else
        disp('����:���b�ϥηs��ø�Ϥ���...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!')
            ExportEdiPNG.Error.String='���~:�����ճq�L��MATLAB����,return!';
            return
        else
            disp('����:���b�ϥ�Hareware OpenGL�A�ϥεw����ܥd�A���\�i��ø�ϥ\��...')
        end
        disp('�����ϻ���r���Ƥƥ\��A�ϵe������...')
        drawnow
        legend_handle.EntryContainer.Children(1).Label.FontSmoothing='off';
        legend_handle.EntryContainer.Children(2).Label.FontSmoothing='off';
legend_handle.ItemTokenSize=[20,18];
set(legend_handle,'Position',[axes_left_pexel_index+58,4,100,20]);
    end
%--------------------------------------------------------------------------
    % �I��
    temp_frame=getframe(figure_handle);
%--
% ��X�Ϥ���box�u�٭n���W�h�ֹ���
box_padding_top_px=34;
box_padding_bottom_px=20;
box_padding_left_px=46;
box_padding_right_px=28;
    % ���X�ؼаϰ�v�����
    disp('���X�ؼаϰ�v�����')
    rho_image_data=temp_frame.cdata(axes_top_pexel_index-box_padding_top_px:axes_bottom_pexel_index+box_padding_bottom_px,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    legend_image_data=temp_frame.cdata(end-24:end,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    rho_image_data=[rho_image_data;legend_image_data];
    disp(['�ؤo: WxH=',num2str(length(rho_image_data(1,:,1))),'x',num2str(length(rho_image_data(:,1,1))),'[px]'])
%--------------------------------------------------------------------------
    close(figure_handle);
%--------------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    disp('ø�s�q���v�����Ϥ�...����!')
    disp('===========================================================')
    % imshow(rho_image_data)
%==========================================================================

%==========================================================================
disp('===========================================================')
%--------------------------------------------------------------------------
% �ۦ쳡��:    
    disp('ø�s�ۦ쳡���Ϥ�...�}�l!')
    disp('-----------------------------------------------------------')
%--------------------------------------------------------------------------
% �ؼп�X���Ϥ��e��=300[px]�A���ר̷ӵ���ҷL�աC
% �H��ĳ���W�v�d��ιq���v�d��A���q���v�����Ϥ��ؤo��300x225�C
% 
main_axes_with=225;%300*0.75
    %----------------------------------------------------------------------
    % �إ߹w�]���ť�figure����
    figure_handle=figure('Visible','off','Position',[0,0,figure_max_width,figure_max_height]);
    movegui(figure_handle,'center')    
    %--
    % �]�w�I��
    set(figure_handle,'color',[1,1,1])
    %--
    % ø�Ϥ����ۮe�ʳB�z...
    if verLessThan('matlab', '8.4.0.150421')
        disp('����:���b�ϥ��ª�ø�Ϥ���...')
    else
        disp('����:���b�ϥηs��ø�Ϥ���...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!')
            ExportEdiPNG.Error.String='���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!';
            return
        else
            disp('����:���b�ϥ�Hareware OpenGL�A�ϥεw����ܥd�A���\�i��ø�ϥ\��...')
        end
        disp('�����ϧΥ��Ƥƥ\��A�ϵe������...')
        figure_handle.GraphicsSmoothing='off';       
    end
    %----------------------------------------------------------------------
    % �ť�ø�ϡC�վ�r��P��Ƴ�쵥��ҡC
    axes_handle=gca;
    set(axes_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    %--
     % ø�Ϥ����ۮe�ʳB�z...
    if verLessThan('matlab', '8.4.0.150421')
        disp('����:���b�ϥ��ª�ø�Ϥ���...')
    else
        disp('����:���b�ϥηs��ø�Ϥ���...')
        opengl_information=opengl('data');
        if opengl_information.Software==1
            disp('���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!')
            ExportEdiPNG.Error.String='���~:���b�ϥ�Software OpenGL�A�����z�S���w����ܥd�Creturn!';
            return
        else
            disp('����:���b�ϥ�Hareware OpenGL�A�ϥεw����ܥd�A���\�i��ø�ϥ\��...')
        end
        disp('�����y�жb��r���Ƥƥ\��A�ϵe������...')
        axes_handle.FontSmoothing='off';
        % figure���i�������p�U�A��u���e�ױ��p�@�Ǥ~�|���`�A��]����...
        if strcmp(figure_handle.Visible,'off')
            axes_handle.LineWidth=0.4;
        end
    end   
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
    % �]�w�ťռ��D
    % ��ʳ]�w�Ltitle����m�A�N���|�]�۰ʽվ�Ӽv�T���Ӯy�жb����m
    title_handle=title('');
    set(title_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_title_xyz=get(title_handle,'Position');
    % �G�N��ʱNtitle��m��z�ȼW�[�@�I�I�A�o�ӹ�2D�Ϫ��e���X�G�S�v�T�C
    set(title_handle,'Position',[temp_title_xyz(1),temp_title_xyz(2),temp_title_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % �]�w�ť�xlabel
    % ��ʳ]�w�Lxlabel����m�A�N���|�]�۰ʽվ�Ӽv�T���Ӯy�жb����m
    xlabel_handle=xlabel('');
    set(xlabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_xlabel_xyz=get(xlabel_handle,'Position');
    % �G�N��ʱNxlabel��m��z�ȼW�[�@�I�I�A�o�ӹ�2D�Ϫ��e���X�G�S�v�T�C
    set(xlabel_handle,'Position',[temp_xlabel_xyz(1),temp_xlabel_xyz(2),temp_xlabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % �]�w�ť�ylabel
    % ��ʳ]�w�Lylabel����m�A�N���|�d���Ӯy�жb���d��
    ylabel_handle=ylabel('');
    set(ylabel_handle,'FontSize',10,'FontName','Calibri','FontWeight','normal');
    temp_ylabel_xyz=get(ylabel_handle,'Position');
    % �G�N��ʱNylabel��m��z�ȼW�[�@�I�I�A�o�ӹ�2D�Ϫ��e���X�G�S�v�T�C
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)+0.001])
    %----------------------------------------------------------------------
    % �[�ءC
    box on    
    %----------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    % �վ�ۭqPosition�A�Ϯy�жb�̷өһݤؤo���T�a�X�{�b�e�����C
    set(axes_handle,'Units','pixels')
set(axes_handle,'Position',[100,100,main_axes_with,165])% 165=main_axes_with*0.75�[�L��    
    %--
    % �^�������������
    temp_frame=getframe(figure_handle);
    %--
    % ��X���
    temp_cdata=double(temp_frame.cdata(:,:,1));
    % ��X���k���
    all_horizontal_line_pixel_count=sum(temp_cdata~=255,1);
    find_result=find(all_horizontal_line_pixel_count>=2);
    axes_left_pexel_index=find_result(1);
	disp(['����ɹ������ޭ�=',num2str(axes_left_pexel_index)])
	axes_right_pexel_index=find_result(end);
	disp(['�k��ɹ������ޭ�=',num2str(axes_right_pexel_index)])
	disp(['��������V�¦�ɽu�A�Z��=',num2str(axes_right_pexel_index-axes_left_pexel_index)])
    disp('--')
    % ��X�W�U���
    all_vertical_line_pixel_count=sum(temp_cdata~=255,2);
    find_result=find(all_vertical_line_pixel_count>=2);
    axes_top_pexel_index=find_result(1);
	disp(['�W��ɹ������ޭ�=',num2str(axes_top_pexel_index)])
	axes_bottom_pexel_index=find_result(end);
	disp(['�U��ɹ������ޭ�=',num2str(axes_bottom_pexel_index)])
	disp(['��������V�¦�ɽu�A�Z��=',num2str(axes_bottom_pexel_index-axes_top_pexel_index)])
    %----------------------------------------------------------------------    
    disp('-----------------------------------------------------------')
%==========================================================================
%==========================================================================
    % �}�l���`ø��
    %--
    % ��Ʀ��u
    hold on
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),Input_WinGLinkEdi_mat.PHSXY.Data,Input_WinGLinkEdi_mat.PHSXY_ERR.Data,'r.');
errorbar(log10(Input_WinGLinkEdi_mat.FREQ.Data),Input_WinGLinkEdi_mat.PHSYX.Data,Input_WinGLinkEdi_mat.PHSYX_ERR.Data,'b.');
%--------------------------------------------------------------------------
% �]�wXTick
set(axes_handle,'Xlim',my_xlim_vector)
set(axes_handle,'XTick',[my_xlim_vector(1):my_xlim_vector(2)])
%--
% �]�wX���D
set(xlabel_handle,'String','Frequency [10^x Hz]')
    set(xlabel_handle,'Units','pixels')
    temp_xlabel_xyz=get(xlabel_handle,'Position');
% �]�wy��-18px
 temp_xlabel_xyz(2)=-18;
    set(xlabel_handle,'Position',[temp_xlabel_xyz(1),temp_xlabel_xyz(2),temp_xlabel_xyz(3)])
%--------------------------------------------------------------------------
% �]�wYTick
set(axes_handle,'Ylim',my_ylim_vector)
set(axes_handle,'YTick',[my_ylim_vector(1):45:my_ylim_vector(2)])
%--
% �]�wY���D
set(ylabel_handle,'String','Phase [�X]')
    set(ylabel_handle,'Units','pixels')
    temp_ylabel_xyz=get(ylabel_handle,'Position');
% �]�wx��-10[px]
temp_ylabel_xyz(1)=-25;
    set(ylabel_handle,'Position',[temp_ylabel_xyz(1),temp_ylabel_xyz(2),temp_ylabel_xyz(3)])
%--------------------------------------------------------------------------
% �]�w����u
grid on
%--------------------------------------------------------------------------
    % �I��
    temp_frame=getframe(figure_handle);
%--
% ��X�Ϥ���box�u�٭n���W�h�ֹ���
box_padding_top_px=4;
box_padding_bottom_px=55;
box_padding_left_px=46;
box_padding_right_px=28;    
    %--
    % ���X�ؼаϰ�v�����
    disp('���X�ؼаϰ�v�����')
    phs_image_data=temp_frame.cdata(axes_top_pexel_index-box_padding_top_px:axes_bottom_pexel_index+box_padding_bottom_px,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    disp(['�ؤo: WxH=',num2str(length(phs_image_data(1,:,1))),'x',num2str(length(phs_image_data(:,1,1))),'[px]'])
   %--------------------------------------------------------------------------
    close(figure_handle);
%--------------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    disp('ø�s�ۦ쳡���Ϥ�...����!')
    disp('===========================================================')
    % imshow(phs_image_data)
%==========================================================================

%==========================================================================
% ��X�ؼаϰ���ɮ�
    disp('===========================================================')
    disp('-----------------------------------------------------------')
    % �إ߿�X��Ƨ�
    if ~(exist(output_png_path,'dir')==7)
        mkdir(output_png_path)
    end
    %--
    all_image_data=[rho_image_data;phs_image_data];
    disp(['�}�l��X����(WxH=',num2str(length(all_image_data(1,:,1))),'x',num2str(length(all_image_data(:,1,1))),')...'])
    ExportEdiPNG.FileFullName=[output_png_path,output_png_file_name];
    disp([output_png_path,output_png_file_name])
	imwrite(all_image_data,[output_png_path,output_png_file_name]);
	disp('��X���ɵ���!')
    disp('-----------------------------------------------------------')
    disp('===========================================================')
%==========================================================================

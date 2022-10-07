%**************************************************************************
%   Name: yeh_export_edi_smoothPT_600x110_R2014b.m 
%   Copyright:  
%   Author: HsiupoYeh 
%   Version: v20221006a
%   Description: ��XHsiupoYeh��ĳ���j�a�q�Ϫk���q���v�άۦ��(WxH=600x110)
%                �g�L���եi�Ω�H�UMATLAB����:�uR2009a�v�B�uR2014a�v�B
%               �uR2014b�v�C
%**************************************************************************
function ExportEdiPNG=yeh_export_edi_smoothPT_600x110_R2014b(varargin)
%----------------------------------------------------------------------
    %----------------------------------------------------------------------
    ExportEdiPNG.FileFullName=[];
    ExportEdiPNG.Error.String='';
    %----------------------------------------------------------------------
    % �ϥδ���
    if nargin==3 
        Input_WinGLinkEdi_filename=varargin{1};
        output_png_path=varargin{2};
        output_png_file_name=varargin{3};
    else          
        disp('MATLAB Usage:')
        disp('Input_WinGLinkEdi_filename=''xxx.edi'';') 
        disp('output_png_path=''.\Output\'';')
        disp('output_png_file_name=[''yeh_export_edi_smoothPT_600x110_R2014b.png''];')
        disp('ExportEdiPNG=yeh_export_edi_smoothPT_600x110_R2014b(Input_WinGLinkEdi_filename,output_png_path,output_png_file_name);')
        disp('imshow(ExportEdiPNG.FileFullName)')        
        disp('DOS Usage:')
        disp('yeh_export_edi_smoothPT_600x110_R2014b.exe "xxx.edi" ".\\Output\\" "yeh_export_edi_smoothPT_600x110_R2014b.png"')   
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
    %--------------------------------------------------------------------------
    % MATLAB���ͪ�ø�ϵ���figure�u����e�ù��ؤo�p�A�ثe�u���\�ù��ѪR�פj��720p��
    % ���p�U(�B�ù��S������A�e��=1280�A����=720)�B�榹�{���A�H�K���~�o�͡C
        %--
        % �ϥΪ�figure�ؤo�ȩw��700x700�A�]�N�O�C�Ӥp�����Ϥ��̤j���W�L800x800�C
        % �o�����}�o����������[��Debug�C
            figure_max_width=700;%[px]
            figure_max_height=700;%[px]
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
    Input_WinGLinkEdi_mat=read_WinGLink_edi_to_mat(Input_WinGLinkEdi_filename);
    if isfield(Input_WinGLinkEdi_mat, 'Error')
        if ~isempty(Input_WinGLinkEdi_mat.Error)
            disp(Input_WinGLinkEdi_mat.Error.String)
            ExportEdiPNG.Error.String=Input_WinGLinkEdi_mat.Error.String;
            return
        end
    end
    %--
    PhaseTensor=get_WinGLink_mat_phase_tensor(Input_WinGLinkEdi_mat);
%==========================================================================
%--------------------------------------------------------------------------
% �ۦ�i�q����:    
    disp('ø�s�ۦ�i�q�����Ϥ�...�}�l!')
    disp('-----------------------------------------------------------')
%--------------------------------------------------------------------------
% �ؼп�X���Ϥ��e��=600[px]�A���ר̷ӵ���ҷL�աC
% �H��ĳ���W�v�d��ιq���v�d��A���q���v�����Ϥ��ؤo��300x255�C
% 
main_axes_with=525;%��ʴ��եX�Ӫ�
    %----------------------------------------------------------------------
    % �إ߹w�]���ť�figure����
    figure_handle=figure('Visible','off','Position',[0,0,figure_max_width,figure_max_height]);
    movegui(figure_handle,'center')  
    %--
    % �]�w�I��
    set(figure_handle,'color',[1,1,1])
    %--
    figure_handle.GraphicsSmoothing='off';  
%     figure_handle.Renderer='painters';
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
my_ylim_vector=[-0.4,0.4];% Y�d��=2���ɭԵe���|��1�A��]�����C�y�L�W�[�@�I�I�d��
    set(axes_handle,'Ylim',my_ylim_vector)
    set(axes_handle,'YTick',[])
    %----------------------------------------------------------------------
    % �]�w�ťռ��D
    % ��ʳ]�w�Ltitle����m�A�N���|�]�۰ʽվ�Ӽv�T���Ӯy�жb����m
    title_handle=title('');
    set(title_handle,'Interpreter','tex')
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
    for i=1:length(PhaseTensor.FREQ.Data)
    scale_facter=1/225;
%     scale_facter_str='1/225';
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
    %--------------------------------------------------------------------------
    %����D�]�w�^�h
% set(title_handle,'String',{['Phase Tensor: semi-major,semi-minor in arctan(\Phi)[�X], scale factor=',scale_facter_str]})
    %--
    set(title_handle,'Units','pixels')
    temp_title_xyz=get(title_handle,'Position');
% �վ��m��y�жb�W��ɰ�5[px]
set(title_handle,'Position',[temp_title_xyz(1),5+(axes_bottom_pexel_index-axes_top_pexel_index),temp_title_xyz(3)]);
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
    % colorbar�A REF:https://www.mathworks.com/matlabcentral/fileexchange/69470-custom-colormap
    mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
    colormap(mycolormap);
    set(gca,'Clim',[-10,10])
%--------------------------------------------------------------------------
% �]�w����u
grid on
%--------------------------------------------------------------------------
% figure_handle.Renderer='opengl';
figure_handle.GraphicsSmoothing='on';  
axes_handle.Visible='off';
%--------------------------------------------------------------------------
    % �I��
    temp_frame=getframe(figure_handle);
%--
% ��X�Ϥ���box�u�٭n���W�h�ֹ���
box_padding_top_px=15;
box_padding_bottom_px=47;
box_padding_left_px=46;
box_padding_right_px=28;
    % ���X�ؼаϰ�v�����
    disp('���X�ؼаϰ�v�����')
    pt_image_data=temp_frame.cdata(axes_top_pexel_index-box_padding_top_px:axes_bottom_pexel_index+box_padding_bottom_px,axes_left_pexel_index-box_padding_left_px:axes_right_pexel_index+box_padding_right_px,:);
    
    disp(['�ؤo: WxH=',num2str(length(pt_image_data(1,:,1))),'x',num2str(length(pt_image_data(:,1,1))),'[px]'])
%--------------------------------------------------------------------------
    close(figure_handle);
%--------------------------------------------------------------------------
    disp('-----------------------------------------------------------')
    disp('ø�s�ۦ�i�q�����Ϥ�...����!')
    disp('===========================================================')
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
    disp(['�}�l��X����(WxH=',num2str(length(pt_image_data(1,:,1))),'x',num2str(length(pt_image_data(:,1,1))),')...'])
    ExportEdiPNG.FileFullName=[output_png_path,output_png_file_name];
    disp([output_png_path,output_png_file_name])
	imwrite(pt_image_data,[output_png_path,output_png_file_name]);
	disp('��X���ɵ���!')
    disp('-----------------------------------------------------------')
    disp('===========================================================')
%==========================================================================

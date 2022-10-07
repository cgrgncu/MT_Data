function ellipse_XYpoints=yeh_get_ellipse_XYpoints(semi_major_a,semi_minor_b,theta_in_degrees)
% 使用方式:
% ellipse_XYpoints=yeh_get_ellipse_XYpoints(10,1,80);
% plot(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2));axis equal
% patch(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2),0);axis equal

% 半長軸a(semi_major_a)
% 半短軸b(semi_minor_b)
% 旋轉角度[度](theta_in_degrees)

theta_in_radians=theta_in_degrees/180*pi;

temp_radians_vector=(0:0.1:2*pi+0.1)';

rotate_array=[cos(-theta_in_radians) -sin(-theta_in_radians)
            sin(-theta_in_radians) cos(-theta_in_radians)];
        
ellipse_XYpoints=[semi_major_a*cos(temp_radians_vector),semi_minor_b*sin(temp_radians_vector)]*rotate_array;


% plot(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2));axis equal
% patch(ellipse_XYpoints(:,1),ellipse_XYpoints(:,2),0);axis equal
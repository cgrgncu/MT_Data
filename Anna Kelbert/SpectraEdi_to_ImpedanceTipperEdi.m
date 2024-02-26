clear;clc;close all

% >SPECTRA 格式介紹:
% 因為EMpower的SPECTRA都固定使用這樣的順序，因此僅考慮下列格式，特色包含:
% 1.不論單站估算還是遠端參考站估算用儲存<7x7>的矩陣。
% 2.頻道順序都固定為Hx、Hy、Hz、Ex、Ey、Rx、Ry
% 3.儲存的值為複數(當然也包含虛部為零的狀況):Hx=a+bi，則共軛複數Hx*=a-bi，取實部範例:Re{Hx*}=a，取虛部範例Im{Hx*}=-b。
% 並以實部虛部的模式儲存資料到矩陣中，注意!經過測試我認為與SEG EDI的建議不同!!請以下表為準:
% [ <HxHx*>     , Im{<HyHx*>} , Im{<HzHx*>} , Im{<ExHx*>} , Im{<EyHx*>} , Im{<RxHx*>} , Im{<RyHx*>} ] 
% [ Re{<HxHy*>} , <HyHy*>     , Im{<HzHy*>} , Im{<ExHy*>} , Im{<EyHy*>} , Im{<RxHy*>} , Im{<RyHy*>} ] 
% [ Re{<HxHz*>} , Re{<HyHz*>} , <HzHz*>     , Im{<ExHz*>} , Im{<EyHz*>} , Im{<RxHz*>} , Im{<RyHz*>} ] 
% [ Re{<HxEx*>} , Re{<HyEx*>} , Re{<HzEx*>} , <ExEx*>     , Im{<EyEx*>} , Im{<RxEx*>} , Im{<RyEx*>} ] 
% [ Re{<HxEy*>} , Re{<HyEy*>} , Re{<HzEy*>} , Re{<ExEy*>} , <EyEy*>     , Im{<RxEy*>} , Im{<RyEy*>} ] 
% [ Re{<HxRx*>} , Re{<HyRx*>} , Re{<HzRx*>} , Re{<ExRx*>} , Re{<EyRx*>} , <RxRx*>     , Im{<RyRx*>} ] 
% [ Re{<HxRy*>} , Re{<HyRy*>} , Re{<HzRy*>} , Re{<ExRy*>} , Re{<EyRy*>} , Re{<RxRy*>} , <RyRy*>     ]
% 
% MATLAB呼叫的索引值，
% [ SPECTRA(1,1), SPECTRA(1,2), SPECTRA(1,3), SPECTRA(1,4), SPECTRA(1,5), SPECTRA(1,6), SPECTRA(1,7)] 
% [ SPECTRA(2,1), SPECTRA(2,2), SPECTRA(2,3), SPECTRA(2,4), SPECTRA(2,5), SPECTRA(2,6), SPECTRA(2,7)] 
% [ SPECTRA(3,1), SPECTRA(3,2), SPECTRA(3,3), SPECTRA(3,4), SPECTRA(3,5), SPECTRA(3,6), SPECTRA(3,7)] 
% [ SPECTRA(4,1), SPECTRA(4,2), SPECTRA(4,3), SPECTRA(4,4), SPECTRA(4,5), SPECTRA(4,6), SPECTRA(4,7)] 
% [ SPECTRA(5,1), SPECTRA(5,2), SPECTRA(5,3), SPECTRA(5,4), SPECTRA(5,5), SPECTRA(5,6), SPECTRA(5,7)] 
% [ SPECTRA(6,1), SPECTRA(6,2), SPECTRA(6,3), SPECTRA(6,4), SPECTRA(6,5), SPECTRA(6,6), SPECTRA(6,7)] 
% [ SPECTRA(7,1), SPECTRA(7,2), SPECTRA(7,3), SPECTRA(7,4), SPECTRA(7,5), SPECTRA(7,6), SPECTRA(7,7)] 
% 

%--
% >SPECTRA  FREQ=2.647059E+02 ROTSPEC=0 AVGT=951456 // 49
%   2.08350E-07  1.01116E-08 -3.61811E-08  3.07892E-06 -3.53832E-05 -7.08584E-11 -5.09665E-09
%   1.17963E-08  7.95196E-07  5.50660E-07  1.04609E-04  2.96508E-05 -8.97159E-09 -2.70813E-09
%  -1.23051E-07 -1.11853E-06  4.69827E-06 -4.01804E-04  2.72364E-05  1.41024E-08  3.73987E-09
%  -1.22661E-07  4.06986E-04 -6.01659E-04  2.54977E-01  3.15094E-02 -4.03668E-06 -5.72060E-06
%  -1.14515E-04 -1.53354E-04  5.85806E-04 -9.42726E-02  1.72809E-01  9.52608E-06  3.90094E-06
%   3.28727E-08  1.17419E-09  2.79083E-08 -5.45569E-06 -4.56792E-06  3.53268E-08 -9.78115E-10
%   7.21901E-09  2.41624E-08 -1.13519E-09  5.37217E-06 -9.18638E-07  8.49919E-09  2.76552E-08

SPECTRA=[
  2.08350E-07  1.01116E-08 -3.61811E-08  3.07892E-06 -3.53832E-05 -7.08584E-11 -5.09665E-09
  1.17963E-08  7.95196E-07  5.50660E-07  1.04609E-04  2.96508E-05 -8.97159E-09 -2.70813E-09
 -1.23051E-07 -1.11853E-06  4.69827E-06 -4.01804E-04  2.72364E-05  1.41024E-08  3.73987E-09
 -1.22661E-07  4.06986E-04 -6.01659E-04  2.54977E-01  3.15094E-02 -4.03668E-06 -5.72060E-06
 -1.14515E-04 -1.53354E-04  5.85806E-04 -9.42726E-02  1.72809E-01  9.52608E-06  3.90094E-06
  3.28727E-08  1.17419E-09  2.79083E-08 -5.45569E-06 -4.56792E-06  3.53268E-08 -9.78115E-10
  7.21901E-09  2.41624E-08 -1.13519E-09  5.37217E-06 -9.18638E-07  8.49919E-09  2.76552E-08
 ];

FREQ=2.647059E+02;
AVGT=1506472;

%--
% 計算要用到的8大矩陣:
% #1: matrix_RTH=[<Rx*Hx>,<Rx*Hy>;
%                 <Ry*Hx>,<Ry*Hy>]
% 
conjRx_Hx=complex(SPECTRA(6,1),-1*(SPECTRA(1,6)));
conjRx_Hy=complex(SPECTRA(6,2),-1*(SPECTRA(2,6)));
conjRy_Hx=complex(SPECTRA(7,1),-1*(SPECTRA(1,7)));
conjRy_Hy=complex(SPECTRA(7,2),-1*(SPECTRA(2,7)));
matrix_RTH=[conjRx_Hx,conjRx_Hy;
            conjRy_Hx,conjRy_Hy];
% 2: matrix_RTR=[<Rx*Rx>,<Rx*Ry>;
%                <Ry*Rx>,<Ry*Ry>]
% 
conjRx_Rx=complex(SPECTRA(6,6),0);
conjRx_Ry=complex(SPECTRA(7,6),(SPECTRA(6,7)));
conjRy_Rx=complex(SPECTRA(7,6),-1*(SPECTRA(6,7)));
conjRy_Ry=complex(SPECTRA(7,7),0);
matrix_RTR=[conjRx_Rx,conjRx_Ry;
            conjRy_Rx,conjRy_Ry];
% 3: matrix_HTR=[<Hx*Rx>,<Hx*Ry>;
%                <Hy*Rx>,<Hy*Ry>]
% 
conjHx_Rx=complex(SPECTRA(6,1),(SPECTRA(1,6)));
conjHx_Ry=complex(SPECTRA(7,1),(SPECTRA(1,7)));
conjHy_Rx=complex(SPECTRA(6,2),(SPECTRA(2,6)));
conjHy_Ry=complex(SPECTRA(7,2),(SPECTRA(2,7)));
matrix_HTR=[conjHx_Rx,conjHx_Ry;
            conjHy_Rx,conjHy_Ry];
% 4: matrix_RTE=[<Rx*Ex>,<Rx*Ey>;
%                <Ry*Ex>,<Ry*Ey>]
% 
conjRx_Ex=complex(SPECTRA(6,4),-1*(SPECTRA(4,6)));
conjRx_Ey=complex(SPECTRA(6,5),-1*(SPECTRA(5,6)));
conjRy_Ex=complex(SPECTRA(7,4),-1*(SPECTRA(4,7)));
conjRy_Ey=complex(SPECTRA(7,5),-1*(SPECTRA(5,7)));
matrix_RTE=[conjRx_Ex,conjRx_Ey;
            conjRy_Ex,conjRy_Ey];     
% 5: matrix_ETE=[<Ex*Ex>,<Ex*Ey>;
%                <Ey*Ex>,<Ey*Ey>]
% 
conjEx_Ex=complex(SPECTRA(4,4),0);
conjEx_Ey=complex(SPECTRA(5,4),(SPECTRA(4,5)));
conjEy_Ex=complex(SPECTRA(5,4),-1*(SPECTRA(4,5)));
conjEy_Ey=complex(SPECTRA(5,5),0);
matrix_ETE=[conjEx_Ex,conjEx_Ey;
            conjEy_Ex,conjEy_Ey];           
% 6: matrix_HTE=[<Hx*Ex>,<Hx*Ey>;
%                <Hy*Ex>,<Hy*Ey>]
% 
conjHx_Ex=complex(SPECTRA(4,1),(SPECTRA(1,4)));
conjHx_Ey=complex(SPECTRA(5,1),(SPECTRA(1,5)));
conjHy_Ex=complex(SPECTRA(4,2),(SPECTRA(2,4)));
conjHy_Ey=complex(SPECTRA(5,2),(SPECTRA(2,5)));
matrix_HTE=[conjHx_Ex,conjHx_Ey;
            conjHy_Ex,conjHy_Ey];         
% 7: matrix_ETH=[<Ex*Hx>,<Ex*Hy>;
%                <Ey*Hx>,<Ey*Hy>]
% 
conjEx_Hx=complex(SPECTRA(4,1),-1*(SPECTRA(1,4)));
conjEx_Hy=complex(SPECTRA(4,2),-1*(SPECTRA(2,4)));
conjEy_Hx=complex(SPECTRA(5,1),-1*(SPECTRA(1,5)));
conjEy_Hy=complex(SPECTRA(5,2),-1*(SPECTRA(2,5)));
matrix_ETH=[conjEx_Hx,conjEx_Hy;
            conjEy_Hx,conjEy_Hy]; 
% 8: matrix_HTH=[<Hx*Hx>,<Hx*Hy>;
%                <Hy*Hx>,<Hy*Hy>]
% 
conjHx_Hx=complex(SPECTRA(1,1),0);
conjHx_Hy=complex(SPECTRA(2,1),(SPECTRA(1,2)));
conjHy_Hx=complex(SPECTRA(2,1),-1*(SPECTRA(1,2)));
conjHy_Hy=complex(SPECTRA(2,2),0);
matrix_HTH=[conjHx_Hx,conjHx_Hy;
            conjHy_Hx,conjHy_Hy]; 
%--
% 所求Z=[ Zxx, Zyx;
%         Zxy, Zyy]
% 用矩陣運算: matrix_Z=inv(matrix_RTH)*matrix_RTE
matrix_Z=inv(matrix_RTH)*matrix_RTE;
Zxx=matrix_Z(1,1);
Zyx=matrix_Z(1,2);
Zxy=matrix_Z(2,1);
Zyy=matrix_Z(2,2);
% disp(['Zxx=',num2str(Zxx)])
% disp(['Zxy=',num2str(Zxy)])
% disp(['Zyx=',num2str(Zyx)])
% disp(['Zyy=',num2str(Zyy)])
%--
% 逆訊號功率矩陣(inverse signal power matrix):
% S=[ S(1,1), S(1,2);
%     S(2,1), S(2,2)]
% 用矩陣運算: matrix_S=inv(matrix_RTH)*matrix_RTR*inv(matrix_HTR)
matrix_S=inv(matrix_RTH)*matrix_RTR*inv(matrix_HTR);
if imag(matrix_S(1,1)>0.001)
    disp(['異常! matrix_S(1,1)的虛部 = ',num2str(imag(matrix_S(1,1)))])
else
    disp(['正常! matrix_S(1,1)的虛部 = ',num2str(imag(matrix_S(1,1)))])
end
if imag(matrix_S(2,2)>0.001)
    disp(['異常! matrix_S(2,2)的虛部 = ',num2str(imag(matrix_S(2,2)))])
else
    disp(['正常! matrix_S(2,2)的虛部 = ',num2str(imag(matrix_S(2,2)))])
end
disp('--')
%--
% 殘差值的共變異數矩陣(residual covariance matrix):
% N=[ N(1,1), N(1,2);
%     N(2,1), N(2,2)]
% 用矩陣運算: matrix_N=( (matrix_ETE) - (matrix_Z'*matrix_HTE) - (matrix_ETH*matrix_Z) + (matrix_Z'*matrix_HTH*matrix_Z) )/AVGT;
matrix_N=( (matrix_ETE) - (matrix_Z*matrix_HTE) - (matrix_ETH*matrix_Z') + (matrix_Z*matrix_HTH*matrix_Z') )/AVGT;
if imag(matrix_N(1,1)>0.001)
    disp(['異常! matrix_N(1,1)的虛部 = ',num2str(imag(matrix_N(1,1)))])
else
    disp(['正常! matrix_N(1,1)的虛部 = ',num2str(imag(matrix_N(1,1)))])
end
if imag(matrix_N(2,2)>0.001)
    disp(['異常! matrix_N(2,2)的虛部 = ',num2str(imag(matrix_N(2,2)))])
else
    disp(['正常! matrix_N(2,2)的虛部 = ',num2str(imag(matrix_N(2,2)))])
end
disp('--')
disp(['FREQ = ',num2str(FREQ)])
disp('--')
ZXXR=real(Zxx);
ZXXI=imag(Zxx);
ZXXVAR=real(matrix_N(1,1)*matrix_S(1,1));
disp(['ZXXR=',num2str(ZXXR)])
disp(['ZXXI=',num2str(ZXXI)])
disp(['ZXX.VAR=',num2str(ZXXVAR)])
disp('--')

ZXYR=real(Zxy);
ZXYI=imag(Zxy);
ZXYVAR=real(matrix_N(1,1)*matrix_S(2,2));
disp(['ZXYR=',num2str(ZXYR)])
disp(['ZXYI=',num2str(ZXYI)])
disp(['ZXY.VAR=',num2str(ZXYVAR)])
disp('--')

ZYXR=real(Zyx);
ZYXI=imag(Zyx);
ZYXVAR=real(matrix_N(2,2)*matrix_S(1,1));
disp(['ZYXR=',num2str(ZYXR)])
disp(['ZYXI=',num2str(ZYXI)])
disp(['ZYX.VAR=',num2str(ZYXVAR)])
disp('--')

ZYYR=real(Zyy);
ZYYI=imag(Zyy);
ZYYVAR=real(matrix_N(2,2)*matrix_S(2,2));
disp(['ZYYR=',num2str(ZYYR)])
disp(['ZYYI=',num2str(ZYYI)])
disp(['ZYY.VAR=',num2str(ZYYVAR)])
disp('--')


% APPARENT RESISTIVITIES AND PHASES
RHOXX=0.2*(abs(Zxx)^2)/FREQ;
RHOXXERR_coefficient=6.141661E-01;% 不知道原因，由WinGLink運算推測出來的係數
RHOXXERR=RHOXXERR_coefficient*sqrt(ZXXVAR)/abs(complex(ZXXR,ZXXI));
RHOXY=0.2*(abs(Zxy)^2)/FREQ;
RHOYX=0.2*(abs(Zyx)^2)/FREQ;
RHOYY=0.2*(abs(Zyy)^2)/FREQ;
PHSXX=angle(Zxx)*180/pi;
PHSXY=angle(Zxy)*180/pi;
PHSYX=angle(Zyx)*180/pi;
PHSYY=angle(Zyy)*180/pi;
    
% disp(['RHOXX = ',num2str(RHOXX)])
% disp(['RHOXX.ERR = ',num2str(RHOXXERR)])
% disp(['PHSXX = ',num2str(PHSXX)])
RHOXXERR_coefficient=3.772000e-01;% 不知道原因，由WinGLink運算推測出來的係數 
ZXXVAR=2.609511e+06;
RHOXXERR=RHOXXERR_coefficient*sqrt(ZXXVAR)/abs(complex(ZXXR,ZXXI));
disp(['RHOXX = ',num2str(RHOXX)])
disp(['RHOXX.ERR = ',num2str(RHOXXERR)])
disp('--')


RHOXYERR_coefficient=6.141661E-01;% 不知道原因，由WinGLink運算推測出來的係數 
ZXYVAR=3.422518e+00;
RHOXYERR=RHOXYERR_coefficient*sqrt(ZXYVAR)/abs(complex(ZXYR,ZXYI));
disp(['RHOXY = ',num2str(RHOXY)])
disp(['RHOXY.ERR = ',num2str(RHOXYERR)])
disp('--')
RHOXYERR=0.4*(abs(Zxy)*ZXYVAR)/FREQ

RHOYXERR_coefficient=6.141661E-01;% 不知道原因，由WinGLink運算推測出來的係數 
ZYXVAR=4.371119e+00;
RHOYXERR=RHOYXERR_coefficient*sqrt(ZYXVAR)/abs(complex(ZYXR,ZYXI));
disp(['RHOYX = ',num2str(RHOYX)])
disp(['RHOYX.ERR = ',num2str(RHOYXERR)])
disp('--')

RHOYYERR_coefficient=6.141661E-01;% 不知道原因，由WinGLink運算推測出來的係數 
ZYYVAR=5.454524e+00;
RHOYYERR=RHOYYERR_coefficient*sqrt(ZYYVAR)/abs(complex(ZYYR,ZYYI));
disp(['RHOYY = ',num2str(RHOYY)])
disp(['RHOYY.ERR = ',num2str(RHOYYERR)])
disp('--')

% ZT.ZT=[this_Frequency,Zxx,Zxy,Zyx,Zyy,Tx,Ty,RHOxx,RHOxy,RHOyx,RHOyy,PHSxx,PHSxy,PHSyx,PHSyy];
% ZT.ZT_header={'Frequency[Hz]','Zxx[(mv/km)/nT]','Zxy[(mv/km)/nT]','Zyx[(mv/km)/nT]','Zyy[(mv/km)/nT]','Tx','Ty','RHOxx[ohm-m]','RHOxy[ohm-m]','RHOyx[ohm-m]','RHOyy[ohm-m]','PHSxx[degrees]','PHSxy[degrees]','PHSyx[degrees]','PHSyy[degrees]'};

% RHOXY=
% RHOXYERR_coefficient=6.141661E-01;% 不知道原因，由WinGLink運算推測出來的係數 RHOXYERR=RHOXYERR_coefficient*sqrt(ZXYVAR)/abs(complex(ZXYR,ZXYI))











% 
% % <value output="Hx" input="Hx">2.239761e0 -5.577046e-12</value>
% % <value output="Hx" input="Hy">1.447394e-1 8.754000e-1</value>
% % <value output="Hy" input="Hx">1.447394e-1 -8.754000e-1</value>
% % <value output="Hy" input="Hy">2.284239e0 -4.469442e-8</value>
% S(1,1)=complex(2.239761e0,-5.577046e-12);
% S(1,2)=complex(1.447394e-1,8.754000e-1);
% S(2,1)=complex(1.447394e-1,-8.754000e-1);
% S(2,2)=complex(2.284239e0,-4.469442e-8);
% S
% 
% % <Z.RESIDCOV type="complex" size="2 2">
% % <value output="Ex" input="Ex">8.088811e-3 0.000000e0</value>
% % <value output="Ex" input="Ey">3.756640e-3 -2.749000e-3</value>
% % <value output="Ey" input="Ex">3.756640e-3 2.749000e-3</value>
% % <value output="Ey" input="Ey">1.026419e-2 -6.776264e-21</value>
% % </Z.RESIDCOV>
% N(1,1)=complex(8.088811e-3, 0.000000e0);
% N(1,2)=complex(3.756640e-3, -2.749000e-3);
% N(2,1)=complex(3.756640e-3, 2.749000e-3);
% N(2,2)=complex(1.026419e-2, -6.776264e-21);
% N
% % <Z.VAR type="real" size="2 2">
% % <value name="Zxx" output="Ex" input="Hx">1.811701e-2</value>
% % <value name="Zxy" output="Ex" input="Hy">1.847678e-2</value>
% % <value name="Zyx" output="Ey" input="Hx">2.298933e-2</value>
% % <value name="Zyy" output="Ey" input="Hy">2.344586e-2</value>
% % </Z.VAR>
% ZXXVAR=real(N(1,1))*real(S(1,1))
% ZXXVAR2=real(N(1,1)*S(1,1))
% ZXXVAR-ZXXVAR2
% ZXYVAR=real(N(1,1))*real(S(2,2))
% ZXYVAR2=real(N(1,1)*S(2,2))
% ZXYVAR-ZXYVAR2
% ZYXVAR=N(2,2)*S(1,1)
% ZYYVAR=N(2,2)*S(2,2)

2.000000e-05*6.141661e-01*1.000000e+04
4.000000e-05*8.685620e-01*5.000000e+03
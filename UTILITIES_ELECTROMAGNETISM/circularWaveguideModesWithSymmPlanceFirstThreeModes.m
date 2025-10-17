close all;clear ;clc
addAllMyPath_130_192_36_244
SAVE_IN_PDF= 0; 
a          = 1.31; % Radius of the circular waveguide
f          = 85; % 85 GHz
x          = linspace(-a,a,20);
y          = linspace(-a,a,20);
[X,Y]      = meshgrid(x,y);
[phi, rho] = cart2pol(X,Y);
X(rho>a) = NaN;
Y(rho>a) = NaN;
% TE 11 Modes
[Ex_Sin Ey_Sin Hx_Sin Hy_Sin Ex_Cos Ey_Cos Hx_Cos Hy_Cos] = f_GetCircWgModes('TE',1,1,phi,rho,f,a);
f_PlotCircWgModes('TE',1,1,a,X,Y,Ex_Sin,Ey_Sin,Hx_Sin,Hy_Sin,Ex_Cos,Ey_Cos,Hx_Cos,Hy_Cos,'PMC','PEC','PEC','PMC')
% TM 01 Modes
[Ex_Sin Ey_Sin Hx_Sin Hy_Sin Ex_Cos Ey_Cos Hx_Cos Hy_Cos] = f_GetCircWgModes('TM',0,1,phi,rho,f,a);
f_PlotCircWgModes('TM',0,1,a,X,Y,Ex_Sin,Ey_Sin,Hx_Sin,Hy_Sin,Ex_Cos,Ey_Cos,Hx_Cos,Hy_Cos,'none','none','PMC','PMC')%,subplot(2,1,1),cla,hChild = get(gcf,'Children');delete(hChild(3));
% TE 21 Modes
[Ex_Sin Ey_Sin Hx_Sin Hy_Sin Ex_Cos Ey_Cos Hx_Cos Hy_Cos] = f_GetCircWgModes('TE',2,1,phi,rho,f,a);
f_PlotCircWgModes('TE',2,1,a,X,Y,Ex_Sin,Ey_Sin,Hx_Sin,Hy_Sin,Ex_Cos,Ey_Cos,Hx_Cos,Hy_Cos,'PMC','PMC','PEC','PEC')
% TE 01 Modes
[Ex_Sin Ey_Sin Hx_Sin Hy_Sin Ex_Cos Ey_Cos Hx_Cos Hy_Cos] = f_GetCircWgModes('TE',0,1,phi,rho,f,a);
f_PlotCircWgModes('TE',0,1,a,X,Y,Ex_Sin,Ey_Sin,Hx_Sin,Hy_Sin,Ex_Cos,Ey_Cos,Hx_Cos,Hy_Cos,'none','none','PEC','PEC')%,subplot(2,1,1),cla,hChild = get(gcf,'Children');delete(hChild(3));
% TM 11 Modes
[Ex_Sin Ey_Sin Hx_Sin Hy_Sin Ex_Cos Ey_Cos Hx_Cos Hy_Cos] = f_GetCircWgModes('TM',1,1,phi,rho,f,a);
f_PlotCircWgModes('TM',1,1,a,X,Y,Ex_Sin,Ey_Sin,Hx_Sin,Hy_Sin,Ex_Cos,Ey_Cos,Hx_Cos,Hy_Cos,'PEC','PMC','PMC','PEC')

if SAVE_IN_PDF
    %-- Save all figure in EPS2 and then remove extra white space around the plot and save as pdf format    
    fullGsPath = 'C:\Program Files (x86)\GPLGS\gswin32c.exe';
    orientation = 0;    
    fileNameList = {'TE11Sin','TE11Cos','TM01Sin','TM01Cos','TE21Sin','TE21Cos','TE01Sin','TE01Cos','TM11Sin','TM11Cos'};        
    hFigs = sort(findobj('Type','figure'));
    for figInd = 1:numel(hFigs)
        print(hFigs(figInd), '-depsc2', '-r300',[ pwd '/' fileNameList{figInd} '.eps']);
        [result,msg] = eps2pdf([ pwd '/' fileNameList{figInd} '.eps'],fullGsPath,orientation);
    end
end

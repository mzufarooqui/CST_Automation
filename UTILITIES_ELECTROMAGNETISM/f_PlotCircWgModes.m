function f_PlotCircWgModes(modeType,m,n,a,x,y,Ex_Sin,Ey_Sin,Hx_Sin,Hy_Sin,Ex_Cos,Ey_Cos,Hx_Cos,Hy_Cos,hPlane_Sin,vPlane_Sin,hPlane_Cos,vPlane_Cos)
% function f_PlotCircWgModes(modeType,m,n,a,x,y,Ex_TE_V, Ey_TE_V, Hx_TE_V, Hy_TE_V, Ex_TE_H, Ey_TE_H, Hx_TE_H, Hy_TE_H,hPlane_V,vPlane_V,hPlane_H,vPlane_H)
lineWidth = 1;
lineWidthSymPlane = 2;
if strcmp(hPlane_Sin,'PEC')
    hBC_Color_Sin = 'g';
elseif strcmp(hPlane_Sin,'PMC')
    hBC_Color_Sin = 'b';
elseif strcmp(hPlane_Sin,'none')    
    hBC_Color_Sin = 'k';
end
if strcmp(vPlane_Sin,'PEC')
    vBC_Color_Sin = 'g';
elseif strcmp(vPlane_Sin,'PMC')
    vBC_Color_Sin = 'b';
elseif strcmp(vPlane_Sin,'none')    
    vBC_Color_Sin = 'k';
end

if strcmp(hPlane_Cos,'PEC')
    hBC_Color_Cos = 'g';
elseif strcmp(hPlane_Cos,'PMC')
    hBC_Color_Cos = 'b';
elseif strcmp(hPlane_Cos,'none')    
    hBC_Color_Cos = 'k';
end
if strcmp(vPlane_Cos,'PEC')
    vBC_Color_Cos = 'g';
elseif strcmp(vPlane_Cos,'PMC')
    vBC_Color_Cos = 'b';
elseif strcmp(vPlane_Cos,'none')
    vBC_Color_Cos = 'k';    
end

theta      = linspace(-pi,pi);
xCirc      = a * cos(theta);
yCirc      = a * sin(theta);
%-- V pol
figure
% subplot(2,1,1);
quiver(x,y,Ex_Sin,Ey_Sin,'-k','LineWidth',lineWidth);hold on;
quiver(x,y,Hx_Sin,Hy_Sin,'--r','LineWidth',lineWidth);hold on;axis equal
axis equal
legend('E','H','Location','NorthEastOutside');
plot(xCirc,yCirc,'LineWidth',lineWidthSymPlane,'Color','k');hold on;
title([ modeType '_{' num2str(m) num2str(n) '}^{(sin-pol)}']);
% xlabel('x[mm]');ylabel('y[mm]');
plot(xlim,[0 0],'LineWidth',lineWidthSymPlane,'Color',hBC_Color_Sin);hold on;text(a+0.1,-0.01,hPlane_Sin) % H-Plane
plot([0 0],ylim,'LineWidth',lineWidthSymPlane,'Color',vBC_Color_Sin);hold on;text(-0.1,-a-0.1,vPlane_Sin) % V-Plane
set(gca,'XTick',[],'XColor',[1 1 1],'YTick',[],'YColor',[1 1 1],'XLim',[-a a],'YLim',[-a a])
set(gca,'box','off');
axis off

%-- H pol
figure
% subplot(2,1,2);
quiver(x,y,Ex_Cos,Ey_Cos,'-k','LineWidth',lineWidth);hold on;
quiver(x,y,Hx_Cos,Hy_Cos,'--r','LineWidth',lineWidth);hold on;axis equal
axis equal
legend('E','H','Location','NorthEastOutside');
plot(xCirc,yCirc,'LineWidth',lineWidthSymPlane,'Color','k');hold on;
title([ modeType '_{' num2str(m) num2str(n) '}^{(cos-pol)}']);
% xlabel('x[mm]');ylabel('y[mm]');
plot(xlim,[0 0],'LineWidth',lineWidthSymPlane,'Color',hBC_Color_Cos);hold on;text(a+0.1,-0.01,hPlane_Cos) % H-Plane
plot([0 0],ylim,'LineWidth',lineWidthSymPlane,'Color',vBC_Color_Cos);hold on;text(-0.1,-a-0.1,vPlane_Cos) % V-Plane
set(gca,'XTick',[],'XColor',[1 1 1],'YTick',[],'YColor',[1 1 1],'XLim',[-a a],'YLim',[-a a])
set(gca,'box','off')
axis off
end
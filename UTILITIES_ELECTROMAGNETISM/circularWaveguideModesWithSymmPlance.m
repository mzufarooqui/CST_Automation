close all;clear all;clc
a          = 48.4130; % Radius of the circular waveguide
f          = 2.3; % 85 GHz
m          = 2;
n          = 1;
load chiPrimValue
load chiValue
velLight   = 300;  % Velocity of Light in mm/ns
eps_m      = 1 * ( m == 0 ) + 2 * ( m > 0 );
eps_n      = 1 * ( n == 0 ) + 2 * ( n > 0 );
x          = linspace(-a,a,20);
y          = linspace(-a,a,18);
[X,Y]      = meshgrid(x,y);
[phi, rho] = cart2pol(X,Y);
theta      = linspace(-pi,pi);
xCirc      = a * cos(theta);
yCirc      = a * sin(theta);

%-- Chi, Chi', Jm and Jm'
chi_m_n   = chiValue(m+1,n);
chiPr_m_n = chiPrimValue(m+1,n);
J         = @(m,in)( besselj( m , in ) );
J_Prime   = @(m,in)( (J( m-1 , in ) - J( m+1 , in ))/2  );

%-- For TE Modes

k0 = 2 * pi * f / velLight;
kt_TE = chiPr_m_n / a;
kz_TE = sqrt( k0^2 - kt_TE^2 );
fc_TE = kt_TE / ( 2 * pi) * velLight;
psi_m_n  =   sqrt( eps_m / pi ) * ( chiPr_m_n /(sqrt(chiPr_m_n)^2 - m^2))            * J(m,chiPr_m_n*rho/a) / ( a * J(m,chiPr_m_n) )       .* cos( m * phi );

eRho_TE  =   sqrt( eps_m / pi ) * ( J(m,chiPr_m_n*rho/a) /(sqrt(chiPr_m_n)^2 - m^2)) * m ./ ( rho * J(m,chiPr_m_n) )                       .* sin( m * phi );
ePhi_TE  =   sqrt( eps_m / pi ) * ( chiPr_m_n /(sqrt(chiPr_m_n)^2 - m^2))            * J_Prime(m,chiPr_m_n*rho/a) / ( a * J(m,chiPr_m_n) ) .* cos( m * phi );
ez       =   repmat(0,size(ePhi_TE));
hRho_TE  = - sqrt( eps_m / pi ) * chiPr_m_n/(sqrt((chiPr_m_n)^2-m^2)) * J_Prime(m,chiPr_m_n*rho/a)./(a*J(m,chiPr_m_n)) .* cos( m * phi );
hPhi_TE  =   sqrt( eps_m / pi ) * m/(sqrt((chiPr_m_n)^2-m^2))         * J(m,chiPr_m_n*rho/a)./(rho*J(m,chiPr_m_n))     .* sin( m * phi );
% hz       = -j (chiPr_m_n(m,n) / 2*pi*a) * sqrt( eps_m / pi ) * chiPr_m_n(m,n) / sqrt(chiPr_m_n(m,n)^2 - m^2 ) * J(m,chiPr_m_n(m,n)*rho/a) /(a*J(m,chiPr_m_n)) * cos( m * phi );
hz       = -j *(kt_TE/kz_TE) * psi_m_n;
%-- Transformation from Cylindrical to Cartesian
Ex_TE = eRho_TE .* cos(phi) - ePhi_TE .* sin(phi);
Ey_TE = eRho_TE .* sin(phi) + ePhi_TE .* cos(phi);
Hx_TE = hRho_TE .* cos(phi) - hPhi_TE .* sin(phi);
Hy_TE = hRho_TE .* sin(phi) + hPhi_TE .* cos(phi);
%-- Field should be zero outside the circular waveguide
Ex_TE(rho>a) = NaN;
Ey_TE(rho>a) = NaN;
Hx_TE(rho>a) = NaN;
Hy_TE(rho>a) = NaN;

%-- For TM Modes
kt_TM = chi_m_n / a;
fc_TM = kt_TM / ( 2 * pi) * velLight;

phi_m_n  =    sqrt( eps_m / pi ) * ( J(m,chi_m_n*rho/a) /(a*J(m+1,chi_m_n)) )                        .* cos( m * phi );

eRho_TM  =   - sqrt( eps_m / pi ) * ( J_Prime(m,chi_m_n*rho/a) /(a*J(m+1,chi_m_n)))                   .* cos( m * phi );
ePhi_TM  =    sqrt( eps_m / pi ) * ( m / chi_m_n) * J(m,chi_m_n*rho/a) ./ ( rho * J(m+1,chiPr_m_n) ) .* sin( m * phi );

hRho_TM  =  - sqrt( eps_m / pi ) * ( J(m,chi_m_n*rho/a) ./(rho*J(m+1,chi_m_n)))                      .* sin( m * phi );
hPhi_TM  =  - sqrt( eps_m / pi ) * J_Prime(m,chi_m_n*rho/a) ./ ( a * J(m+1,chi_m_n) )                .* cos( m * phi );
%-- Transformation from Cylindrical to Cartesian
Ex_TM = eRho_TM .* cos(phi) - ePhi_TM .* sin(phi);
Ey_TM = eRho_TM .* sin(phi) + ePhi_TM .* cos(phi);
Hx_TM = hRho_TM .* cos(phi) - hPhi_TM .* sin(phi);
Hy_TM = hRho_TM .* sin(phi) + hPhi_TM .* cos(phi);
%-- Field should be zero outside the circular waveguide
Ex_TM(rho>a) = NaN;
Ey_TM(rho>a) = NaN;
Hx_TM(rho>a) = NaN;
Hy_TM(rho>a) = NaN;

if m == 1 & n == 1
    hPlane = 'PEC';
    vPlane = 'PMC';
    hBC_Color = 'g';
    vBC_Color = 'b';
elseif m == 0 & n == 1
    hPlane = 'PMC';
    vPlane = 'PMC';
    hBC_Color = 'b';
    vBC_Color = 'b';
elseif m == 2 & n == 1
    hPlane = 'PEC';
    vPlane = 'PEC';
    hBC_Color = 'g';
    vBC_Color = 'g';
else
    hPlane = '-';
    vPlane = '-';
end
%-- quiver Plot
figure
quiver(x,y,Ex_TE,Ey_TE,'-k','LineWidth',2);hold on;
quiver(x,y,Hx_TE,Hy_TE,':r','LineWidth',2);hold on;axis equal
grid on;axis equal
legend('E','H');
plot(xCirc,yCirc,'LineWidth',2,'Color','k');hold on;
title(['TE_{' num2str(m) num2str(n) '} Mode']);
xlabel('x[mm]');ylabel('y[mm]');
plot(xlim,[0 0],'LineWidth',2,'Color',hBC_Color);hold on;text(a,0.05,hPlane) % H-Plane
plot([0 0],ylim,'LineWidth',2,'Color',vBC_Color);hold on;text(0.01,a-0.05,vPlane) % V-Plane

figure
quiver(x,y,Ex_TM,Ey_TM,'-k','LineWidth',2);hold on;
quiver(x,y,Hx_TM,Hy_TM,':r','LineWidth',2);hold on;axis equal
grid on
hold on;axis equal
legend('E','H');
plot(xCirc,yCirc,'LineWidth',2,'Color','k');hold on;
title(['TM_{' num2str(m) num2str(n) '} Mode']);
xlabel('x[mm]');ylabel('y[mm]');
plot(xlim,[0 0],'LineWidth',2,'Color',hBC_Color);hold on;text(a,0.05,hPlane)
plot([0 0],ylim,'LineWidth',2,'Color',vBC_Color);text(0.01,a-0.05,vPlane)

%-- Save all figure in EPS2 format
if 0
    fullGsPath = 'C:\Program Files (x86)\GPLGS\gswin32c.exe';
    orientation = 0;
    fileNameList = {['TE' num2str(m) num2str(n) 'Mode'],['TM' num2str(m) num2str(n) 'Mode']};
    hFigs = sort(findobj('Type','figure'));
    for figInd = 1:numel(hFigs)
        print(hFigs(figInd), '-depsc2', '-r300',[ pwd '/' fileNameList{figInd} '.eps']);
        [result,msg] = eps2pdf([ pwd '/' fileNameList{figInd} '.eps'],fullGsPath,orientation);
    end
end
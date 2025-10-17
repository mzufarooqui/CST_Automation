close all;clear all;clc
a          =35; % Radius of the circular waveguide
f          = 5.63;  % 85 GHz
m          = 2;
n          = 1;
load chiPrimValue
load chiValue
velLight   = 300;  % Velocity of Light in mm/ns
eps_m      = 1 * ( m == 0 ) + 2 * ( m > 0 );
eps_n      = 1 * ( n == 0 ) + 2 * ( n > 0 );
x          = linspace(-a,a,16);
y          = linspace(-a,a,16);
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
hz       = -1j *(kt_TE/kz_TE) * psi_m_n;
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
ePhi_TM  =    sqrt( eps_m / pi ) * ( m / chi_m_n) * J(m,chi_m_n*rho/a) ./ ( rho * J(m+1,chi_m_n) ) .* sin( m * phi );

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

X(rho>a) = NaN;
Y(rho>a) = NaN;
%-- quiver Plot
subplot(1,2,1);
quiver(X,Y,Ex_TE,Ey_TE,'-');hold on;axis equal
quiver(X,Y,Hx_TE,Hy_TE,':');hold on;axis equal
grid on
hold on;axis equal
legend('E','H');
plot(xCirc,yCirc,'LineWidth',2,'Color','k');hold on;
title(['TE_{' num2str(m) num2str(n) '} Mode']);
xlabel('x[mm]');ylabel('y[mm]');

subplot(1,2,2);
quiver(X,Y,Ex_TM,Ey_TM,'-');hold on;
quiver(X,Y,Hx_TM,Hy_TM,':');hold on;axis equal
grid on
hold on;axis equal
legend('E','H');
plot(xCirc,yCirc,'LineWidth',2,'Color','k');hold on;
title(['TM_{' num2str(m) num2str(n) '} Mode']);
xlabel('x[mm]');ylabel('y[mm]');
% set(gcf,'Units','Normalized','Position',[0 0 1 1]);

%-- contour Plot
figure
subplot(2,4,1),contour(x,y,Ex_TM,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_x- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,2),contour(x,y,Ey_TM,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_y- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,3),contour(x,y,Hx_TM,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_x- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,4),contour(x,y,Hy_TM,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_y- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal

subplot(2,4,5),contour(x,y,Ex_TE,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_x- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,6),contour(x,y,Ey_TE,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_y- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,7),contour(x,y,Hx_TE,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_x- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,8),contour(x,y,Hy_TE,'-');hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_y- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
% set(gcf,'Units','Normalized','Position',[0 0 1 1 ]);

%-- surf Plot
figure
subplot(2,4,1),surf(x,y,Ex_TM);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_x- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,2),surf(x,y,Ey_TM);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_y- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,3),surf(x,y,Hx_TM);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_x- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,4),surf(x,y,Hy_TM);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_y- Field: TM_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal

subplot(2,4,5),surf(x,y,Ex_TE);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_x- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,6),surf(x,y,Ey_TE);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['E_y- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,7),surf(x,y,Hx_TE);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_x- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
subplot(2,4,8),surf(x,y,Hy_TE);hold on;xlabel('x[mm]');ylabel('y[mm]');title(['H_y- Field: TE_{' num2str(m) num2str(n) '} Mode']);plot(xCirc,yCirc,'LineWidth',2,'Color','k');axis equal
% set(gcf,'Units','Normalized','Position',[0 0 1 1 ]);


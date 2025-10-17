close all;clear all;clc
velLight = 300;
a     = 5;
b     = 2.5;
m     = 2;
n     = 0;
eps_m = 1 * ( m == 0 ) + 2 * ( m > 0 );
eps_n = 1 * ( n == 0 ) + 2 * ( n > 0 );
x     = linspace(0,a,32);
y     = linspace(0,b,30);
[x,y] = meshgrid(x,y);

kt    = sqrt( ( m * pi /a )^2 + ( n * pi /b )^2 );
fc    = kt / ( 2 * pi) * velLight;
c_m_n   = sqrt( m^2 * b/a + n^2 * a/b );

%-- For TM Modes
phi_m_n = 2/sqrt( a * b ) * ( sin( m * pi * x / a ) .* sin( n * pi * y / b ) );

ex_TM   = - ( 2 / a ) * ( m / c_m_n ) * cos( m * pi * x / a ) .* sin( n * pi * y / b );
ey_TM   = - ( 2 / b ) * ( n / c_m_n ) * sin( m * pi * x / a ) .* cos( n * pi * y / b );

hx_TM   =  ( 2 * n ) / ( b * c_m_n ) * sin( m * pi * x / a ) .* cos( n * pi * y / b );
hy_TM   = -( 2 * m ) / ( a * c_m_n ) * cos( m * pi * x / a ) .* sin( n * pi * y / b );

%-- For TE Modes
psi_m_n = ( sqrt( ( eps_m * eps_n ) / ( a * b ) ) ) * ( cos( m * pi * x / a ) .* cos( n * pi * y / b ) );

ex_TE   =   sqrt( ( eps_m * eps_n ) / b  ) * ( n / c_m_n ) * cos( m * pi * x / a ) .* sin( n * pi * y / b );
ey_TE   = - sqrt( ( eps_m * eps_n ) / a  ) * ( m / c_m_n ) * sin( m * pi * x / a ) .* cos( n * pi * y / b );

hx_TE   =   sqrt( ( eps_m * eps_n ) / a  ) * ( m / c_m_n ) * sin( m * pi * x / a ) .* cos( n * pi * y / b );
hy_TE   = - sqrt( ( eps_m * eps_n ) / b  ) * ( n / c_m_n ) * cos( m * pi * x / a ) .* sin( n * pi * y / b );

%-- quiver Plot
figure

quiver(x,y,ex_TM,ey_TM,'-');hold on;
quiver(x,y,hx_TM,hy_TM,':');hold on;axis equal
legend('E','H');title(['TM_{' num2str(m) num2str(n) '} Mode']);
plot([0 a a 0 0],[0 0 b b 0],'LineWidth',4),
xlim([0 a]);ylim([0 b]);xlabel('a[mm]');ylabel('b[mm]');

figure
quiver(x,y,ex_TE,ey_TE,'-'); hold on;
quiver(x,y,hx_TE,hy_TE,':'); hold on;axis equal
legend('E','H');title(['TE_{' num2str(m) num2str(n) '} Mode']);
plot([0 a a 0 0],[0 0 b b 0],'LineWidth',4),
xlim([0 a]);ylim([0 b]);xlabel('a[mm]');ylabel('b[mm]');


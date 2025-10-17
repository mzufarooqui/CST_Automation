close all;clear all;clc
a = 34;
f =  3.275;
m = 1;
n = 1;
load chiPrimValue
load chiValue
velLight   = 300;  % Velocity of Light in mm/ns
eps_m      = 1 * ( m == 0 ) + 2 * ( m > 0 );
eps_n      = 1 * ( n == 0 ) + 2 * ( n > 0 );
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
%-- For TM Modes
kt_TM = chi_m_n / a;
fc_TM = kt_TM / ( 2 * pi) * velLight;
%--
fprintf(1,'\nfc(TE(%.0d,%.0d))%.3f GHz',m,n,fc_TE);
fprintf(1,'\nfc(TM(%.0d,%.0d))%.3f GHz',m,n,fc_TM);
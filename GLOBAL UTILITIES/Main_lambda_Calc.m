close all;clear all;clc;
f0 = 5.63;
c0  = 299;
a  = 1.872*25.4;%0.08*25.4;%1.872*25.4;%36.849;%1.872*25.4;%47.55;
b  = 0.872*25.4;%0.04*25.4;%0.872*25.4;%36.849;;%0.872*25.4;%22.149;
m  = 1;
n  = 0;
lambda0 = c0/f0;
k       = 2*pi/lambda0;
kc      = sqrt((m*pi/a)^2+(n*pi/b)^2);
beta    = sqrt(k^2 - kc^2);
lambdaC = 2*pi/kc;
lambdaG = 2*pi/beta;
fc      = c0/lambdaC;
fprintf(1,'\n f0[GHz]: %.3f',f0)
fprintf(1,'\n fc[GHz]: %.3f',fc)
fprintf(1,'\n lambda0[mm]: %.3f',lambda0)
fprintf(1,'\n lambdaC[mm]: %.3f',lambdaC)
fprintf(1,'\n lambdaG[mm]: %.3f',lambdaG)
fprintf('\n');
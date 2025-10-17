close all;clear all;clc
stTime   = 0;
stopTime = 700e-12; % in sec
f0       = 2.3e9;
vppSum   = sqrt(10^(-36/10)*50)*sqrt(2);
vppDelta = sqrt(10^(-45/10)*50)*sqrt(2);
t        = linspace(stTime,stopTime,100);
phSumDeg   = 0;
phDeltaDeg = 90;
% y        = vppSum*sin(2*pi*f0*t+rad2deg(phSumDeg))-vppDelta*sin(2*pi*2.25e9*t+rad2deg(phDeltaDeg));
y        = vppSum*sin(2*pi*f0*t+rad2deg(phSumDeg))+vppDelta*sin(2*pi*2.25e9*t+rad2deg(phDeltaDeg));
figure,plot(t/1e-12,y,'LineWidth',2);grid on;
xlabel('time [pSec]');ylabel('voltage [vol]');
max(y)
close all;clear all;clc
c0         = 299;
f0         = 2.25;
lambda0    = c0/f0;
PTx_dBm     = -20;
GTx_dBi    = 5;
GRx_dBi    = 33;
baseDist   = 150e3;
heightDist = 300e3;
slantDist = sqrt((baseDist)^2+(heightDist)^2); % in mm
pathLoss_dB = fspl(slantDist,lambda0); % 20*log10(4*pi*slantDist/lambda0)
PRx_dBm = PTx_dBm + GTx_dBi + GRx_dBi - pathLoss_dB
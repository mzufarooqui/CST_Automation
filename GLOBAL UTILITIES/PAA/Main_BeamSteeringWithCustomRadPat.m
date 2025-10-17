close all;clear all;clc
tic
Plot_3D = 0;
Plot_2D = 0;
hfssDataRadPathSt     = importdata('F:\FAROOQUI\FAROOQUI_TOOLS\GLOBAL UTILITIES\PAA\quasiYagiElem_HFSS.csv');
c                = 3e8;
freqVector       = [9.98 10].*1e9;        % Frequency range for element pattern
steerang         = [-10:2:10];
fc               = 10e9;
gain_dB          = 35;
Nsubarray        = 2;
interElemSpacing = 0.5;

[sll_dBArr,sll_dBSub,sllPosDegSub,sllPosDegArr,totNumElemInOneRow] = f_BeamSteeringWithCustomRadPat(Plot_3D,Plot_2D,hfssDataRadPathSt,c,freqVector,fc,steerang,Nsubarray,interElemSpacing,gain_dB);
toc
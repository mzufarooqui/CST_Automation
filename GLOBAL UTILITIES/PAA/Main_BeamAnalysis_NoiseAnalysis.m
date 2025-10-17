close all;clear all;clc
tic
Plot_3D = 1;
Plot_2D = 1;
hfssDataRadPathSt = importdata('F:\FAROOQUI\FAROOQUI_TOOLS\GLOBAL UTILITIES\PAA\quasiYagiElem_HFSS.csv');
c0                = 3e8;                       % Velocity of light in free space in meter/sec
freqVector        = [9.98 10].*1e9;            % Frequency range for element pattern in Hz
steerang          = [-10:2:10];                % Steering vector in degree
fc                = 10e9;                      % Center frequency in Hz
gain_dB           = 50.5;                        % Antenna gain in dB
antEfficiency     = 0.65;                      % Antenna efficiency in percentage
Nsubarray         = 1;                         % Number of elements in Sub array
interElemSpacing  = 0.5;                       % Inter element spacing in lambda
[sll_dBArr,sll_dBSub,sllPosDegSub,sllPosDegArr,totNumElemInOneRow] = f_BeamSteeringWithCustomRadPat(Plot_3D,Plot_2D,hfssDataRadPathSt,c0,freqVector,fc,steerang,Nsubarray,interElemSpacing,gain_dB);

BW               = 1e9;                        % Bandwidth in Hz
RCS              = 0.1;                        % RCS of the target in square meter
Pt               = 200e3;                      % Transmit power in watt
SNR              = 17.3;                         % SNR in dB
Nf               = 3.5;                        % Noise figure in dB
Temp             = 290;                        % Noise temperature in Kelvin
maxRange1Given   = 499e3;                      % maximum range in meter
%-- Calculation
pulseWidth    = linspace(1,1000,1000).*1e-6;
[PRFInt1,pulseWidthInt1,blindRangeKmInt,pulseWidthInt2,PRFInt2,PRF_Tot,noiseFloor_dBmInt,mds] = f_ComputeRdrRangeNoiseLevelPRF(Plot_3D,Plot_2D,c0,maxRange1Given,pulseWidth,BW,fc,gain_dB,RCS,Pt,SNR,Nf,Temp);


antEffectiveArea = ( ( (c0/fc)^2* 10^(gain_dB/10))/(4*pi*antEfficiency) ); % Antenna area in meter^2
numTR_Module    = totNumElemInOneRow^2/Nsubarray; % Total number of TR Modules required
powPerTR_Module = Pt/numTR_Module;                % Power per unit TR Module in watt

%-- print results
fprintf(1,'\n------------------------------------------------------------');
fprintf(1,'\n Antenna Efficiency: %.1f%%',antEfficiency*100);
fprintf(1,'\n Antenna Area: %.1fm^2',antEffectiveArea);
fprintf(1,'\n Number of TR Module: %d',numTR_Module);
fprintf(1,'\n Power per TR Module:%.1f watt',powPerTR_Module);
fprintf(1,'\n------------------------------------------------------------');



toc
clc
close all;
clear all;
BW            = 1e9;                        % Bandwidth in Hz
f0            = 10e9;                       % Center frequency in Hz
GaindB        = 47;                         % Antenna Gain in dB
RCS           = 0.1;                        % RCS of the target in square meter
Pt            = 200e3;                      % Transmit power in watt
SNR           = 17;                         % SNR in dB
Nf            = 3.5;                        % Noise figure in dB
Temp          = 290;                        % Noise temperature in Kelvin
c0            = 3e8;
maxRange1Given = 500e3;                     % maximum range in meter
% maxRange2Given = 150e3;                   % maximum range in meter
%-- Calculation
pulseWidth    = linspace(1,1000,1000).*1e-6;
noiseFloor_dBm = 10*log10(noisepow(BW,Nf,Temp))+30-10*log10(pulseWidth*BW);
delR          = c0/(2*BW);               % Range Resolution: MATLAB Function rngres = bw2range(BW)
blindRange    = c0*pulseWidth/2;         % Blind Range
STEMP         = systemp(Nf,Temp);
for i = 1:1:numel(pulseWidth)
    maxRangeKm(i) = radareqrng(c0/f0,SNR,Pt,pulseWidth(i),'Gain',GaindB,'RCS',RCS,'Ts',STEMP,'Units','km'); % Max Range
end
PRF             = c0./(2*maxRangeKm*1e3);
pulseWidthInt1  = interp1(maxRangeKm,pulseWidth,maxRange1Given/1e3,'next')/1e-6; % in micro second
blindRangeKmInt = interp1(pulseWidth,blindRange,pulseWidthInt1*1e-6,'next')/1e3;
PRFInt1         = interp1(maxRangeKm,PRF,maxRange1Given/1e3,'next');
noiseFloor_dBmInt = interp1(pulseWidth,noiseFloor_dBm,pulseWidthInt1*1e-6,'next');

pulseWidthInt2  = interp1(blindRange,pulseWidth,blindRangeKmInt*1e3,'next')/1e-6;
PRFInt2         = interp1(maxRangeKm,PRF,blindRangeKmInt,'next');
PRF_Tot         = 1/(1/PRFInt1+1/PRFInt2);

%-- Plot the results
figure,
subplot(4,1,1),plot(pulseWidth/1e-6,noiseFloor_dBm);grid on;
xlabel('Pulse Width [\mu Sec]');ylabel('Noise Level [dBm]')
title(sprintf('BandWidth = %.1g Hz, \\Delta R =%.1f meter, ',BW,delR))
subplot(4,1,2),plot(pulseWidth/1e-6,blindRange/1e3);grid on;
xlabel('Pulse Width [\mu Sec]');ylabel('Blind Range [Km]')
subplot(4,1,3),plot(pulseWidth/1e-6,maxRangeKm);grid on;
xlabel('Pulse Width [\mu Sec]');ylabel('Range_{max} [Km]')
subplot(4,1,4),plot(maxRangeKm,PRF);grid on;
xlabel('Range_{max} [Km]');ylabel('PRF [Hz]');axis tight

fprintf(1,'\nMax Range(Given): %0.1f Km',maxRange1Given/1e3)
fprintf(1,'\n \t \t \tPRF: %0.1f Hz at %0.1f Km',PRFInt1,maxRange1Given/1e3)
fprintf(1,'\n \t \t \tPulse Width: %0.1f micro sec at %0.1f Km',pulseWidthInt1,maxRange1Given/1e3)
fprintf(1,'\n \t \t \tBlind Range: %0.1f Km at %0.1f micro sec',blindRangeKmInt,pulseWidthInt1)
fprintf(1,'\n \t \t \tPulse Width: %0.1f micro sec at blind range %0.1f Km',pulseWidthInt2,blindRangeKmInt)
fprintf(1,'\n \t \t \tPRF: %0.1f Hz at blind range %0.1f Km',PRFInt2,blindRangeKmInt)
% fprintf(1,'\n \t \t \tPRF: %0.1f Hz',PRFInt2)
fprintf(1,'\nTotal PRF(Update Rate): %0.1f Hz',PRF_Tot)
fprintf(1,'\nNoise Floor: %0.1f dBm',noiseFloor_dBmInt)
fprintf(1,'\nMDS: %0.1f dBm',noiseFloor_dBmInt+SNR)

fprintf(1,'\n');
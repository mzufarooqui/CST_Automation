function [maxRange1Given,PRFInt1,pulseWidthInt1,blindRangeKmInt,pulseWidthInt2,PRFInt2,PRF_Tot,noiseFloor_dBmInt,mds] = f_ComputeRdrRangeNoiseLevelPRF(Plot_3D,Plot_2D,c0,maxRange1Given,pulseWidth,BW,fc,gain_dB,RCS,Pt,SNR,Nf,Temp)
noiseFloor_dBm = 10*log10(noisepow(BW,Nf,Temp))+30-10*log10(pulseWidth*BW);
delR          = c0/(2*BW);               % Range Resolution: MATLAB Function rngres = bw2range(BW)
blindRange    = c0*pulseWidth/2;         % Blind Range
STEMP         = systemp(Nf,Temp);
for i = 1:1:numel(pulseWidth)
    maxRangeKm(i) = radareqrng(c0/fc,SNR,Pt,pulseWidth(i),'Gain',gain_dB,'RCS',RCS,'Ts',STEMP,'Units','km'); % Max Range
end
PRF             = c0./(2*maxRangeKm*1e3);
pulseWidthInt1  = interp1(maxRangeKm,pulseWidth,maxRange1Given/1e3,'nearest')/1e-6; % in micro second
blindRangeKmInt = interp1(pulseWidth,blindRange,pulseWidthInt1*1e-6,'nearest')/1e3;
PRFInt1         = interp1(maxRangeKm,PRF,maxRange1Given/1e3,'nearest');
noiseFloor_dBmInt = interp1(pulseWidth,noiseFloor_dBm,pulseWidthInt1*1e-6,'nearest');

pulseWidthInt2  = interp1(maxRangeKm,pulseWidth/1e-6,blindRangeKmInt,'nearest');
PRFInt2         = interp1(maxRangeKm,PRF,blindRangeKmInt,'nearest');
PRF_Tot         = 1/(1/PRFInt1+1/PRFInt2);
mds             = noiseFloor_dBmInt+SNR;
%-- Plot the results
if Plot_2D == 1
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
end
fprintf(1,'\n------------------------------------------------------------');
fprintf(1,'\nMax Range(Given): %0.1f Km',maxRange1Given/1e3)
fprintf(1,'\n \t \t \tPRF: %0.1f Hz at %0.1f Km',PRFInt1,maxRange1Given/1e3)
fprintf(1,'\n \t \t \tPulse Width: %0.1f micro sec at %0.1f Km',pulseWidthInt1,maxRange1Given/1e3)
fprintf(1,'\n \t \t \tBlind Range: %0.1f Km at %0.1f micro sec',blindRangeKmInt,pulseWidthInt1)
fprintf(1,'\n \t \t \tPulse Width: %0.1f micro sec at blind range %0.1f Km',pulseWidthInt2,blindRangeKmInt)
fprintf(1,'\n \t \t \tPRF: %0.1f Hz at blind range %0.1f Km',PRFInt2,blindRangeKmInt)
% fprintf(1,'\n \t \t \tPRF: %0.1f Hz',PRFInt2)
fprintf(1,'\nTotal PRF: %0.1f Hz',PRF_Tot)
fprintf(1,'\nNoise Floor: %0.1f dBm',noiseFloor_dBmInt)
fprintf(1,'\nMDS: %0.1f dBm',mds)
fprintf(1,'\n------------------------------------------------------------');
fprintf(1,'\n');
end
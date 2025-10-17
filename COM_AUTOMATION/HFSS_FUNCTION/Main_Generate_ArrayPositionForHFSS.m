close all;clear all;clc
addpath(genpath('F:\FAROOQUI\FAROOQUI_TOOLS'));
freq      = 3.0;
ThetaMax  = 0;
PhiMax    = 90;
nElem       = 6;
elemSpacing = 50;
VDy     = [-((nElem/2-1)*elemSpacing+elemSpacing/2):elemSpacing:((nElem/2-1)*elemSpacing+elemSpacing/2)];
VDx    = zeros(1,numel(VDy));
VDz    = zeros(1,numel(VDy));
VCoeffLinear = f_compute_Vcoeff(VDx,VDy,freq,ThetaMax,PhiMax);
sate_1 = [0 -20 -19 -39 -17 -37  ];
sate_2 = [0 -20 -19 -39 -59 -79  ];
sate_3 = [0 -20 -61 -81 -101 -121];
sate_4 = [0 -20 -61 -81 -143 -163];
VCoeffLinear = exp(1j*sate_1*pi/180); % Override the coeff
figure,plot(angle(VCoeffLinear)*180/pi,'-ob');grid on;hold on;
plot(abs(VCoeffLinear),'-ok');grid on;hold on;
legend('Phase','Amp')
fileName = sprintf('Array_numElem_%d_Spacing_%dmm.txt',nElem,elemSpacing);
fid = fopen(fileName,'w');

fprintf(fid,'! first line is a count of cells');
fprintf(fid,'\n%d',nElem);
fprintf(fid,'\n! then [x,y,z] position of each cell');
fprintf(fid,'\n! and amplitude and phase');
fprintf(fid,'\n! default units for position are model units');
fprintf(fid,'\n! default units for amplitude is Volts');
fprintf(fid,'\n! default units for phase is radians');
for ind = 1:(nElem)
    fprintf(fid,'\n%fmm \t%fmm \t%fmm \t%fmV \t%fdeg',VDx(ind),VDy(ind),VDz(ind),abs(VCoeffLinear(ind)),angle(VCoeffLinear(ind))*180/pi);
end
fclose(fid);
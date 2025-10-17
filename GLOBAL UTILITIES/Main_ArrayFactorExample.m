close all;clear all;clc
freq      = 2.4;
thetaDegV = [-180:1:179];
phiDegV   = [-90:1:90];

[MTheta,MPhi] = meshgrid(thetaDegV,phiDegV);
 VDx = [-90:60:90];
 VDy = ones(1,numel(VDx));
 VCoeff = ones(1,numel(VDx));
[Pattern]=f_ArrayFactor2D(VDx,VDy,VCoeff,freq,MTheta,MPhi);


%-- CST single element farfield data
radPatSt = importdata('F:\FAROOQUI\FAROOQUI_TOOLS\GLOBAL UTILITIES\single_element_patch antenna.txt');
radPattData           = radPatSt.data;
phiCutDeg             = 0;
thetaDegAtPhiCut      = radPattData(radPattData(:,2) == phiCutDeg,1);
phiDegAtPhiCut        = radPattData(radPattData(:,2) == phiCutDeg,2);
absGain_dBAtPhiCut     = radPattData(radPattData(:,2) == phiCutDeg,3);
absTheta_dBAtPhiCut   = radPattData(radPattData(:,2) == phiCutDeg,4);
phaseThetaDegAtPhiCut = radPattData(radPattData(:,2) == phiCutDeg,5);
absPhi_dBAtPhiCut     = radPattData(radPattData(:,2) == phiCutDeg,6);
phasePhiDegAtPhiCut   = radPattData(radPattData(:,2) == phiCutDeg,7);

thetaComp = 10.^(absTheta_dBAtPhiCut/10).* exp(1j*phaseThetaDegAtPhiCut*pi/180);
phiComp   = 10.^(absPhi_dBAtPhiCut/10)  .* exp(1j*phasePhiDegAtPhiCut*pi/180);

calcGain = thetaComp + phiComp;
arrayGain = Pattern(MPhi==0) .* calcGain;

%-- CST four element Array Gain
radPatArraySt = importdata('F:\FAROOQUI\FAROOQUI_TOOLS\GLOBAL UTILITIES\Four_element_patch antenna.txt');
radPattArrayData           = radPatArraySt.data;
phiCutDeg             = 0;
thetaDegArrayAtPhiCut      = radPattArrayData(radPattArrayData(:,2) == phiCutDeg,1);
phiDegArrayAtPhiCut        = radPattArrayData(radPattArrayData(:,2) == phiCutDeg,2);
absGain_dBArrayAtPhiCut     = radPattArrayData(radPattArrayData(:,2) == phiCutDeg,3);
absTheta_dBArrayAtPhiCut   = radPattArrayData(radPattArrayData(:,2) == phiCutDeg,4);
phaseThetaDegArrayAtPhiCut = radPattArrayData(radPattArrayData(:,2) == phiCutDeg,5);
absPhi_dBArrayAtPhiCut     = radPattArrayData(radPattArrayData(:,2) == phiCutDeg,6);
phasePhiDegArrayAtPhiCut   = radPattArrayData(radPattArrayData(:,2) == phiCutDeg,7);

figure,
subplot(2,1,1);
plot(thetaDegAtPhiCut,absGain_dBAtPhiCut,'-r','Linewidth',2);grid on;hold on;
plot(thetaDegAtPhiCut,10*log10(abs(calcGain)),'--k','Linewidth',2);grid on;hold on;
legend('cst','cst meas.');axis tight
subplot(2,1,2);
plot(thetaDegAtPhiCut,absGain_dBAtPhiCut-10*log10(abs(calcGain)),'--k','Linewidth',2);grid on;hold on;axis tight

figure,
subplot(2,1,1);
plot(thetaDegAtPhiCut,10*log10(abs(Pattern(MPhi==0))),'-r','Linewidth',2);grid on;hold on;
plot(thetaDegAtPhiCut,10*log10(abs(arrayGain)),'--k','Linewidth',2);grid on;hold on;
plot(thetaDegArrayAtPhiCut,absGain_dBArrayAtPhiCut,'-.b','Linewidth',2);grid on;hold on;
legend('AF','Array Gain calc','CST Array Gain');axis tight
subplot(2,1,2);
plot(thetaDegAtPhiCut,-10*log10(abs(arrayGain))+absGain_dBArrayAtPhiCut,'--k','Linewidth',2);grid on;hold on;
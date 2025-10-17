close all;
clear all;clc;

freqVal = 2.8;
azAngleDeg = 90;
distanceBW_Antennas_mm = 332*25.4;
measFileNameList = {
        %-- 24 May 2017 WLR FR-04 4x4 array
        'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\01_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P01.mat','P01'
        'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\02_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P02.mat','P02'
        'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\03_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P03.mat','P03'
        'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\04_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P04.mat','P04'
        'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\24_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P01ToP04.mat','P_1+P_2+P_3+P_4'
        };
calibFileChamber = 'F:\FAROOQUI\MEASUREMENT_DATA\AnechoicChamberCharacteristic\CalibrationFiles\Chamber\22May2017\06_2.6GHz_To_3.0GHz_Step_5MHz_IFBW_1KHz.txt';
[freqCahmCalib,CalPAD,lossA_dB,lossB_dB] = f_GetSRDCK_ChamCalibData(calibFileChamber);

%-- Load all the data
for pInd = 1:4    
    clear mag phaseDeg hPosDeg vPosDeg hvPosDeg freq
    load(measFileNameList{pInd}) % it will load these variable 'mag','phaseDeg','hPosDeg','vPosDeg','hvPosDeg','freq'
    
    cmdStr = sprintf('mag_P0%d=mag;',pInd);
    eval(cmdStr);
    
    cmdStr = sprintf('phaseDeg_P0%d=phaseDeg;',pInd);
    eval(cmdStr);
    
    cmdStr = sprintf('hPosDeg_P0%d=hPosDeg;',pInd);
    eval(cmdStr);
    
    cmdStr = sprintf('vPosDeg_P0%d=vPosDeg;',pInd);
    eval(cmdStr);
    
    cmdStr = sprintf('hvPosDeg_P0%d=hvPosDeg;',pInd);
    eval(cmdStr);
    
    cmdStr = sprintf('freq_P0%d=freq;',pInd);
    eval(cmdStr);
    
    s21Raw = squeeze(mag(1,:,:) .* exp(1j*deg2rad(phaseDeg(1,:,:))));
    cmdStr = sprintf('s21Raw_P0%d=s21Raw;',pInd);
    eval(cmdStr);         
end

%-- Plot all the data
figure,
plot(freqCahmCalib/1e9,lossA_dB,'-k','DisplayName','Loss A');grid on;hold on
plot(freqCahmCalib/1e9,lossB_dB,'--b','DisplayName','Loss B');grid on;
xlabel('Freq [GHz]');ylabel('|Loss| [dB]');title(sprintf('Cable Loss(Scalar Calibration) record by DAM'));legend('show','Location','South');
    
[sharedVals,freqInd] = intersect(freq(1,1,:)/1e9 ,freqVal);

s21Raw_dB_P01        = 20*log10(abs(s21Raw_P01));
s21Raw_dB_P02        = 20*log10(abs(s21Raw_P02));
s21Raw_dB_P03        = 20*log10(abs(s21Raw_P03));
s21Raw_dB_P04        = 20*log10(abs(s21Raw_P04));

lossA_dB_Matrix = repmat(lossA_dB,[size(s21Raw_P01,1),1]);
s21CLAdj_dB_P01 = s21Raw_dB_P01 + lossA_dB_Matrix;
s21CLAdj_dB_P02 = s21Raw_dB_P02 + lossA_dB_Matrix;
s21CLAdj_dB_P03 = s21Raw_dB_P03 + lossA_dB_Matrix;
s21CLAdj_dB_P04 = s21Raw_dB_P04 + lossA_dB_Matrix;

s21Raw_PhDeg_P01        = (angle(s21Raw_P01))*180/pi;%unwrap
s21Raw_PhDeg_P02        = (angle(s21Raw_P02))*180/pi;
s21Raw_PhDeg_P03        = (angle(s21Raw_P03))*180/pi;
s21Raw_PhDeg_P04        = (angle(s21Raw_P04))*180/pi;

s21CLAdj_P01 = 10.^(s21CLAdj_dB_P01/20) .* exp(1j * angle(s21Raw_P01));
s21CLAdj_P02 = 10.^(s21CLAdj_dB_P02/20) .* exp(1j * angle(s21Raw_P02));
s21CLAdj_P03 = 10.^(s21CLAdj_dB_P03/20) .* exp(1j * angle(s21Raw_P03));
s21CLAdj_P04 = 10.^(s21CLAdj_dB_P04/20) .* exp(1j * angle(s21Raw_P04));

s21CLAdj    = s21CLAdj_P01 + s21CLAdj_P02 + s21CLAdj_P03 + s21CLAdj_P04;
s21CLAdj_dB = 20*log10(abs(s21CLAdj));
%-- Minus Cable Loss
s21_mCL_dB = s21CLAdj_dB - lossA_dB_Matrix;
%-- Calculate Path Loss in dB
freqGHzPL = squeeze(freq(1,1,:))/1e9;
lambda_mm = 299./freqGHzPL;
pathLoss_dB = -20*log10(4*pi*distanceBW_Antennas_mm./lambda_mm).';
pathLoss_dB_Matrix = repmat(pathLoss_dB,[size(s21Raw_P01,1),1]);
s21_mCL_mPL_dB = s21_mCL_dB - pathLoss_dB_Matrix;
%-- Ref. Antenna Gain
refAntGainFileName = 'F:\FAROOQUI\MEASUREMENT_DATA\AnechoicChamberCharacteristic\RefAntennaGain\Standard Gain Horn (Port H).txt';
refAntGain = load(refAntGainFileName);
reqInd = find(refAntGain>=freqGHzPL(1) & refAntGain<=freqGHzPL(end));
refAntGainInBand = refAntGain(reqInd,:);
refAntGain_dB_Matrix = repmat(refAntGainInBand(2),[size(s21Raw_P01)]);
s21_mCL_mPL_mGt_dB   = s21_mCL_mPL_dB - refAntGain_dB_Matrix;

s21_mCL_mPL_mGt = 10.^(s21_mCL_mPL_mGt_dB/20) .* exp(1j * angle(s21CLAdj));
%-- Measured sum patt.
clear mag phaseDeg hPosDeg vPosDeg hvPosDeg freq
load(measFileNameList{5,1}) % it will load these variable 'mag','phaseDeg','hPosDeg','vPosDeg','hvPosDeg','freq'
s21MeasP01_To_P04       = squeeze(mag(1,:,:) .* exp(1j*deg2rad(phaseDeg(1,:,:))));
s21MeasP01_To_P04Reg4   = squeeze(mag(2,:,:) .* exp(1j*deg2rad(phaseDeg(2,:,:))));
s21MeasP01_To_P04_dB    = 20*log10(abs(s21MeasP01_To_P04));
s21MeasP01_To_P04_Gr_dB = s21MeasP01_To_P04_dB - pathLoss_dB_Matrix - refAntGain_dB_Matrix;
s21MeasP01_To_P04_Gr    = s21MeasP01_To_P04_Gr_dB .* exp(1j .*angle(s21MeasP01_To_P04));

[maxGain_dB_P01,maxGainInd_P01] = max((s21Raw_dB_P01(:,freqInd))); % max gain at azimuth cut
[maxGain_dB_P02,maxGainInd_P02] = max((s21Raw_dB_P02(:,freqInd))); % max gain at azimuth cut
[maxGain_dB_P03,maxGainInd_P03] = max((s21Raw_dB_P03(:,freqInd))); % max gain at azimuth cut
[maxGain_dB_P04,maxGainInd_P04] = max((s21Raw_dB_P04(:,freqInd))); % max gain at azimuth cut

[maxGain_dB_CLAdj_P01,maxGainInd_CLAdj_P01] = max((s21CLAdj_dB_P01(:,freqInd))); % max gain at azimuth cut
[maxGain_dB_CLAdj_P02,maxGainInd_CLAdj_P02] = max((s21CLAdj_dB_P02(:,freqInd))); % max gain at azimuth cut
[maxGain_dB_CLAdj_P03,maxGainInd_CLAdj_P03] = max((s21CLAdj_dB_P03(:,freqInd))); % max gain at azimuth cut
[maxGain_dB_CLAdj_P04,maxGainInd_CLAdj_P04] = max((s21CLAdj_dB_P04(:,freqInd))); % max gain at azimuth cut

legStr_P01 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{1,2},maxGain_dB_P01,hPosDeg_P01(1,maxGainInd_P01));
legStr_P02 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{2,2},maxGain_dB_P02,hPosDeg_P02(1,maxGainInd_P02));
legStr_P03 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{3,2},maxGain_dB_P03,hPosDeg_P03(1,maxGainInd_P03));
legStr_P04 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{4,2},maxGain_dB_P04,hPosDeg_P04(1,maxGainInd_P04));

legStr_CLAdj_P01 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{1,2},maxGain_dB_CLAdj_P01,hPosDeg_P01(1,maxGainInd_CLAdj_P01));
legStr_CLAdj_P02 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{2,2},maxGain_dB_CLAdj_P02,hPosDeg_P02(1,maxGainInd_CLAdj_P02));
legStr_CLAdj_P03 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{3,2},maxGain_dB_CLAdj_P03,hPosDeg_P03(1,maxGainInd_CLAdj_P03));
legStr_CLAdj_P04 = sprintf('%s: G_{max}:%.1fdB, At Az:%.1f^o',measFileNameList{4,2},maxGain_dB_CLAdj_P04,hPosDeg_P04(1,maxGainInd_CLAdj_P04));


figure,
plot(hPosDeg_P01(1,:),s21Raw_dB_P01(:,freqInd),'-k','DisplayName',legStr_P01);grid on;hold on
plot(hPosDeg_P02(1,:),s21Raw_dB_P02(:,freqInd),'--b','DisplayName',legStr_P02);grid on;
plot(hPosDeg_P03(1,:),s21Raw_dB_P03(:,freqInd),'--c','DisplayName',legStr_P03);grid on;
plot(hPosDeg_P04(1,:),s21Raw_dB_P04(:,freqInd),'-r','DisplayName',legStr_P04);grid on;
xlabel('\theta [deg]');ylabel('|s_{21}| [dB]');title(sprintf('RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');

figure,
plot(hPosDeg_P01(1,:),s21Raw_PhDeg_P01(:,freqInd),'-k','DisplayName',legStr_P01);grid on;hold on
plot(hPosDeg_P02(1,:),s21Raw_PhDeg_P02(:,freqInd),'--b','DisplayName',legStr_P02);grid on;
plot(hPosDeg_P03(1,:),s21Raw_PhDeg_P03(:,freqInd),'--g','DisplayName',legStr_P03);grid on;
plot(hPosDeg_P04(1,:),s21Raw_PhDeg_P04(:,freqInd),'-r','DisplayName',legStr_P04);grid on;
xlabel('\theta [deg]');ylabel('<s_{21} [deg]');title(sprintf('RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');

figure,
plot(hPosDeg_P01(1,:),s21CLAdj_dB_P01(:,freqInd),'-k','DisplayName',legStr_CLAdj_P01);grid on;hold on
plot(hPosDeg_P02(1,:),s21CLAdj_dB_P02(:,freqInd),'--b','DisplayName',legStr_CLAdj_P02);grid on;
plot(hPosDeg_P03(1,:),s21CLAdj_dB_P03(:,freqInd),'--c','DisplayName',legStr_CLAdj_P03);grid on;
plot(hPosDeg_P04(1,:),s21CLAdj_dB_P04(:,freqInd),'-r','DisplayName',legStr_CLAdj_P04);grid on;
xlabel('\theta [deg]');ylabel('|s_{21}| [dB] + Cable Loss A [dB]');title(sprintf('Cable Loss A Adj, RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');
%-- Recheck
figure,
plot(hPosDeg_P01(1,:),20*log10(abs(s21CLAdj_P01(:,freqInd))),'-k','DisplayName',legStr_CLAdj_P01);grid on;hold on
plot(hPosDeg_P02(1,:),20*log10(abs(s21CLAdj_P02(:,freqInd))),'--b','DisplayName',legStr_CLAdj_P02);grid on;
plot(hPosDeg_P03(1,:),20*log10(abs(s21CLAdj_P03(:,freqInd))),'--c','DisplayName',legStr_CLAdj_P03);grid on;
plot(hPosDeg_P04(1,:),20*log10(abs(s21CLAdj_P04(:,freqInd))),'-r','DisplayName',legStr_CLAdj_P04);grid on;
xlabel('\theta [deg]');ylabel('|s_{21}| [dB] + Cable Loss A [dB]');title(sprintf('ReCheck: Cable Loss A Adj, RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');
%-- Recheck
figure,
plot(hPosDeg_P01(1,:),(angle(s21CLAdj_P01(:,freqInd)))*180/pi,'-k','DisplayName',legStr_CLAdj_P01);grid on;hold on
plot(hPosDeg_P02(1,:),(angle(s21CLAdj_P02(:,freqInd)))*180/pi,'--b','DisplayName',legStr_CLAdj_P02);grid on;
plot(hPosDeg_P03(1,:),(angle(s21CLAdj_P03(:,freqInd)))*180/pi,'--c','DisplayName',legStr_CLAdj_P03);grid on;
plot(hPosDeg_P04(1,:),(angle(s21CLAdj_P04(:,freqInd)))*180/pi,'-r','DisplayName',legStr_CLAdj_P04);grid on;
xlabel('\theta [deg]');ylabel('<s_{21}| [deg]');title(sprintf('ReCheck: Cable Loss A Adj, RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');
%-- P01 + P02 + P03 + P04
figure,
plot(hPosDeg(1,:),s21CLAdj_dB(:,freqInd),'-k','DisplayName','\Sigma');grid on;hold on
plot(hPosDeg(1,:),s21_mCL_dB(:,freqInd),'--b','DisplayName','\Sigma-CL');grid on;hold on
plot(hPosDeg(1,:),s21_mCL_mPL_dB(:,freqInd),'--c','DisplayName','\Sigma-CL-PL');grid on;hold on
plot(hPosDeg(1,:),s21_mCL_mPL_mGt_dB(:,freqInd),'--r','DisplayName','\Sigma-CL-PL-G_t');grid on;hold on
xlabel('\theta [deg]');ylabel('[dB]');title(sprintf('Sum PortRadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');

figure,
plot(hPosDeg(1,:),s21_mCL_mPL_mGt_dB(:,freqInd),'-k','DisplayName','\Sigma');grid on;hold on
plot(hPosDeg(1,:),20*log10(abs(s21MeasP01_To_P04_Gr(:,freqInd))),'--b','DisplayName','\Sigma Meas');grid on;hold on
plot(hPosDeg(1,:),20*log10(abs(s21MeasP01_To_P04Reg4(:,freqInd))),'--c','DisplayName','\Sigma Meas DAM');grid on;hold on
xlabel('\theta [deg]');ylabel('|s_{21}| [deg]');title(sprintf('\\Sigma:RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');

figure,
plot(hPosDeg(1,:),angle(s21CLAdj(:,freqInd)),'-k','DisplayName','\Sigma');grid on;hold on
plot(hPosDeg(1,:),angle(s21MeasP01_To_P04_Gr(:,freqInd)),'--b','DisplayName','\Sigma Meas');grid on;hold on
plot(hPosDeg(1,:),angle(s21MeasP01_To_P04Reg4(:,freqInd)),'--c','DisplayName','\Sigma Meas DAM');grid on;hold on
xlabel('\theta [deg]');ylabel('<s_{21}| [deg]');title(sprintf('\\Sigma:RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');

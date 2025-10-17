% close all;
clear all;clc;
ADJUST_PATH_LOSS_ANTENNA_GAIN  = 1;
ADJUST_CABLE_LOSS = 0;

if ADJUST_PATH_LOSS_ANTENNA_GAIN
    freqVal = 2.8;
    azAngleDeg = 90;
    distanceBW_Antennas_mm = 332*25.4;
    calibFileChamber = 'F:\FAROOQUI\MEASUREMENT_DATA\AnechoicChamberCharacteristic\CalibrationFiles\Chamber\22May2017\06_2.6GHz_To_3.0GHz_Step_5MHz_IFBW_1KHz.txt';
    [freqCahmCalib,CalPAD,lossA_dB,lossB_dB] = f_GetSRDCK_ChamCalibData(calibFileChamber);
    
    
    for pInd = 1:4
        measFileNameList = {
            %-- 24 May 2017 WLR FR-04 4x4 array
            'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\01_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P01.mat','P01'
            'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\02_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P02.mat','P02'
            'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\03_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P03.mat','P03'
            'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\04_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P04.mat','P04'
            };
        
        load(measFileNameList{pInd}) % it will load these variable 'mag','phaseDeg','hPosDeg','vPosDeg','hvPosDeg','freq','magRawSubLossA_dB','magRawAdLossA_dB'
        
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
    end            
    magRawAdLossA_Sum = ...
        (10.^((db(squeeze(mag_P01(1,:,:)))+repmat(lossA_dB,[size(mag,2),1]))/20)).*exp(1j*squeeze(deg2rad(phaseDeg_P01(1,:,:))))+ ...
        (10.^((db(squeeze(mag_P02(1,:,:)))+repmat(lossA_dB,[size(mag,2),1]))/20)).*exp(1j*squeeze(deg2rad(phaseDeg_P02(1,:,:)))) + ...
        (10.^((db(squeeze(mag_P03(1,:,:)))+repmat(lossA_dB,[size(mag,2),1]))/20)).*exp(1j*squeeze(deg2rad(phaseDeg_P03(1,:,:)))) + ...
        (10.^((db(squeeze(mag_P04(1,:,:)))+repmat(lossA_dB,[size(mag,2),1]))/20)).*exp(1j*squeeze(deg2rad(phaseDeg_P04(1,:,:)))); % Add all mag               
           
    %-- Calculate Path Loss in dB
    freqGHzPL = squeeze(freq(1,1,:))/1e9;
    lambda_mm = 299./freqGHzPL;
    pathLoss_dB = -20*log10(4*pi*distanceBW_Antennas_mm./lambda_mm);
    %-- Ref. Antenna Gain
    refAntGainFileName = 'F:\FAROOQUI\MEASUREMENT_DATA\AnechoicChamberCharacteristic\RefAntennaGain\Standard Gain Horn (Port H).txt';
    refAntGain = load(refAntGainFileName);
    reqInd = find(refAntGain>=freqGHzPL(1) & refAntGain<=freqGHzPL(end));
    refAntGainInBand = refAntGain(reqInd,:);
    %-- Apply firiis equation
    mag_dB = 20*log10(abs(magRawAdLossA_Sum))-repmat(lossA_dB,[size(mag,2),1])- repmat(pathLoss_dB.',[size(mag,2),1]) - repmat(refAntGainInBand(2),[size(mag,2),size(mag,3)]);            
    
    [sharedVals,reqInd] = intersect(freq(1,1,:)/1e9 ,freqVal);
    freqInd = reqInd;
    [maxGain,maxGainInd] = max((mag_dB(:,freqInd))); % max gain at azimuth cut
    azPosInd = find(hPosDeg(1,:)==azAngleDeg);    
    
    %-- Gain flattness
    figure,
    [maxGainAtFreq,maxGainInd] = max(mag_dB(azPosInd,:));
    maxGainFreq = freq(1,azPosInd,maxGainInd)*1e-9;
    legStr = sprintf('%s: G_{max}:%.1fdB, At Freq:%.3fGHz, Az Pos(%.1f^o)',measFileNameList{pInd,2},maxGainAtFreq,maxGainFreq,azAngleDeg);
    plot(squeeze(freq(1,azPosInd,:))/1e9,mag_dB(azPosInd,:)+0.5,'-k','DisplayName',legStr);grid on;hold on;
    xlabel('Freq [Ghz]');ylabel('Gain [dB]');title(sprintf('Gain Flatness: Az Post:%.1f Deg',azAngleDeg));legend('show','Location','South');
    %-- Rad Patt.
    figure,
    legStr = sprintf('%s: G_{max}:%.1fdB, At Az :(%.1f^o)',measFileNameList{pInd,2},maxGain,azAngleDeg);
    plot(hPosDeg(1,:),mag_dB(:,freqInd)+0.5,'-k','DisplayName',legStr);grid on;
    xlabel('\theta [deg]');ylabel('Gain [dB]');title(sprintf('RadPatt: Freq:%.3f GHz',freqVal));legend('show','Location','South');
    %-- Path Loss
    figure,
    plot(squeeze(freq(1,azPosInd,:))/1e9,pathLoss_dB,'-k','DisplayName','Path Loss');grid on;hold on;
    xlabel('Freq [Ghz]');ylabel('Path Loss [dB]');title(sprintf('Path Loss at %0.3f inch',distanceBW_Antennas_mm/25.4));legend('show');
    %--
    figure,
    plot(squeeze(freq(1,azPosInd,:))/1e9,20*log10(abs(squeeze(magRawAdLossA_Sum(azPosInd,:)))),'-k','DisplayName','magRaw');grid on;hold on;
    plot(squeeze(freq(1,azPosInd,:))/1e9,pathLoss_dB,'--b','DisplayName','PathLoss');grid on;hold on;
    plot(squeeze(freq(1,azPosInd,:))/1e9,repmat(refAntGainInBand(2),[size(freq,3),1]),'--r','DisplayName','RefAntGain dB');grid on;hold on;
    plot(squeeze(freq(1,azPosInd,:))/1e9,lossA_dB,'--m','DisplayName','CableLoss');grid on;hold on;        
    xlabel('Freq [Ghz]');ylabel('Gain [dB]');title(sprintf('Az Post:%.1f Deg',azAngleDeg));legend('show');
    
end
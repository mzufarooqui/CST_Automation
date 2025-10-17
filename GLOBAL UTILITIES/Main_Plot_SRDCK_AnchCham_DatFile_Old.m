% close all;
clear all;clc;
addpath(genpath('F:\FAROOQUI\FAROOQUI_TOOLS\'));
measDataPath = 'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\01-06-2016\';
AZ_SCAN = 1;
EL_SCAN = 2;
AZ_EL_SCAN = 3;
fileNameList = {
    %         '05_0to180Az_1Deg_Step_HH_antenna1.mat',          'E-Pl' % *
    %         '06_90Az_-40to40El_1Deg_Step_HH_antenna1.mat',    'H-Pl' % *
    %         '07_0to180Az_1Deg_Step_VV_antenna1.mat',          'H-Pl' % *
    %     '08_89to93Az_0.1Deg_Step_VV_antenna1.mat',        'H-Pl'
    %         '09_90Az_-40to40El_1Deg_Step_VV_antenna1.mat',    'E-Pl' % *
    %     '10_0to180Az_1Deg_Step_VH_antenna1_Xpol.mat',     'xPol'
    '11_0to180Az_1Deg_Step_HH_antenna2.mat',          'E-Pl' % *
    '12_90Az_-40to40El_1Deg_Step_HH_antenna2.mat',    'H-Pl' % *
    %     '13_89to93Az_0.1Deg_Step_HH_antenna2.mat',        'E-Pl'
    %     '14_0to180Az_1Deg_Step_HV_antenna2_Xpol.mat',     'xPol'
    '15_0to180Az_1Deg_Step_VV_antenna2.mat',          'H-Pl' % *
    '16_90Az_-40to40El_1Deg_Step_VV_antenna2.mat',    'E-Pl' % *
    %     '17_89to93Az_0.1Deg_Step_VV_antenna2.mat',        'H-Pl'
    };
freqVal = 9.97;
pInd = 1;
SCAN_SELECTION = AZ_SCAN; % OPTIONS: AZ_SCAN, EL_SCAN, AZ_EL_SCAN
lineWidth = 1;
load([measDataPath fileNameList{pInd,1}]) % it will load these variable [mag,phaseDeg,hPosDeg,vPosDeg,hvPosDeg,freq]
mag;phaseDeg;vPosDeg;hvPosDeg;freq;hPosDeg;

pColor = f_GetColorList();
lineStyle = {'-','--','-.','--','-.'};
switch SCAN_SELECTION
    case AZ_SCAN
        AZ_POS_DEG = 90;
        EL_POS_DEG = 0;
        REG_SEL = size(mag,1);
        mag       = squeeze(mag     (REG_SEL,:,:));
        phaseDeg  = squeeze(phaseDeg(REG_SEL,:,:));
        vPosDeg   = vPosDeg         (REG_SEL,:);
        hvPosDeg  = hvPosDeg        (REG_SEL,:);
        freq      = squeeze(freq    (REG_SEL,:,:));
        hPosDeg   = squeeze(hPosDeg (REG_SEL,:));
        
        [sharedVals,reqInd] = intersect(freq(1,:)/1e9 ,freqVal);
        
        FREQ_IND = reqInd;
        hPOS_IND = find(hPosDeg==AZ_POS_DEG);
        
        figure(1),
        plot(freq(hPOS_IND,:)*1e-9,20*log10(abs(mag(hPOS_IND,:))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth);grid on;hold on;
        xlabel('frequency [GHz]');ylabel('Gain [dB]');title(sprintf('AT Az. Pos:%.1f^o',AZ_POS_DEG));
        [maxGainAtFreq,maxGainInd] = max(20*log10(abs(mag(hPOS_IND,:))));
        maxGainFreq = freq(hPOS_IND,maxGainInd)*1e-9;
        legStr = sprintf('%s: G_{max}:%.1fdB, At Freq:%.1fGHz',fileNameList{pInd,2},maxGainAtFreq,maxGainFreq);
        f_UpdateLegend(legStr,1,'South');drawnow;axis tight
        % set(gca,'XLim',[2.1 2.5],'YLim',[-20 10.5]);
        
        figure(2),
        plot(hPosDeg-90,20*log10(abs(mag(:,FREQ_IND))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth);grid on;hold on;
        xlabel('\phi [deg]');ylabel('Gain [dB]');title(sprintf('Az cut at EL :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal))
        [sideLobeLevel,sideLobeLevelAtThetaDeg]  = f_GetSideLobeLevel(20*log10(abs(mag(:,FREQ_IND))),hPosDeg);
        [maxG_Val,X_dBBeamWidth,maxG_At_Theta] = f_GetX_dB_BW(hPosDeg,20*log10(abs(mag(:,FREQ_IND))),-3);
        legStr = sprintf('%s: G_{max}:%.1fdB, At:%.1f^o, 3dB_{BW}:%0.1f^o,SLL:%0.1fdB',fileNameList{pInd,2},maxG_Val,maxG_At_Theta-90,X_dBBeamWidth-90,sideLobeLevel);
        f_UpdateLegend(legStr,1,'South');drawnow;axis tight
    case EL_SCAN
        AZ_POS_DEG = 90;
        EL_POS_DEG = 0;
        REG_SEL = size(mag,1);
        mag       = squeeze(mag     (REG_SEL,:,:));
        phaseDeg  = squeeze(phaseDeg(REG_SEL,:,:));
        vPosDeg   = vPosDeg         (REG_SEL,:);
        hvPosDeg  = hvPosDeg        (REG_SEL,:);
        freq      = squeeze(freq    (REG_SEL,:,:));
        hPosDeg   = squeeze(hPosDeg (REG_SEL,:));
        
        [sharedVals,reqInd] = intersect(freq(1,:)/1e9 ,freqVal);
        
        FREQ_IND = reqInd;
        vPOS_IND = find(vPosDeg==EL_POS_DEG);
        
        figure(1),
        plot(freq(vPOS_IND,:)*1e-9,20*log10(abs(mag(vPOS_IND,:))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth);grid on;hold on;
        xlabel('frequency [GHz]');ylabel('Gain [dB]');title(sprintf('AT El. Pos:%.1f^o',EL_POS_DEG));
        [maxGainAtFreq,maxGainInd] = max(20*log10(abs(mag(vPOS_IND,:))));
        maxGainFreq = freq(vPOS_IND,maxGainInd)*1e-9;
        legStr = sprintf('%s: G_{max}:%.1fdB, At Freq:%.1fGHz',fileNameList{pInd,2},maxGainAtFreq,maxGainFreq);
        f_UpdateLegend(legStr,1,'South');drawnow;axis tight
        % set(gca,'XLim',[2.1 2.5],'YLim',[-20 10.5]);
        
        figure(2),
        plot(vPosDeg,20*log10(abs(mag(:,FREQ_IND))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth);grid on;hold on;
        xlabel('\theta [deg]');ylabel('Gain [dB]');title(sprintf('El cut at Az :%0.1f^o,Freq:%0.3f GHz',AZ_POS_DEG,freqVal))
        [sideLobeLevel,sideLobeLevelAtThetaDeg]  = f_GetSideLobeLevel(20*log10(abs(mag(:,FREQ_IND))),vPosDeg);
        [maxG_Val,X_dBBeamWidth,maxG_At_Theta] = f_GetX_dB_BW(vPosDeg,20*log10(abs(mag(:,FREQ_IND))),-3);
        legStr = sprintf('%s: G_{max}:%.1fdB, At:%.1f^o, 3dB_{BW}:%0.1f^o,SLL:%0.1fdB',fileNameList{pInd,2},maxG_Val,maxG_At_Theta,X_dBBeamWidth,sideLobeLevel);
        f_UpdateLegend(legStr,1,'South');drawnow;axis tight
    case AZ_EL_SCAN
        AZ_POS_DEG = 87.5;
        EL_POS_DEG = 0;
        REG_SEL = size(mag,1);
        mag       = squeeze(mag     (REG_SEL,hPosDeg(REG_SEL,:)==AZ_POS_DEG,:));
        phaseDeg  = squeeze(phaseDeg(REG_SEL,hPosDeg(REG_SEL,:)==AZ_POS_DEG,:));
        vPosDeg   = vPosDeg         (REG_SEL,hPosDeg(REG_SEL,:)==AZ_POS_DEG);
        hvPosDeg  = hvPosDeg        (REG_SEL,hPosDeg(REG_SEL,:)==AZ_POS_DEG);
        freq      = squeeze(freq    (REG_SEL,hPosDeg(REG_SEL,:)==AZ_POS_DEG,:));
        hPosDeg   = squeeze(hPosDeg (REG_SEL,hPosDeg(REG_SEL,:)==AZ_POS_DEG));
        
        [sharedVals,reqInd] = intersect(freq(1,:)/1e9 ,freqVal);
        
        FREQ_IND = reqInd;
        hPOS_IND = find(vPosDeg==EL_POS_DEG);
        
        figure,
        plot(squeeze(freq(hPOS_IND,:))*1e-9,20*log10(abs(squeeze(mag(hPOS_IND,:)))));grid on;
        xlabel('frequency [GHz]');ylabel('Gain [dB]');title(sprintf('At El: %.1f^o',EL_POS_DEG));
        % set(gca,'XLim',[2.1 2.5],'YLim',[-20 10.5]);
        
        figure,subplot(1,2,1)
        plot(hPosDeg,20*log10(abs(squeeze(mag(:,FREQ_IND)))));grid on;
        xlabel('\phi [deg]');ylabel('Gain [dB]');title(sprintf('Az cut at:%0.1f^o El.,Freq:%0.3f GHz',EL_POS_DEG,freqVal))
        subplot(1,2,2)
        plot(vPosDeg,20*log10(abs(squeeze(mag(:,FREQ_IND)))));grid on;
        xlabel('\theta [deg]');ylabel('Gain [dB]');title(sprintf('El cut at:%0.1f^o Az.,Freq:%0.3f GHz',AZ_POS_DEG,freqVal))
end

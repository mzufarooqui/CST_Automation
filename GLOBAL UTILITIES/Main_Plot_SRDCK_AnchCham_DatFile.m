close all;
clear all;clc;
addpath(genpath('F:\FAROOQUI\FAROOQUI_TOOLS'))
measDataPath = [];
circPol      = [];%'RHCP';%'LHCP';%'LHCP';%'RHCP';  % circular polarization
AZ_POS_DEG_MANUAL = 90;%[]; %Option: [], Angle, DESC: rad patt. plot at this azimuth, if it is empty then max gain Az would be used
freqVal      =  3.25;%2.201;%2.399
EXPORT_DATA_TXT = 0; % 1: export data in txt format, 0: do not export
PLOT_360        = 0;
plotList = [];
phaseInfoCell = [];
fileNameList = {
    %-- PDIB-OS_ver01
    'E:\FAROOQUI\MEASUREMENT_DATA\WLR\PDIB_OS_Ver01_1x4_Array\PDIB OS Ver01\07Jan2019\06_0_to_180Az_Tx_NSGH_H_Rx_PDIB_01_Ant01_Elem_01-02-03-04.dat',' '
    %--  OCE 8x8 Patch antenna array on AD260,
%         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\01_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant01.dat','Ant01'
%         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\02_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant02.dat','Ant02'
%         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\04_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant03.dat','Ant03'
%         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\03_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant04.dat','Ant04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\05_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant01_Ant02.dat','Ant: 01-02'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\07_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant03_Ant04.dat','Ant: 03-04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\06_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant01_Ant04.dat','Ant: 01-04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\08_0_To_180Az_0EL_Tx_NSGH_Pb_V_Rx_Ant02_Ant03.dat','Ant: 02-03'
%     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\09_90Az_-45_To_45EL_Tx_NSGH_Pb_V_Rx_Ant02_Ant03.dat','Ant: 02-03'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\10_85_to_95Az_-3_To_3EL_Tx_NSGH_Pb_V_Rx_Ant02_Ant03.dat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\11_89_to_93Az_-2_To_2EL_Tx_NSGH_Pb_V_Rx_Ant02_Ant03.dat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\12_80_to_100Az_-10_To_10EL_Tx_NSGH_Pb_V_Rx_Ant02_Ant03.dat',''
%         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\13_0_to_180Az_Tx_NSGH_Pb_V_Rx_Ant01_02_03_04.dat','Ant: 01-02-03-04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\14_70_to_110Az__-10_To_10El_Tx_NSGH_Pb_V_Rx_Ant01_02_03_04.dat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\15_88_to_93Az_-2_To_2El_Tx_NSGH_Pb_V_Rx_Ant01_02_03_04.dat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\16_0_to_180Az_1.0El_Tx_NSGH_Pb_V_Rx_Ant01_02_03_04.dat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\17_87_to_93Az_-2_to_2.0El_Tx_NSGH_Pb_V_Rx_Ant01_02_03_04.dat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\18_87_to_93Az_-2_to_2.0El_Tx_NSGH_Pb_V_Rx_Ant01_02_03_04.dat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\10Oct2018\19_70_to_110Az_-20_to_20El_Tx_NSGH_Pb_V_Rx_Ant01_02_03_04.dat',''
    %-- WLR 4x8 Antenna Array
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\2018_07_26_4x8_Array\26June2018_4x8Array\33_0_To_180Az_Step_1Az_Tx_V_NSGH_Rx_Col3ToCol6_Processed.dat','C13-C16'
    %-- 27 Aug 2018 OCE 8x8 Patch Antenna Array fabricate on AD260
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\27Aug2018\01_01_to_180Az_Tx_NSGH_PB_V_Rx_V_LineDwn.dat','Az Cut'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\AD260\27Aug2018\03_90Az_-90_to_90El_Tx_NSGH_PB_V_Rx_V_LineDwn.dat','El Cut'
    %-- 28 March2018 EightPatchPrototype2, use new standard gain horn in CP
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\01_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P1.dat','D-P1'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\02_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P2.dat','D-P2'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\03_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P3.dat','D-P3'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\04_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P4.dat','D-P4'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\05_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P5.dat','D-P5'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\06_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P6.dat','D-P6'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\07_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P7.dat','D-P7'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\08_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Delta_P8.dat','D-P8'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\09_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Sum_P9.dat','S-P9'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\10_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Sum_P10.dat','S-P10'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\12_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Sum_P11.dat','S-P11'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\28March2018_EightPatchPrototype2\13_0_To_180Az_Step_1deg_Tx_NewStGainCP_Rx_Sum_P12.dat','S-P12'
    %-- 12Feb2018 Prototype2 WLR Array 04x01 ZYFD
    %          'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\01_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_P1_P2_P3_P4.dat','H-All'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\02_90Az_-45_to_45DegEl_Step_01Deg_Tx_H_Rx_H_P1_P2_P3_P4.dat','H-All-Vert'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\03_0_to_180DegAz_Step_01Deg_Tx_V_Rx_H_P1_P2_P3_P4.dat','H-All Xpol'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\04_90Az_-45_to_45DegEl_Step_01Deg_Tx_V_Rx_H_P1_P2_P3_P4.dat','H-All XPol'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\05_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port1.dat','H-P-01'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\06_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port2.dat','H-P-02'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\07_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port3.dat','H-P-03'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\08_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port4.dat','H-P-04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Prototype2_Array4x01_ZYFD\09_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port4.dat','H-P-03'
    %-- 12Feb2018 WLR Array 04x01 ZYFD
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Array4x01_ZYFD\01_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port4.dat','H-P-04'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Array4x01_ZYFD\02_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port3.dat','H-P-03'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Array4x01_ZYFD\03_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port2.dat','H-P-02'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Array4x01_ZYFD\04_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port1.dat','H-P-01'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Array4x01_ZYFD\05_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_P1_P2_P3_P4.dat','H-ALL'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\12Feb2018_Array4x01_ZYFD\06_90Az_-45_to_45DegEl_Step_01Deg_Tx_H_Rx_H_P1_P2_P3_P4.dat','H-ALL-Vert'
    %-- 09Feb2018 WLR Array 04x01 ZYFD
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\01_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port4.dat','V-P-04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\02_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port3.dat','V-P-03'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\03_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port2.dat','V-P-02'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\04_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port1.dat','V-P-01'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\05_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_P1_P2_P3_P4.dat','V-All-coPol'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\06_0_to_180DegAz_Step_01Deg_Tx_H_Rx_V_P1_P2_P3_P4.dat','V-All-xPol'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\07_0_to_180DegAz_Step_01Deg_Tx_H_Rx_V_P1_P2_P3_P4_ArrowDoorSide.dat','V-All-xPol'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\08_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_P1_P2_P3_P4_ArrowDoorSide.dat','V-All-coPol'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\09_90Az_-45_to_45DegEl_Step_01Deg_Tx_V_Rx_V_P1_P2_P3_P4_ArrowDoorSide.dat','V-All-coPol-EL'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\10_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_P1_ArrowDoorSide.dat','V-P-01-ADS'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\11_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_P2_ArrowDoorSide.dat','V-P-02-ADS'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\09Feb2018_Array4x01_ZYFD\12_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_P3_ArrowDoorSide.dat','V-P-03-ADS'
    %-- 08Feb2018 WLR Array 04x01 ZYFD
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\01_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port4.dat','H-P-04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\02_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port3.dat','H-P-03'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\03_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port2.dat','H-P-02'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\04_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_Port1.dat','H-P-01'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\05_0_to_180DegAz_Step_01Deg_Tx_H_Rx_H_P1_P2_P3_P4.dat','H-ALL-H-coPol'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\06_0_to_180DegAz_Step_01Deg_Tx_V_Rx_H_P1_P2_P3_P4.dat','H-ALL-Xpol'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\07_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_P1_P2_P3_P4.dat','V-ALL-V-coPol'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\08_0_to_180DegAz_Step_01Deg_Tx_H_Rx_V_P1_P2_P3_P4.dat','V-ALL-Xpol'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\09_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port1.dat','V-P-01'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\10_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port2.dat','V-P-02'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\11_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port3.dat','V-P-03'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\12_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port4.dat','V-P-04'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\08Feb2018_Array4x01_ZYFD\13_0_to_180DegAz_Step_01Deg_Tx_V_Rx_V_Port4.dat','V-P-04'
    
    %-- 15 Nov 2017 Eight patch prototype2 with and without radome
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\15Nov2017_EightPatchPrototype2_WithRadome\18_0_to_180_Rx_Sum_RHCP_NoRadom.dat',' \Sigma RHCP No Rad'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\15Nov2017_EightPatchPrototype2_WithRadome\33_0_to_180_Step_1deg_Rx_Sum_RHCP_NoRadom.dat',' \Sigma RHCP No Rad'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\15Nov2017_EightPatchPrototype2_WithRadome\03_0_to_180_Rx_Sum_CP.dat',' \Sigma RHCP Rad'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\15Nov2017_EightPatchPrototype2_WithRadome\21_0_to_180_Rx_Delta_RHCP_NoRadom.dat',' \Delta RHCP No Rad'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\15Nov2017_EightPatchPrototype2_WithRadome\09_0_to_180_Rx_Delta_RHCP.dat',' \Delta RHCP Rad'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\15Nov2017_EightPatchPrototype2_WithRadome\24_0_to_180_Rx_Delta_LHCP_NoRadom.dat',' \Delta LHCP No Rad'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\15Nov2017_EightPatchPrototype2_WithRadome\12_0_to_180_Rx_Delta_LHCP.dat',' \Delta LHCP Rad'
    %-- OCE 8x8 testing 12July2017
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\01_0_to_180Az_1.5El_1Step_Tx_V_Rx_V_OCE8x8.dat','OCE'  %DU
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\03_0_to_180Az_1.5El_1Step_Tx_H_Rx_H_OCE8x8.dat','OCE'%DU
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\04_0_to_360Az_1El_1Step_Tx_H_Rx_H_OCE8x8.dat','Rx-AD270,Tx-SGH'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\02_0_to_180Az_1.5El_1Step_Tx_V_Rx_H_OCE8x8.dat','AD270'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\05_0_To_180Az_1Step_Tx_H_Rx_H_FB4ME217.dat','F4BME217'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\06_0_To_180Az_1Step_Tx_H_Rx_V_FB4ME217.dat','F4BME217'
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\07_0_To_180Az_1Step_Tx_V_Rx_V_FB4ME217.dat','F4BME217'%DU
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_12July2017\08_0_To_180Az_1Step_Tx_V_Rx_V_FB4ME217.dat','F4BME217'%DU
    %-- OCE 8x8 testing 10July2017
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_10July2017\01_0_To_360Az_-3El_Rx_V_Tx_V_NSGH.dat','Rx-F4BME217,Tx-NSGH'
    % %      'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_10July2017\02_89Az_-75El_To_75El_Rx_V_Tx_V_NSGH.dat','Rx-F4BME217,Tx-NSGH' %DU
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_10July2017\03_0_To_180Az_-3El_Rx_H_Tx_V_NSGH.dat','Rx-F4BME217,Tx-NSGH'
    % % %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_10July2017\04_0_To_180Az_-2El_Rx_H_Tx_H_NSGH.dat','Rx-F4BME217,Tx-NSGH'%DU
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_10July2017\05_0_To_180Az_-2El_Rx_V_Tx_V_SGH.dat','Rx-F4BME217,Tx-SGH'
    %-- OCE 8x8 testing 07July2017
    % 'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_07July2017\01_0_to_180Az_1Step_Tx_V_Rx_V.dat','F4BME217'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_07July2017\02_86Az_-20_To_20El_1Step_Tx_V_Rx_V.dat','F4BME217'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_07July2017\03_87_to_93Az_-3_To_3El_Tx_V_Rx_V.dat','F4BME217'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_07July2017\04_88_to_92Az_-5_To_5El_Tx_V_Rx_V.dat','F4BME217'
    %-- 29 June 2017 PEEK, Composite From SRDC-L
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\12_0_To_180_Step_1_Tx_V_Rx_V.dat','Ant' %DU
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\13_0_To_180_Step_1_Tx_V_Rx_V.dat','Ant'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\05_0_To_180_Step_1_Tx_V_Rx_V_Rad_OnlyStand.dat','Ant+St'
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\06_0_To_180_Step_1_Tx_V_Rx_V_Rad_PEEK.dat','PEEK'%DU
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\07_0_To_180_Step_1_Tx_V_Rx_V_Rad_PEEK.dat','PEEK'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\08_0_To_180_Step_1_Tx_V_Rx_V_Rad_compLTh5.6mm.dat','Comp-SRDC-L-T-5.6mm'
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\09_0_To_180_Step_1_Tx_V_Rx_V_Rad_CompT5.6mm.dat','Comp-SRDC-L-T-5.6mm'%DU
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\10_0_To_180_Step_1_Tx_V_Rx_V_Rad_CompT1.4mm.dat','Comp-SRDC-L-T-1.4mm'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\PEEK_SRDCL_Comp_29June2017\11_0_To_180_Step_1_Tx_V_Rx_V_Rad_CompT1.4mm.dat','Comp-SRDC-L-T-1.4mm'   %DU
    %-- 20 June 2017 Composite material by Ahmad Bashir
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_20June2017\06_0_To_180Az_Step_1Deg_Tx_V_Rx_V.dat','Only Antenna'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_20June2017\07_80_To_100Az_Step_0.5Deg_Tx_V_Rx_V.dat','Only Antenna'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_20June2017\05_0_To_180Az_Step_1Deg_Tx_V_Rx_V_OnlyTeflonRod.dat','Teflon Rod'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_20June2017\01_0_To_180Az_Step_1Deg_Tx_V_Rx_V_RadDarkGreen.dat','Comp. Dark Green1'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_20June2017\02_0_To_180Az_Step_1Deg_Tx_V_Rx_V_RadDarkGreen.dat','Comp. Dark Green2'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_20June2017\03_0_To_180Az_Step_1Deg_Tx_V_Rx_V_RadDarkGreen.dat','Comp. Dark Green3'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_20June2017\04_0_To_180Az_Step_1Deg_Tx_V_Rx_V_RadDarkGreen19June17Cal.dat','Comp. Dark Green old CAL'
    %-- 19 June 2017 Composite material by Ahmad Bashir
    %     %%  'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\01_0_To_180Az_Step_1Deg_Tx_V_Rx_V.dat','Only Antenna' % don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\11_0_To_180Az_Step_1Deg_Tx_V_Rx_V.dat','Only Antenna'
    %     %%  'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\03_0_To_180Az_Step_1Deg_Tx_V_Rx_V_OnlyStand.dat','Acr. Stand' % don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\10_0_To_180Az_Step_1Deg_Tx_V_Rx_V_OnlyStand.dat','Acr. Stand'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\08_0_To_180Az_Step_1Deg_Tx_V_Rx_V_PTFE_01.dat','PTFE1'
    %     %%  'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\09_0_To_180Az_Step_1Deg_Tx_V_Rx_V_PTFE_02.dat','PTFE2' % don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\06_0_To_180Az_Step_1Deg_Tx_V_Rx_V_Green_01.dat','G1'
    %     %%  'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\07_0_To_180Az_Step_1Deg_Tx_V_Rx_V_Green_02.dat','G2' % don't use
    %     %%  'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\02_0_To_180Az_Step_1Deg_Tx_V_Rx_V_DarkGreenRad.dat','DG' % don't use
    %     %%  'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\04_0_To_180Az_Step_1Deg_Tx_V_Rx_V_Creem_01.dat','CR1' % don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\FromComposite_19June2017\05_0_To_180Az_Step_1Deg_Tx_V_Rx_V_Creem_02.dat','CR2'
    %-- 24 May 2017 WLR 4x4 array on FR04 no beam steering
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\24_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P01ToP04.dat','P_1 To P_4'
    %-- 24 May 2017 WLR 4x4 array on FR04 beam steering by I insertion
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\17_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P01ToP04.dat','P_1 To P_4'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\21_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P04ToP01.dat','P_4 To P_1'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\18_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P05ToP08.dat','P_5 To P_8'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\19_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P09ToP12.dat','P_9 To P_{12}'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\20_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P13ToP16.dat','P_{13} To P_{16}'
    %-- 24 May 2017 WLR 4x4 array on FR04
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\StandAt12Inch\01_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P01.dat','P01'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\WLR\PrintedDipole4x4Array_FR04\24May2017\temp\05_0_to_180Az_Step_1_Tx_H_Rx_H_intBalunUp_P01_P02_P03_P04_adjCalib.dat','sumRaw'
    %-- 22 May 2017 Lahore Radome
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\22May2017\05_0_to_180Az_Step_1_Tx_V_Rx_V.dat','Ant'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\22May2017\05_0_to_180Az_Step_1_Tx_V_Rx_V_with_foam_wood.dat','Ant+wood+foam' % at 15cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\22May2017\01_0_to_180Az_Step_1_Tx_V_Rx_V_thickRadomeAt15cm.dat','Ant+St+Rad:t = 5.6mm' % at 15cm don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\22May2017\02_0_to_180Az_Step_1_Tx_V_Rx_V_thickRadomeAt15cm.dat','Ant+w+f+Rad:t = 5.6mm' % at 15cm don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\22May2017\03_0_to_180Az_Step_1_Tx_V_Rx_V_thinRadomeAt15cm.dat','Ant+w+f+Rad:t = 1.4mm' % at 15cm don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\22May2017\04_0_to_180Az_Step_1_Tx_V_Rx_V_thinRadomeAt15cm.dat','Ant+w+f+Rad:t = 1.4mm' % at 15cm don't use
    %-- 23 May 2017 Lahore Radome
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\23May2017\05_0_to_180Az_Step_1_Tx_V_Rx_V.dat','Ant'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\23May2017\03_0_to_180Az_Step_1_Tx_V_Rx_V_OnlyAt15cmAcrylicStand.dat','Ant+St' % at 15cm
    % %   'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\23May2017\07_0_to_180Az_Step_1_Tx_V_Rx_V_OnlyAt15cmAcrylicStand.dat','Ant+St' % at 15cm don't use
    % %   'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\23May2017\04_0_to_180Az_Step_1_Tx_V_Rx_V_thickRadomeAt15cmAcrylicStand.dat','Ant+St+Rad:t = 5.6mm' % at 15cm don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\23May2017\06_0_to_180Az_Step_1_Tx_V_Rx_V_thickRadomeAt15cmAcrylicStand.dat','Ant+St+Rad:t = 5.6mm' % at 15cm
    % %   'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\23May2017\01_0_to_180Az_Step_1_Tx_V_Rx_V_thinRadomeAt15cmAcrylicStand.dat','Ant+St+Rad:t = 1.4mm' % at 15cm don't use
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\23May2017\02_0_to_180Az_Step_1_Tx_V_Rx_V_thinRadomeAt15cmAcrylicStand.dat','Ant+St+Rad:t = 1.4mm' % at 15cm
    %-- 24 May 2017 Lahore Radome Analysis
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\24May2017\01_0_to_180Az_Step_1_Tx_V_Rx_V_OnlyAntenna4x4.dat','Ant'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\24May2017\02_0_to_180Az_Step_1_Tx_V_Rx_V_OnlyAcrylicStandAt15cmAcrylicStand.dat','Ant+St' % at 15cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\24May2017\04_0_to_180Az_Step_1_Tx_V_Rx_V_ThickRadomeAt15cmAcrylicStand.dat','Ant+St+Rad:t = 5.6mm' % at 15cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeAnalysis\24May2017\03_0_to_180Az_Step_1_Tx_V_Rx_V_ThinRadomeAt15cmAcrylicStand.dat','Ant+St+Rad:t = 1.4mm' % at 15cm
    %-- 22 May 2017 RIR C Band Horn
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RIR_C_Band_HornAntenna\22May2017\01_0_To_180Az_Step_1_Tx_V_Rx_V.dat','coPol : Az Cut'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RIR_C_Band_HornAntenna\22May2017\04_0_To_180Az_Step_1_Tx_V_Rx_V.dat','coPol : Az Cut'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RIR_C_Band_HornAntenna\22May2017\05_85Az_-10_To_10El_Step_1_Tx_V_Rx_V.dat','coPol : El Cut'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RIR_C_Band_HornAntenna\22May2017\03_0_To_180Az_Step_1_Tx_H_Rx_V.dat','xPol : Az Cut'
    %--15 may 2017 4x4 antenna , lahore radome
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis15May2017\21_01_to_180Az_Step_1Deg_Tx_V_Rx_V_4x4Antenna.dat','Only Ant'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis15May2017\20_01_to_180Az_Step_1Deg_Tx_V_Rx_V_4x4AntennawithWoodSt.dat','Ant+St'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis15May2017\18_01_to_180Az_Step_1Deg_Tx_V_Rx_V_4x4AntennawithRadomeWioodSt15cmThin.dat','Ant+St+Rad:t = 1.4mm' % at 15cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis15May2017\16_01_to_180Az_Step_1Deg_Tx_V_Rx_V_4x4AntennawithRadomeWioodSt15cm.dat','Ant+St+Rad:t = 5.6mm' % at 15cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis15May2017\17_01_to_180Az_Step_1Deg_Tx_V_Rx_V_4x4AntennawithRadomeWioodSt15cm.dat','Ant+St+Rad:t = 5.6mm' % at 15cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis15May2017\07_01_to_180Az_Step_1Deg_Tx_V_Rx_V_thinRadomeFlush.dat','Ant+St+Rad:t = 1.4mm' % Flush
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis15May2017\06_01_to_180Az_Step_1Deg_Tx_V_Rx_V_thikRadomeFlush.dat','Ant+St+Rad:t = 5.6mm' % Flush
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis12May2017\07_0_to_180Az_1DegStep_Tx_V_Rx_V_4x4_x_band.dat','Only Ant'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis12May2017\09_0_to_180Az_1DegStep_Tx_V_Rx_V_4x4_x_band_withWoodWithFoam.dat','Ant+St'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis12May2017\10_0_to_180Az_1DegStep_Tx_V_Rx_V_4x4_x_band_withWoodWithFoamWithRadome1p4Thick.dat','Ant+St+Rad:t = 1.4mm' % at 3cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\RadomeSamples\16May2017\RadomeAnalysis\RadomeAnalysis12May2017\08_0_to_180Az_1DegStep_Tx_V_Rx_V_4x4_x_band_withWoodWithFoamWithRadome5p6Thick.dat','Ant+St+Rad:t = 5.6mm' % at 3cm
    %-- 27Apr2017 F4BME217 epsR 2.17 X-Band 8x8
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_27April2017\04_0_To_180Az_Step_1_Tx_V_Rx_V.dat','H-Plane'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_27April2017\08_0_To_180Az_Step_1_Tx_H_Rx_H.dat','H-Plane'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_F4BME2p17_8x8PatchArray_27April2017\09_0_To_180Az_Step_1_Tx_H_Rx_V.dat','xPol'
    %-- 27Apr2017 FR04 WLR antenna at 2.8GHz
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\SingleDipole_FR04\27Apr2017\01_0_To_180Az_Step_1_Tx_H_Rx_H.dat','H-Plane'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\SingleDipole_FR04\27Apr2017\02_0_To_180Az_Step_1_Tx_V_Rx_V.dat','E-Plane'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\WLR\SingleDipole_FR04\27Apr2017\03_0_To_180Az_Step_1_Tx_V_Rx_H.dat','xPol'
    %-- 10 Apr 2017 Eight Patch TTS Feed Prototype 02 Tx Antenna is CP
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Apr2017_EightPatchPrototype2\14_0_to_180Az_Step_1_Rx_Rotated90_SumLHCP_Tx_circCoPol.dat','\Sigma LHCP'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Apr2017_EightPatchPrototype2\16_0_to_180Az_Step_1_Rx_Rotated90_DeltaRHCP_Tx_circCoPol.dat','\Delta RHCP'
    %-- S-Band 4x4 Patch Linear antenna on FSM with 360deg rotation, Tx Standard horn antenna
    %     'F:\FAROOQUI\MEASUREMENT_DATA\S_BAND_4x4 PatchArray\22Feb2017\01_FSM_360Rot_Tx_StandardGainHorn_Rx_S_Band_4x4PatchAnt.mat','S-band 4x4 lin. Ant'
    %-- 14 Feb 2017 Eight Patch TTS Feed Prototype 02 Tx Antenna is LP
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\03_0_to_180Az_1Step_Rx_Sum_RHCP_Processed_RHCP.mat','\Sigma RHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\05_0_to_180Az_1Step_Rx_Sum_RHCP_Processed_RHCP.mat','\Sigma RHCP Az'
    % %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\08_-75_to_75El_1Step_Rx_Sum_RHCP_Processed_RHCP.mat','\Sigma RHCP El'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\25_-75_to_75El_1Step_Rx_Delta_RHCP_Processed_LHCP.mat','\Delta RHCP El'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\26_0_to_180_1Step_Rx_Delta_RHCP_Processed_LHCP.mat','\Delta RHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\13_0_to_180Az_1Step_Rx_Sum_LHCP_Processed_LHCP.mat','\Sigma LHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\14_-75_to_75El_1Step_Rx_Sum_LHCP_Processed_LHCP.mat','\Sigma LHCP El'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\19_0_to_180_1Step_Rx_Delta_LHCP_Processed_RHCP.mat','\Delta LHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\14Feb2017_EightPatchPrototype2\20_-75_to_75Az_1Step_Rx_Delta_LHCP_Processed_RHCP.mat','\Delta LHCP El'
    %-- 10 Apr 2017_EightPatchPrototype2
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Apr2017_EightPatchPrototype2\09_0_to_180Az_Step_1_Rotated90_SumRHCP.dat','\Sigma RHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Apr2017_EightPatchPrototype2\12_0_to_180Az_Step_1_Rotated90_SumLHCP.dat','\Sigma LHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Apr2017_EightPatchPrototype2\06_0_to_180Az_Step_1_Rotated90_DeltaRHCP.dat','\Delta LHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Apr2017_EightPatchPrototype2\03_0_to_180Az_Step_1_Rotated90_DeltaLHCP.dat','\Delta RHCP'
    %-- 17 July 2017_EightPatchPrototype2 see sampling rate: 2.201, 2.249, 2.3, 2.351, 2.399
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\17July2017_EightPatchPrototype2\03_0_To_180Az_Step_1_Tx_SGH_H_Rx_Sum_RHCP_CP.dat','\Sigma RHCP'  % see sampling rate
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\17July2017_EightPatchPrototype2\06_0_To_180Az_Step_1_Tx_SGH_V_Rx_Sum_LHCP_CP.dat','\Sigma LHCP'  % see sampling rate
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\17July2017_EightPatchPrototype2\09_0_To_180Az_Step_1_Tx_SGH_H_Rx_Delta_RHCP_CP.dat','\Delta RHCP'  % see sampling rate
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\17July2017_EightPatchPrototype2\12_0_To_180Az_Step_1_Tx_SGH_V_Rx_Delta_LHCP_CP.dat','\Delta LHCP'  % see sampling rate
    %-- 23 Feb 2017 Eight Patch TTS Feed Prototype 02 Tx Antenna is CP instead of LP
    % for axial ratio
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\01_FSM_360Rot_Tx_EightPathSumFeed_Rx_S_Band_4x4PatchAnt_At_85Az.mat','at 85'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\02_FSM_360Rot_Tx_EightPathSumFeed_Rx_S_Band_4x4PatchAnt_At_95Az.mat','at 95'
    %          'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\03_FSM_360Rot_Tx_EightPathSumFeed_Rx_S_Band_4x4PatchAnt_At_90Az.mat','at 90'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\04_FSM_360Rot_Tx_S_Band_4x4PatchAnt_Rx_EightPathSumFeed_At_90Az.mat','Tx Ant Linear'
    % RHCP Copolar
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\06_0_to_180Az_1Step_Tx_CP_Rx_RHCP_coPol.mat','\Sigma RHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\07_90Az_-75_to_75El_1Step_Tx_CP_Rx_RHCP_coPol.mat','\Sigma RHCP El'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\14_0_to_180Azl_1Step_Tx_CP_Rx_RHCP_coPol.mat','\Delta RHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\13_90Az_-75_to_75El_1Step_Tx_CP_Rx_RHCP_coPol.mat','\Delta RHCP El'
    %     % LHCP Copolar
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\09_0_to_180Az_1Step_Tx_CP_Rx_LHCP_coPol.mat','\Sigma LHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\10_90Az_-75_to_75El_1Step_Tx_CP_Rx_LHCP_coPol.mat','\Sigma LHCP El'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\11_0_to_180Az_1Step_Tx_CP_Rx_LHCP_coPol.mat','\Delta LHCP Az'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\12_90Az_-75_to_75El_1Step_Tx_CP_Rx_LHCP_coPol.mat','\Delta LHCP El'
    %
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\05_0_to_180Az_1Step_Tx_CP_Rx_LHCP_crossPol.mat','\-- LHCP XPol Az'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\23Feb2017_EightPatchPrototype2\08_90Az_-75_to_75El_1Step_Tx_CP_Rx_LHCP_crossPol.mat','\Sum LHCP XPol El'
    %-- 10 Feb 2017 Eight Patch TTS Feed Prototype 02
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Feb2017_EightPatchPrototype2\06_0_to_180Az_5Step_Rx_Sum_RHCP_Processed_RHCP.mat','Sum Az RHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Feb2017_EightPatchPrototype2\10_-75_to_75El_1Step_Rx_Sum_RHCP_Processed_RHCP.mat','Sum El RHCP'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Feb2017_EightPatchPrototype2\12_0_to_180Az_1Step_Rx_Sum_RHCP_Processed_RHCP.mat','Sum Az RHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Feb2017_EightPatchPrototype2\03_0_to_180Az_5Step_Rx_Delta_RHCP_Processed_LHCP.mat','Delta Az LHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Feb2017_EightPatchPrototype2\16_-75_to_75El_1Step_Rx_Delta_RHCP_Processed_LHCP.mat','Delta El LHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Feb2017_EightPatchPrototype2\18_0_to_180Az_1Step_Rx_Delta_RHCP_Processed_LHCP.mat','Delta Az LHCP'
    %-- 09 Feb 2017 Five patch prototype 02
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\Shariq_Feed_Prototype02\09Feb2017_FiveDipolePrototype2\05_0_to_180Az_1Step_IF_BW_1KHz_LHCP.mat','Delta Az LHCP'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\Shariq_Feed_Prototype02\09Feb2017_FiveDipolePrototype2\08_-75_to_75El_1Step_IF_BW_1KHz_LHCP.mat','Delta El LHCP'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\Shariq_Feed_Prototype02\09Feb2017_FiveDipolePrototype2\11_-75_to_75El_1Step_IF_BW_1KHz_RHCP.mat','Delta El RHCP'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\Shariq_Feed_Prototype02\09Feb2017_FiveDipolePrototype2\14_0_to_180Az_1Step_IF_BW_1KHz_RHCP.mat','Delta Az RHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\Shariq_Feed_Prototype02\09Feb2017_FiveDipolePrototype2\20_0_to_180Az_1Step_IF_BW_1KHz_SumPatt_Rx_RHCP.mat','Sum Az RHCP'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\Shariq_Feed_Prototype02\09Feb2017_FiveDipolePrototype2\19_-75_to_75El_1Step_IF_BW_1KHz_SumPatt_RHCP.mat','Sum El RHCP'
    %-- 13 Dec 2016 Chamber characteristic
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt13Dec2016\06_70_to_110Az_0.5Step_OCE_Ant_07_FULL_LOOP_CalPad_0_VV.mat','Ant-07,FSM+Mount'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt13Dec2016\09_70_to_110Az_0.5Step_OCE_Ant_07_FSM_NO_MOUNT_CalPad_0_VV.mat','Ant-07-FSM,No Mount'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt13Dec2016\10_0_to_180Az_1Step_OCE_Ant_07_Thermopoll_CalPad_0_VV.mat','Ant-07-No Mount-No FSM'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt13Dec2016\08_70_to_110Az_0.5Step_OCE_Ant_01_FSM_NO_MOUNT_CalPad_0_VV.mat','Ant-01-FSM-No Mount'
    % 'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt13Dec2016\07_70_to_110Az_0.5Step_OCE_Ant_01_FULL_LOOP_CalPad_0_VV.mat','Ant-01-FULL-LOOP'
    %-- 08 Dec 2016 4x4 X-Band Antenna Array with Radome Sample A1 at 5 lambda i.e. 15cm
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4X4 X_Band Array_RadomeAnalysis\4x4_X_band_08 Dec 2016_Radome\04_0_to_180Az_Nothing_CalPad_0_VV.mat','Antenna'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4X4 X_Band Array_RadomeAnalysis\4x4_X_band_08 Dec 2016_Radome\03_0_to_180Az_WithTeflonSpacerA1_CalPad_0_VV.mat','Antenna + Teflon Spacer'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4X4 X_Band Array_RadomeAnalysis\4x4_X_band_08 Dec 2016_Radome\01_0_to_180Az_WithSampleA1_CalPad_0_VV.mat','Antenna + Teflon Spacer + Radome'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4X4 X_Band Array_RadomeAnalysis\4x4_X_band_08 Dec 2016_Radome\02_89Az_70_to_-70El_WithSampleA1_CalPad_0_VV.mat','Antenna + Teflon Spacer + Radome'
    %-- 25 Nov 2016 4x4 X-Band Antenna Array with Radome
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\4x4_Array_TinCoating_X_Band_25112016_Radome\06_0_to_180_Rx_4x4_CalPad_0_VV_No_Sample.mat','No Sample'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\4x4_Array_TinCoating_X_Band_25112016_Radome\05_0_to_180_Rx_4x4_CalPad_0_VV_Sample_A01.mat','A01'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\4x4_Array_TinCoating_X_Band_25112016_Radome\01_0_to_180_Rx_4x4_CalPad_0_VV_Sample_C01.mat','C01'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\4x4_Array_TinCoating_X_Band_25112016_Radome\04_0_to_180_Rx_4x4_CalPad_0_VV_Sample_C02.mat','C02'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\4x4_Array_TinCoating_X_Band_25112016_Radome\02_90Az_-45_To_45El_Rx_4x4_CalPad_0_VV_Sample_C01.mat','C01'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\4x4_Array_TinCoating_X_Band_25112016_Radome\03_89Az_-45_To_45El_Rx_4x4_CalPad_0_VV_Sample_C01.mat','C01'
    %-- 22Nov2015 Waqas Feed with extended Gnd Plane
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\WAQAS_FEED_MEAS\Waqas Feed WithExtendedGndPlane22-Nov-16\03_0to36Az_1deg_100HzIFBW_CP_SUM.mat','SUM'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\WAQAS_FEED_MEAS\Waqas Feed WithExtendedGndPlane22-Nov-16\06_0to36Az_1deg_100HzIFBW_CP_delta.mat','Delta'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\WAQAS_FEED_MEAS\Waqas Feed WithExtendedGndPlane22-Nov-16\01_0to36Az_1deg_100HzIFBW_VV_SUM.mat','SUM T-V'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\WAQAS_FEED_MEAS\Waqas Feed WithExtendedGndPlane22-Nov-16\02_0to36Az_1deg_100HzIFBW_VH_SUM.mat','SUM T-H'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\WAQAS_FEED_MEAS\Waqas Feed WithExtendedGndPlane22-Nov-16\04_0to36Az_1deg_100HzIFBW_VV_delta.mat','Delta T-V'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\WAQAS_FEED_MEAS\Waqas Feed WithExtendedGndPlane22-Nov-16\05_0to36Az_1deg_100HzIFBW_VH_delta.mat','Delta T-H'
    %-- Antenna 07 meas comparision
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt14Oct2016\13_0to180Az_0.5DegStepAntDash07_VV.mat','Ant-07 old meas'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\07_0_to_180Az_1DegStep_Radome_OnlySpacer_VV.mat','Ant-07 new meas with spacer'
    %-- LSL
    %     'F:\FAROOQUI\MEASUREMENT_DATA\O_Subhani_widthImpedanceDsg\02232016\01_90to270Az_0.5degStep_1KHzIFBW_VV.mat',''
    %     'F:\FAROOQUI\MEASUREMENT_DATA\O_Subhani_widthImpedanceDsg\02232016\02_90to270Az_0.5degStep_1KHzIFBW_HH.mat',''
    %-- FHDR 12-07-2016
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\12072016\01_60_to_120Az_1Deg_Step_Ant_01.mat','FHDR'
    %-- Quasi Yaqi Antenna
    %-- Az Scan
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\01_60to120Az_Slotted waveguide_VV.mat','1'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\03_0to180Az_VV.mat','3'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\05_0to180Az_Sband2x2array_VV.mat','5'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\07_0to180Az_Ant1Xband Yagi_VV.mat','7'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\10_0to180Az_Ant2Xband Yagi_VV.mat','10'
    %-- Az El Scan
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\02_90to91_-35to35El_Slotted waveguide_VV.mat','2'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\04_90to91Az_-50to50El_VV.mat','4'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\06_90to91Az_-70to70El_Sband2x2array_VV.mat','6'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\08_90to91Az_-70to70El_Ant1Xband yagi_VV.mat','8'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\4 September 2015-quasiyagi_chmberresults\09_90to91Az_-70to70El_Ant2Xband yagi_VV.mat','9'
    %-- 17-Nov-2016, I+Adapter+I placement
    %--Az Cut
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\01_0_to_180Az_1DegStep_withSpacer_CalPad_0_VV.mat','No I'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\03_0_to_180Az_1DegStep_withSpacer_With_Eye_CalPad_0_VV.mat','I'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\05_0_to_180Az_1DegStep_withSpacer_With_Eye_Adapter_CalPad_0_VV.mat','I+Adapter'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\07_0_to_180Az_1DegStep_withSpacer_With_Eye_Adapter__Eye_CalPad_0_VV.mat','I+Adapter+I'
    %-- El Cut
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\02_93Az_-45_to_45El_1DegStep_withSpacer_CalPad_0_VV.mat','No I'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\04_92Az_-45_to_45El_1DegStep_withSpacer_With_Eye_CalPad_0_VV.mat','I'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\06_92Az_-45_to_45EL_1DegStep_withSpacer_With_Eye_Adapter_CalPad_0_VV.mat','I+Adapter'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016\08_92Az_-45_to_45EL_1DegStep_withSpacer_With_Eye_Adapter_Eye_CalPad_0_VV.mat','I+Adapter+I'
    %-- 16-Nov-2016, OCE 8x8 patch elemnet with different kind of radome
    %-- Az Cut
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\07_0_to_180Az_1DegStep_Radome_OnlySpacer_VV','No-Radome'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\05_0_to_180Az_1DegStep_Radome_AD270_VV','AD270'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\03_0_to_180Az_1DegStep_Radome_Acrylic_VV','Acrylic'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\01_0_to_180Az_1DegStep_Radome_FR4_VV.mat','FR-4'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\03_0_to_180Az_1DegStep_withRadome_Samp08_CalPad_0_VV.mat','Sample-08'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\05_0To_180Az_1DegStep_withRadome_Samp09_CalPad_0_VV.mat','Sample-09'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\07_0To_180Az_1DegStep_withRadome_Samp10_CalPad_0_VV.mat','Sample-10'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\09_0_To_180Az_1DegStep_withRadome_Samp11_CalPad_0_VV.mat','Sample-11'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\11_0_To_180Az_1DegStep_withRadome_Samp12_CalPad_0_VV.mat','Sample-12'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\13_0_To_180Az_1DegStep_withRadome_Samp13_CalPad_0_VV.mat','Sample-13'
    %--El Cut
    %             'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\08_91Az_-45_to_45El_1DegStep_Radome_OnlySpacer_VV','No-Radome'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\06_92Az_-45_to_45El_1DegStep_Radome_AD270_VV','AD270'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\04_92Az_-45_to_45El_1DegStep_Radome_Acrylic_VV','Acrylic'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt16Nov2016_RADOME\02_91Az_-45_to_45El_1DegStep_Radome_FR4_VV','FR-4'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\04_92Az_-45_to_45EL_1DegStep_withRadome_Samp08_CalPad_0_VV.mat','Sample-08'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\06_91Az_-45_to_45EL_1DegStep_withRadome_Samp09_CalPad_0_VV.mat','Sample-09'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\08_92Az_-45_to_45EL_1DegStep_withRadome_Samp10_CalPad_0_VV.mat','Sample-10'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\10_92Az_-45_to_45EL_1DegStep_withRadome_Samp11_CalPad_0_VV.mat','Sample-11'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\12_92Az_-45_to_45EL_1DegStep_withRadome_Samp12_CalPad_0_VV.mat','Sample-12'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\OCE\8x8 Patch\OCE_NewFabAnt17Nov2016_Radome\14_92Az_-45_to_45EL_1DegStep_withRadome_Samp13_CalPad_0_VV.mat','Sample-13'
    %-- LSL without radome 18-Nov-2016
    %         'F:\FAROOQUI\MEASUREMENT_DATA\O_Subhani_widthImpedanceDsg\LSL_18Nov2016\01_0_To_180Az_0.5DegStep_LeftConn_RightTerm_VV.mat','L-C,R-T'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\O_Subhani_widthImpedanceDsg\LSL_18Nov2016\03_0_To_180Az_0.5DegStep_LeftTerm_RightConn_VV.mat','L-T,R-C'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\O_Subhani_widthImpedanceDsg\LSL_18Nov2016\02_90Az_-70_To_70El_0.5DegStep_LeftConn_RightTerm_VV.mat','L-C,R-T'
    %         'F:\FAROOQUI\MEASUREMENT_DATA\O_Subhani_widthImpedanceDsg\LSL_18Nov2016\04_90Az_-70_To_70El_0.5DegStep_LeftTerm_RightConn_VV.mat','L-T,R-C'
    %-- FHDR With radome 15-11-2016
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\FHDR 15-11-2016\01_80_To_90Az_1DegStep_withRadome_LeftConn_RightTerm_VV.mat','01'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\FHDR 15-11-2016\02_90_To_95Az_0.1DegStep_withRadome_LeftConn_RightTerm_VV.mat','02'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\FHDR 15-11-2016\03_92.3Az_-5_to_5El_0.1DegStep_withRadome_LeftConn_RightTerm_VV.mat','03'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\FHDR 15-11-2016\04_0_To_180Az_0.5DegStep_withRadome_LeftConn_RightTerm_VV.mat','L-C,R-T'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\FHDR 15-11-2016\06_0_To_180Az_1DegStep_withRadome_LeftTerm_RightConn_VV.mat','L-T,R-C'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\FHDR 15-11-2016\05_92.3Az_-45_to_45El_0.5DegStep_withRadome_LeftConn_RightTerm_VV.mat','L-C,R-T'
    %     'F:\FAROOQUI\MEASUREMENT_DATA\FHDR\FHDR 15-11-2016\07_93Az_-45_to_45El_0.5DegStep_withRadome_LeftTerm_RightConn_VV.mat','L-T,R-C'
    %--
    %         '13_93.6Az_-3To3El_0.1DegStep_Ant01_07_06_04_calPat_6.875_VV.mat','2x2 Array'
    %         '03_91.7Az_-3to3El_0.1DegStep_Ant01_calPat_0_VV.mat','Ant-01'
    %         '05_91.8Az_-3to3El_0.1DegStep_Ant04_calPat_0_VV.mat','Ant-04'
    %         '07_92Az_-3to3El_0.1DegStep_Ant06_calPat_0_VV.mat','Ant-06'
    %         '09_92.2Az_-3to3El_0.1DegStep_Ant07_calPat_0_VV.mat','Ant-07'
    };
lineWidth = 1;
AZ_SCAN = 1;
EL_SCAN = 2;
AZ_EL_SCAN = 3;
if isempty(plotList)
    totPlot = (1:1:size(fileNameList,1));
else
    totPlot = plotList;
end
for pInd = totPlot
    if isempty(measDataPath)
        [filePathStr,fileNameStr,fileExt]  = fileparts(fileNameList{pInd,1});
        if exist([filePathStr '\' fileNameStr '.mat'],'file')
            load([filePathStr '\' fileNameStr '.mat']) % it will load these variable [mag,phaseDeg,hPosDeg,vPosDeg,hvPosDeg,freq]
        else % convert it to that mat format for the later use it would be fast
            fprintf(1,'Converting the file in mat format:....\n\n');
            [mag,phaseDeg,hPosDeg,vPosDeg,hvPosDeg,freq] = f_GetSRDCK_AnchChamData(fileNameList{pInd,1});
            save([ filePathStr '\' fileNameStr '.mat',],'mag','phaseDeg','hPosDeg','vPosDeg','hvPosDeg','freq');
        end
    else
        load([measDataPath fileNameList{pInd,1}]) % it will load these variable [mag,phaseDeg,hPosDeg,vPosDeg,hvPosDeg,freq]
    end
    mag;phaseDeg;vPosDeg;hvPosDeg;freq;hPosDeg;
    
    pColor = f_GetColorList();
    lineStyle = {'-','--','-.','--','-.','-.','-.','-.','-','--','-.','--','-.','-.','-.','-.'};
    if unique(diff(vPosDeg(1,:))) == 0
        SCAN_SELECTION = AZ_SCAN; % OPTIONS: AZ_SCAN, EL_SCAN, AZ_EL_SCAN
    elseif unique(diff(hPosDeg(1,:))) == 0
        SCAN_SELECTION = EL_SCAN;
    else
        SCAN_SELECTION = AZ_EL_SCAN;
    end
    switch SCAN_SELECTION
        case AZ_SCAN
            if ~isempty(circPol)
                switch circPol
                    case 'LHCP'
                        REG_SEL = 3;
                    case 'RHCP'
                        REG_SEL = 4;
                end
            else
                REG_SEL = size(mag,1);
            end
            magRaw      = squeeze(mag     (1,:,:));
            phaseDegRaw = squeeze(phaseDeg(1,:,:));%             phaseDeg  = squeeze(phaseDeg(REG_SEL,:,:));
            mag         = squeeze(mag     (REG_SEL,:,:));
            phaseDeg    = squeeze(phaseDeg(REG_SEL,:,:));%             phaseDeg  = squeeze(phaseDeg(REG_SEL,:,:));
            vPosDeg     = vPosDeg         (REG_SEL,:);
            hvPosDeg    = hvPosDeg        (REG_SEL,:);
            freq        = squeeze(freq    (REG_SEL,:,:));
            hPosDeg     = squeeze(hPosDeg (REG_SEL,:));
            
            
            [sharedVals,reqInd] = intersect(freq(1,:)/1e9 ,freqVal);
            FREQ_IND = reqInd;
            [maxGain,maxGainInd] = max(20*log10(abs(mag(:,FREQ_IND)))); % max gain at azimuth cut
            % AZ_POS_DEG = 92; % it is used to plot the gain flateness plot/frequency response
            % EL_POS_DEG = 0;
            EL_POS_DEG = unique(vPosDeg);
            if isempty(AZ_POS_DEG_MANUAL)
                AZ_POS_DEG = hPosDeg(maxGainInd);
            else
                AZ_POS_DEG = AZ_POS_DEG_MANUAL;
            end
            hPOS_IND   = find(hPosDeg==AZ_POS_DEG);
            
            figure(1),
            [maxGainAtFreq,maxGainInd] = max(20*log10(abs(mag(hPOS_IND,:))));
            maxGainFreq = freq(hPOS_IND,maxGainInd)*1e-9;
            legStr = sprintf('%s: G_{max}:%.1fdB, At Freq:%.3fGHz, Pos(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGainAtFreq,maxGainFreq,AZ_POS_DEG,EL_POS_DEG);
            plot(freq(hPOS_IND,:)*1e-9,20*log10(abs(mag(hPOS_IND,:))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('frequency [GHz]');ylabel('Gain [dB]');title(sprintf('Gain flatness'));
            legend('show');legend('Location','South');axis tight
            
            %             legStr = sprintf('%s: G_{max}:%.1fdB, At Freq:%.3fGHz, Pos(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGainAtFreq,maxGainFreq,AZ_POS_DEG,EL_POS_DEG);
            %             f_UpdateLegend(legStr,1,'South');drawnow;axis tight
            
            % set(gca,'XLim',[2.1 2.5],'YLim',[-20 10.5]);
            
            figure(2),
            legStr = sprintf('%s: G_{max}:%.1fdB, At:(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGain,AZ_POS_DEG,EL_POS_DEG);
            plot(hPosDeg,20*log10(abs(mag(:,FREQ_IND))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('\phi [deg]');ylabel('Gain [dB]');title(sprintf('Az cut at EL :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal))
            %[sideLobeLevel,sideLobeLevelAtThetaDeg]  = f_GetSideLobeLevel(20*log10(abs(mag(:,FREQ_IND))),hPosDeg);
            %[maxG_Val,X_dBBeamWidth,maxG_At_Theta] = f_GetX_dB_BW(hPosDeg,20*log10(abs(mag(:,FREQ_IND))),-3);
            %legStr = sprintf('%s: G_{max}:%.1fdB, At:%.1f^o, 3dB_{BW}:%0.1f^o',fileNameList{pInd,2},maxG_Val,maxG_At_Theta,X_dBBeamWidth);
            legend('show');legend('Location','South');axis tight
            %             f_UpdateLegend(legStr,1,'South');drawnow;axis tight
            %         set(gca,'XLim',[-90 90]);
            
            
            %
            figure(3),
            legStr = sprintf('%s: G_{max}:%.1fdB, At:(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGain,AZ_POS_DEG,EL_POS_DEG);
            plot(hPosDeg,20*log10(abs(magRaw(:,FREQ_IND))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('\phi [deg]');ylabel('RAW |S_{21}| [dB]');title(sprintf('Az cut at EL :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal))
            legend('show');legend('Location','South');axis tight
            %             f_UpdateLegend(legStr,1,'South');drawnow;axis tight
            
            figure(4),
            legStr = sprintf('%s: G_{max}:%.1fdB, At:(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGain,AZ_POS_DEG,EL_POS_DEG);
            plot(hPosDeg,phaseDeg(:,FREQ_IND),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('\phi [deg]');ylabel('RAW <S_{21} [deg]');title(sprintf('Az cut at EL :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal))
            legend('show');legend('Location','South');axis tight
            %             f_UpdateLegend(legStr,1,'South');drawnow;axis tight
            
            
            figure(5)
            thetaVec = (hPosDeg*pi/180).';
            rhoVec = 20*log10(abs(mag(:,FREQ_IND)));
            hPolar = polar(thetaVec,rhoVec);grid on; hold on
            set(hPolar,'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth);
            title(sprintf('Az cut at EL :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal));drawnow;axis tight
            
            figure(6),
            legStr = sprintf('%s: G_{max}:%.1fdB, At:(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGain,AZ_POS_DEG,EL_POS_DEG);
            plot(hPosDeg,rad2deg(unwrap(deg2rad(phaseDeg(:,FREQ_IND)))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('\phi [deg]');ylabel('RAW <S_{21} [deg]');title(sprintf('Az cut at EL :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal))
            legend('show');legend('Location','South');axis tight
            
            figure(7),
            %             [maxPhaseAtFreq,maxPhaseInd] = phaseDeg(hPOS_IND,FREQ_IND);
            %             maxPhaseFreq = freq(hPOS_IND,FREQ_IND)*1e-9;
            legStr = sprintf('%s: <S_{21}:%.1fdeg, At Freq:%.3fGHz, Pos(%.1f^o,%.1f^o)',fileNameList{pInd,2},phaseDeg(hPOS_IND,FREQ_IND),freqVal,AZ_POS_DEG,EL_POS_DEG);
            plot(freq(hPOS_IND,:)*1e-9,rad2deg(unwrap(deg2rad(phaseDeg(hPOS_IND,:)))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('frequency [GHz]');ylabel('<S_{21} [deg]');title(sprintf('Phase flatness'));
            legend('show');legend('Location','South');axis tight
            
            expMatFreq = [freq(hPOS_IND,:)*1e-9;mag(hPOS_IND,:);phaseDeg(hPOS_IND,:)].';
            phaseInfoCell = [phaseInfoCell;{fileNameList{pInd,2},phaseDeg(hPOS_IND,FREQ_IND),freqVal,AZ_POS_DEG,EL_POS_DEG}]
            
            if PLOT_360 == 1
                reqPosDegInd = find(hPosDeg>270);
                mag_dB_360Adj = 20*log10(abs([mag(272:end,FREQ_IND);mag(1:271,FREQ_IND)]));
                figure(5)
                plot(hPosDeg-180,mag_dB_360Adj,'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth);grid on;hold on;
                xlabel('\phi [deg]');ylabel('Gain [dB]');title(sprintf('Az cut at EL :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal))
                %[sideLobeLevel,sideLobeLevelAtThetaDeg]  = f_GetSideLobeLevel(20*log10(abs(mag(:,FREQ_IND))),hPosDeg);
                %[maxG_Val,X_dBBeamWidth,maxG_At_Theta] = f_GetX_dB_BW(hPosDeg,20*log10(abs(mag(:,FREQ_IND))),-3);
                %legStr = sprintf('%s: G_{max}:%.1fdB, At:%.1f^o, 3dB_{BW}:%0.1f^o',fileNameList{pInd,2},maxG_Val,maxG_At_Theta,X_dBBeamWidth);
                legStr = sprintf('%s: G_{max}:%.1fdB, At:(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGain,AZ_POS_DEG,EL_POS_DEG);
                f_UpdateLegend(legStr,1,'South');drawnow;axis tight
                %         set(gca,'XLim',[-90 90]);
            end
            %-- Export data
            s21 = mag(:,FREQ_IND) .* exp(1j*deg2rad(phaseDeg(:,FREQ_IND)));
            s21Raw = magRaw(:,FREQ_IND) .* exp(1j*deg2rad(phaseDegRaw(:,FREQ_IND)));
            expMat = [hPosDeg(:) (20*log10(abs(mag(:,FREQ_IND)))) mag(:,FREQ_IND) phaseDeg(:,FREQ_IND) magRaw(:,FREQ_IND) phaseDegRaw(:,FREQ_IND)];
            AzElPosDeg = [AZ_POS_DEG EL_POS_DEG];
            
        case EL_SCAN
            if ~isempty(circPol)
                switch circPol
                    case 'LHCP'
                        REG_SEL = 3;
                    case 'RHCP'
                        REG_SEL = 4;
                end
            else
                REG_SEL = size(mag,1);
            end
            
            magRaw       = squeeze(mag     (1,:,:));
            phaseDegRaw  = squeeze(phaseDeg(1,:,:));%phaseDeg  = squeeze(phaseDeg(REG_SEL,:,:));
            mag          = squeeze(mag     (REG_SEL,:,:));
            phaseDeg     = squeeze(phaseDeg(REG_SEL,:,:));
            vPosDeg      = vPosDeg         (REG_SEL,:);
            hvPosDeg     = hvPosDeg        (REG_SEL,:);
            freq         = squeeze(freq    (REG_SEL,:,:));
            hPosDeg      = squeeze(hPosDeg (REG_SEL,:));
            
            AZ_POS_DEG = unique(hPosDeg);
            [sharedVals,reqInd] = intersect(freq(1,:)/1e9 ,freqVal);
            FREQ_IND = reqInd;
            [maxGain,maxGainInd] = max(20*log10(abs(mag(:,FREQ_IND)))); % max gain at Elevation cut
            EL_POS_DEG = vPosDeg(maxGainInd);
            vPOS_IND   = find(vPosDeg==EL_POS_DEG);
            
            figure(1),
            [maxGainAtFreq,maxGainInd] = max(20*log10(abs(mag(vPOS_IND,:))));
            maxGainFreq = freq(vPOS_IND,maxGainInd)*1e-9;
            legStr = sprintf('%s: G_{max}:%.1fdB, At Freq:%.3fGHz, Pos(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGainAtFreq,maxGainFreq,AZ_POS_DEG,EL_POS_DEG);
            plot(freq(vPOS_IND,:)*1e-9,20*log10(abs(mag(vPOS_IND,:))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('frequency [GHz]');ylabel('Gain [dB]');title(sprintf('Gain flatness'));
            legend('show');legend('Location','South');axis tight
            
            %             f_UpdateLegend(legStr,1,'South');drawnow;axis tight
            % set(gca,'XLim',[2.1 2.5],'YLim',[-20 10.5]);
            
            figure(2),
            legStr = sprintf('%s: G_{max}:%.1fdB, At:(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGain,AZ_POS_DEG,EL_POS_DEG+90);
            plot(vPosDeg,20*log10(abs(mag(:,FREQ_IND))),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('\theta [deg]');ylabel('Gain [dB]');title(sprintf('El cut at Az :%0.1f^o,Freq:%0.3f GHz',AZ_POS_DEG,freqVal))
            %[sideLobeLevel,sideLobeLevelAtThetaDeg]  = f_GetSideLobeLevel(20*log10(abs(mag(:,FREQ_IND))),vPosDeg);
            %[maxG_Val,X_dBBeamWidth,maxG_At_Theta] = f_GetX_dB_BW(vPosDeg,20*log10(abs(mag(:,FREQ_IND))),-3);
            %legStr = sprintf('%s: G_{max}:%.1fdB, At:%.1f^o, 3dB_{BW}:%0.1f^o,SLL:%0.1fdB',fileNameList{pInd,2},maxG_Val,maxG_At_Theta,X_dBBeamWidth,sideLobeLevel);
            
            %             f_UpdateLegend(legStr,1,'South');drawnow;axis tight
            legend('show');legend('Location','South');axis tight
            
            phaseAt = 0;
            phaseInd = find(vPosDeg == phaseAt);
            figure(3),
            legStr = sprintf('%s: G_{max}:%.1fdB,<%.1f^o At:(%.1f^o,%.1f^o)',fileNameList{pInd,2},maxGain,phaseDeg(phaseInd,FREQ_IND),AZ_POS_DEG,EL_POS_DEG);
            plot(vPosDeg,phaseDeg(:,FREQ_IND),'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth,'DisplayName',legStr);grid on;hold on;
            xlabel('\theta [deg]');ylabel('RAW <S_{21} [deg]');title(sprintf('El cut at Az :%0.1f^o,Freq:%0.3f GHz',AZ_POS_DEG,freqVal))
            legend('show');legend('Location','South');axis tight
            
            %             f_UpdateLegend(legStr,1,'South');drawnow;axis tight
            
            figure(4)
            thetaVec = (vPosDeg*pi/180).';
            rhoVec = 20*log10(abs(mag(:,FREQ_IND)));
            hPolar = polar(thetaVec,rhoVec);grid on; hold on;
            set(hPolar,'Color',pColor(pInd,:),'LineStyle',lineStyle{pInd},'LineWidth',lineWidth);
            title(sprintf('El cut at Az :%0.1f^o,Freq:%0.3f GHz',EL_POS_DEG,freqVal));drawnow;axis tight
            
            %-- Export data
            s21    = mag(:,FREQ_IND) .* exp(1j*deg2rad(phaseDeg(:,FREQ_IND)));
            s21Raw = magRaw(:,FREQ_IND) .* exp(1j*deg2rad(phaseDegRaw(:,FREQ_IND)));
            expMat = [vPosDeg(:) (20*log10(abs(mag(:,FREQ_IND)))) mag(:,FREQ_IND) phaseDeg(:,FREQ_IND) magRaw(:,FREQ_IND) phaseDegRaw(:,FREQ_IND)];
            AzElPosDeg = [AZ_POS_DEG EL_POS_DEG];
            
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
end
if EXPORT_DATA_TXT
    %     [filePathStr,fileNameStr,fileExt]  = fileparts(fileNameList{pInd,1});
    txtFileName = sprintf('%s\\%s_%0.3fGHz_Az_%.1fDeg_El_%0.1fDeg.txt',filePathStr,fileNameStr,freqVal,AzElPosDeg(1),AzElPosDeg(2));
    fid = fopen(txtFileName,'w');
    fprintf(fid,'%% FILE INFO:\n');
    fprintf(fid,'%% This text file Created On:%s\n',f_DateTimeString());
    fprintf(fid,'%% File Path:%s\n',filePathStr);
    fprintf(fid,'%% File Name:%s\n',fileNameStr);
    fprintf(fid,'%% File Extension::%s\n',fileExt);
    fprintf(fid,'%% Frequency[GHz]:%f\n',freqVal);
    fprintf(fid,'%% Azimuth Cut/Max[Deg]:%f\n',AzElPosDeg(1));
    fprintf(fid,'%% Elevation Cut/Max[Deg]:%f\n',AzElPosDeg(2));
    fprintf(fid,'%% Convert complex number using mag and phase info: max.*exp(1j*deg2rad(phaseDeg))\n');
    %       s21 = mag(:,FREQ_IND) .* exp(1j*deg2rad(phaseDeg(:,FREQ_IND)));
    fprintf(fid,'%% Col1: Angle[deg], col2: 20*log10(abs(s21)), col3: |s21|, col4: <s21[deg], col5: |s21-RAW|, col6: <s21-RAW[deg]\n');
    fclose(fid);
    dlmwrite(txtFileName,expMat,'-append','delimiter',' ')
    
    txtFreqFileName = sprintf('%s\\%s_%0.3fGHz_Az_%.1fDeg_El_%0.1fDeg_FREQ.txt',filePathStr,fileNameStr,freqVal,AzElPosDeg(1),AzElPosDeg(2));
    fid = fopen(txtFreqFileName,'w');
    fprintf(fid,'%% FILE INFO:\n');
    fprintf(fid,'%% This text file Created On:%s\n',f_DateTimeString());
    fprintf(fid,'%% File Path:%s\n',filePathStr);
    fprintf(fid,'%% File Name:%s\n',fileNameStr);
    fprintf(fid,'%% File Extension::%s\n',fileExt);
    fprintf(fid,'%% Frequency[GHz]:%f\n',freqVal);
    fprintf(fid,'%% Azimuth Cut/Max[Deg]:%f\n',AzElPosDeg(1));
    fprintf(fid,'%% Elevation Cut/Max[Deg]:%f\n',AzElPosDeg(2));
    fprintf(fid,'%% Col1: Freq, col2: s21 mag[linear], col3: s21 phase[deg]\n');
    fclose(fid);
    dlmwrite(txtFreqFileName,expMatFreq,'-append','delimiter',' ')
    
    
    fprintf(1,'\n DATA HAVE BEEN EXPORTED IN TXT FORMAT\n');
end
% close all;
clear all;clc
addpath(genpath('F:\FAROOQUI\FAROOQUI_TOOLS'))
measDataPath = 'F:\FAROOQUI\MEASUREMENT_DATA\TTS\AnechoicChamber\EightPatch_Prototype02\10Apr2017_EightPatchPrototype2';
dirInfo = dir([ measDataPath '\*.dat']);

for dirInd = 1:length(dirInfo)
    datFileName = dirInfo(dirInd).name;
    fprintf(1,'-----------------------------------------------------------------File Number:%d, Out of %d, File Name:%s',dirInd,length(dirInfo),datFileName)
    [mag,phaseDeg,hPosDeg,vPosDeg,hvPosDeg,freq] = f_GetSRDCK_AnchChamData([measDataPath '\' datFileName]);
    save([ measDataPath '\' datFileName(1:end-4) '.mat',],'mag','phaseDeg','hPosDeg','vPosDeg','hvPosDeg','freq');
end
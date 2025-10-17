close all;clear all;clc;
%addAllMyPath_130_192_36_244
addpath(genpath('D:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS'))
% dirPath     = 'D:\CNR\Oscar Peverini\LSPE\Measurement\SinlePlateMeas\FILE_FILES\';
dirPath     = 'C:\Users\Farooqui\Dropbox\PhD\PhD_Dissertation\FAROOQUI\PhD_Dissertation\TOPICS\Polarizer_Design\Pol_Design_DFS\';

%--
fullGsPath  = 'C:\Program Files (x86)\GPLGS\gswin32c.exe';
orientation = 0;
dirInfo = dir([ dirPath '*.fig' ]);
for dirInd = 1:length(dirInfo)
    figName = dirInfo(dirInd).name;
    hFig    = hgload([ dirPath figName ]);
    figName = strtok(figName,'.');
    print(hFig, '-depsc2', '-r300',[ dirPath figName '.eps']);
    [result,msg] = eps2pdf([ dirPath figName '.eps'],fullGsPath,orientation);
end

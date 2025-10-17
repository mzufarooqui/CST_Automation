close all;clear all;clc;
figFilePath = 'E:\CNR\Oscar Peverini\Q-Band_OMT\QC200 Vision';
pdfFileName = 'Q_Band_OMT_09_Geom_Layer_1_to_9';
dirInfo = dir([ figFilePath '\*.fig' ]);
for dirInd = 1:size(dirInfo,1)
    figFileName = [figFilePath '\' dirInfo(dirInd).name];
    hgload(figFileName);
end
f_SavePDF(pdfFileName)

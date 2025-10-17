function [freq,CalPAD,lossA,lossB] = f_GetSRDCK_ChamCalibData(fileName)
% Written by : Dr. Muhammad Zunnoorain Farooqui(Mgr TSTC Dte, SETC)
% Date       : 31-May-2017
fid = fopen(fileName,'r');
[pathstr,name,ext] = fileparts(fileName);
fprintf(1,'\n File Name: %s%s',name,ext);
fprintf(1,'\n');
for ind = 1:24 % SKIP these lines
    skipLine = fgetl(fid);    
end

strFreq            = fgetl(fid);
strFreq(1:5)       = [];
strFreq(end-1:end) = [];
freq               = str2num(strFreq);
skipLine  = fgetl(fid); % Skip Line
strCalPad = fgetl(fid); 
CalPAD    = str2num(strCalPad(12:end-1));

skipLine  = fgetl(fid); % Skip Line
strLossA  = fgetl(fid); 
strLossA(1:5)       = [];
strLossA(end-1:end) = [];
lossA  = str2num(strLossA);

skipLine  = fgetl(fid); % Skip Line
skipLine  = fgetl(fid); % Skip Line
strLossB  = fgetl(fid); 
strLossB(1:5)       = [];
strLossB(end-1:end) = [];
lossB  = str2num(strLossB);

fclose(fid);
end
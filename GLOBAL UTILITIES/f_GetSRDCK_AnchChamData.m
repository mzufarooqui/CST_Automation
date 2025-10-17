function [measMag,measPhase,hPosDeg,vPosDeg,hvPosDeg,freq] = f_GetSRDCK_AnchChamData(fileName)
% Written by : Dr. Muhammad Zunnoorain Farooqui(Mgr TSTC Dte, SETC)
% Date       : 03-Dec-2015
% First index is register number
% Horiz(Scan along columns) mean freq points
% Vert(Scan along rows) mean position points
fid = fopen(fileName,'r');
fprintf(1,'\n -------- FILE INFO START --------');
[pathstr,name,ext] = fileparts(fileName);
fprintf(1,'\n File Name: %s%s',name,ext);
for ind = 1:4
    sLineReg{ind} = fgetl(fid);
    fprintf(1,'\n %s',sLineReg{ind});
end
fprintf(1,'\n -------- FILE INFO END --------\n');

regCnt = 1;
for ind = 2:4
    regStrCount = sLineReg{1,ind}(1:3);
    if strcmp(regStrCount,'REG')
        regCnt = regCnt + 1;
    end
end

for regInd = 1:regCnt
    
    cLine = [];
    pLine = [];
    while ~strcmpi(pLine,' (data ') & ~strcmpi(cLine,' (record ')
        
        if strfind(pLine,'(Record') & strfind(cLine,'(numDims 1)')
            cLine = fgetl(fid);
            numPts = str2num(cLine(7:end-1));
        end
        pLine = cLine;
        cLine = fgetl(fid);
    end
    
    cLine = [];
    magCnt  = 1;
    phCnt   = 1;
    freqCnt = 1;
    hPosCnt = 1;
    vPosCnt = 1;
    hvCnt   = 1;
    
    while freqCnt <= numPts
        %-- Read Mag
        cLine = fgetl(fid);
        measMag(regInd,magCnt,:) = str2num(fgetl(fid));
        magCnt = magCnt + 1;
        skipLine = fgetl(fid);
        %-- Read Phase
        cLine = fgetl(fid);
        measPhase(regInd,phCnt,:) = str2num(fgetl(fid));
        phCnt = phCnt + 1;
        skipLine = fgetl(fid);
        %-- Read HPos
        cLine = fgetl(fid);
        hPosDeg(regInd,hPosCnt,:) = str2num(cLine(12:end-1));
        hPosCnt = hPosCnt + 1;
        %-- Read VPos
        cLine = fgetl(fid);
        vPosDeg(regInd,vPosCnt,:) = str2num(cLine(12:end-1));
        vPosCnt = vPosCnt + 1;
        %-- Read HV
        cLine = fgetl(fid);
        hvPosDeg(regInd,hvCnt,:) = str2num(cLine(11:end-1));
        hvCnt = hvCnt + 1;
        %-- Read Freq
        cLine = fgetl(fid);
        freq(regInd,freqCnt,:) = str2num(fgetl(fid));
        freqCnt = freqCnt + 1;
        skipLine = fgetl(fid);
        
        skipLine = fgetl(fid); % skip )
        skipLine = fgetl(fid); % skip (record
    end
    skipLine = fgetl(fid); % skip )
end
fclose(fid);
end
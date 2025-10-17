function f_EditAntennaArraySetup(oProject,fileName)
fid   = fopen(fileName,'r');
tLine = fgetl(fid);
tLine = fgetl(fid);
nElem = str2num(tLine);
for ind = 1:5
    tLine = fgetl(fid);
end
cellArray = cell(1,nElem);
for ind = 1:nElem
    tLine = fgetl(fid);
    arrayPos = sscanf(tLine,'%fmm 	%fmm 	%fmm 	%fmV 	%fdeg');
    xPos     = arrayPos(1)*1e-3;
    yPos     = arrayPos(2)*1e-3;
    zPos     = arrayPos(3)*1e-3;
    Amp      = arrayPos(4)*1e-3;
    Ph       = deg2rad(arrayPos(5));
    cellArray{ind} = {['NAME:Cell_' num2str(ind)], 'XCoord:=',xPos, 'YCoord:=', yPos, 'ZCoord:=', zPos, 'Amplitude:=', Amp, 'Phase:=',Ph};
end
fclose(fid);
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('RadField');
invoke(oModule,'EditAntennaArraySetup',{'NAME:ArraySetupInfo', 'UseOption:=','CustomArray',{'NAME:CustomArray', 'NumCells:=', nElem, ['NAME:Cell', cellArray]}});
end
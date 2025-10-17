if 0
close all;clear all;clc;
addpath(genpath('F:\FAROOQUI\FAROOQUI_TOOLS'));
%-- Open CST MWS
oCST_Studio = f_OpenCST_StudioSuit();
oMWS = f_OpenCST_MWS_Project(oCST_Studio,['G:\FAROOQUI3\WLR\printed_dipole_with_integrated_balun_FR4_AT_3GHz_FINAL__VERSION_2017_CST.cst']);
end

hfssFileName = 'hfssAntennaArrayCoord.txt';
arrayType = 'Triangular'; %OPTION: 'Rectangular','Triangular'
f0 = 2.8;
thetaDegMax = 10;
phiDegMax = 45;
nXElem = 32;
nYElem = 32;
xSpacing = 50;
ySpacing = 67;
%-- Generate Array Coordinates
vX = [0:xSpacing:(nXElem-1)*xSpacing];
vY = [0:ySpacing:(nYElem-1)*ySpacing];
[nXGrid,nYGrid] = meshgrid(vX,vY);
if strcmp(arrayType,'Triangular')
    nXGrid(2:2:end,:) = nXGrid(2:2:end,:)+xSpacing/2;
end
plot(nXGrid,nYGrid,'ob');grid on;axis tight
xlabel('X Eelem. Spacing [mm]')
ylabel('Y Eelem. Spacing [mm]')
title(sprintf('xElem %d, yElem %d, X Spac. %.1fmm, Y Spac. %.1fmm',nXElem,nYElem,xSpacing,ySpacing));
x = nXGrid(:);
y = nYGrid(:);
%-- Calculate excitation coefficient
VCoeff = f_compute_Vcoeff(x,y,f0,thetaDegMax,phiDegMax);
%-- Update
oFarfieldArray = oMWS.invoke('FarfieldArray');
oFarfieldArray.invoke('Reset');
oFarfieldArray.invoke('UseArray','true');
oFarfieldArray.invoke('DeleteList');
oFarfieldArray.invoke('ClearAntennaItems');
oFarfieldArray.invoke('Arraytype','edit');
fid = fopen(hfssFileName,'w');
fprintf(fid,'! first line is a count of cells');
fprintf(fid,'\n%d',numel(x));
fprintf(fid,'\n! then [x,y,z] position of each cell');
fprintf(fid,'\n! and amplitude and phase');
fprintf(fid,'\n! default units for position are model units');
fprintf(fid,'\n! default units for amplitude is Volts');
fprintf(fid,'\n! default units for phase is radians');
for antennaInd = 1:numel(x)
    oFarfieldArray.invoke('Antenna',x(antennaInd),y(antennaInd),0,1,angle(VCoeff(antennaInd))*180/pi); % x,y,z,amplitude,phase
    fprintf(fid,'\n%fmm \t%fmm \t%fmm \t%fmV \t%fdeg',x(antennaInd),y(antennaInd),0,abs(VCoeff(antennaInd)),angle(VCoeff(antennaInd))*180/pi);
end
fclose(fid);

%-- Set Farfields Parameters
oFarField.plotType        = '3d'; % '2d','cartesian';
oFarField.plotMode        = 'gain';%'directivity';
oFarField.origin          = 'zero'; % bbox,zero,free
oFarField.step            = 1;
oFarField.step2           = 1;
oFarField.dBUnit          = -1;
oFarField.bSetTheta360    = 'True';
oFarField.bSymmetricRange = 'True';
f_SetFarfieldsParameter(oMWS,oFarField);
oMWS.invoke('SelectTreeItem','Probes');
oMWS.invoke('SelectTreeItem','Farfields\farfield (f=2.8) [1]');
% oMWS.invoke('GetSelectedTreeItem')
% f_SaveFarfields(oMWS,[pwd '\exportDataCST_ArrayFromSE']);

dirPath = 'G:\FAROOQUI3\WLR\';
fileNameStr = sprintf('%sAT_%s_f0_%.1fGHz_theta_%0.1fDeg_phi_%0.1fDeg',dirPath,arrayType,f0,thetaDegMax,phiDegMax);
oASCIIExport = oMWS.invoke('ASCIIExport');
fileNameWithPath = [ fileNameStr '.txt'];
oASCIIExport.invoke('Reset');
oASCIIExport.invoke('FileName',fileNameWithPath);
oASCIIExport.invoke('Execute');
f_StoreViewInBmpFile(oMWS,[strrep(fileNameStr,'.','p') '_3D.png'])
if 0
%-- Set Farfields Parameters
oFarField.plotType        = 'cartesian'; % '2d','cartesian';
oFarField.plotMode        = 'gain';%'directivity';
oFarField.origin          = 'zero'; % bbox,zero,free
oFarField.step            = 1;
oFarField.step2           = 1;
oFarField.dBUnit          = -1;
oFarField.phi             = phiDegMax;
oFarField.bSetTheta360    = 'True';
oFarField.bSymmetricRange = 'True';
f_SetFarfieldsParameter(oMWS,oFarField);
oMWS.invoke('SelectTreeItem','Probes');
oMWS.invoke('SelectTreeItem','Farfields\farfield (f=2.8) [1]');
f_StoreViewInBmpFile(oMWS,[strrep(fileNameStr,'.','p') '_cart.png'])
end
close all;clear all;clc;
addpath(genpath('E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS'))
load('nineElemArrayCoord')
oCST_Studio = f_OpenCST_StudioSuit();
oMWS = f_OpenCST_MWS_Project(oCST_Studio,[pwd '\vivaldiSubArray_EE_1.cst']);

oFarfieldArray = oMWS.invoke('FarfieldArray');
oFarfieldArray.invoke('Reset');
oFarfieldArray.invoke('UseArray','true');
oFarfieldArray.invoke('DeleteList');
%oFarfieldArray.invoke('SetList');
oFarfieldArray.invoke('Arraytype','edit');

for antennaInd = 1:numel(x)
    oFarfieldArray.invoke('Antenna',x(antennaInd),y(antennaInd),0,1,0); % x,y,z,amplitude,phase      
end

%-- Set Farfields Parameters
oFarField.plotType        = '3d'; % '2d','cartesian';
oFarField.plotMode        = 'gain';%'directivity';
oFarField.origin          = 'zero'; % bbox,zero,free
oFarField.step            = 1;
oFarField.step2           = 1;
oFarField.dBUnit          = -1;
oFarField.bSetTheta360    = 'False';
oFarField.bSymmetricRange = 'False';
f_SetFarfieldsParameter(oMWS,oFarField);
f_SaveFarfields(oMWS,[pwd '\exportDataCST_ArrayFromSE']);
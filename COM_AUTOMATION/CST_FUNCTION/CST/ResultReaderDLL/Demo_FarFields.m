clear all;
close all;

% Load library. The path to these two files must have been made known to matlab.
DLLibraryPath = '.\';
libname = 'CSTResultReader';
if (strcmp(computer, 'PCWIN64')) 
    libname = 'CSTResultReader_AMD64';
end
CSTResultReader = strcat( DLLibraryPath, libname, '.dll' );
CSTResultReaderH = strcat( DLLibraryPath, 'CSTResultReaderInterf.h' );
loadlibrary(CSTResultReader,CSTResultReaderH);

mwsProjName = '.\Dipole.cst';
sHandle.m_pProj = 0;
% Initalize the return value
% Values: 0-OK; 1-Unknown; 2-File not found; 3-Invalid cst file;
%         4-Tree item not found; 5-Incompatible result;
%         6-Error in function arguments; 7-Result incompatible with dll;
%         8-Memory error; 9-Unsupported mesh type; 10-Version conflict
ret = 0;
[ret, mwsProjName, sHandle] = calllib(libname, 'CST_OpenProject', mwsProjName, sHandle);  % Initialize the handle

% Read out the number of FF monitors.
nFFM = 0;
[ret, sHandle, nFFM] = calllib(libname, 'CST_GetNumberOfFarfieldMonitors', sHandle, nFFM);
assert(~ret)

% Read out names and frequencies of FF monitors
FFMNames = libpointer('stringPtrPtr',cellstr(num2str((1:nFFM)')));
FFMFrequencies = zeros(1,nFFM,'double');
[ret, sHandle, FFMNames, FFMFrequencies] = calllib(libname, 'CST_GetFarfieldMonitorsInfo', sHandle, FFMNames, FFMFrequencies);
assert(~ret)
display(FFMNames)

% Read out number of excitations
nExcitations = 0;
[ret, sHandle, nExcitations] = calllib(libname, 'CST_GetNumberOfExcitations', sHandle, nExcitations);
assert(~ret)

% Read out excitation strings
ExNames = libpointer('stringPtrPtr',cellstr(num2str((1:nExcitations)')));
[ret, sHandle, ExNames] = calllib(libname, 'CST_GetExcitationStrings', sHandle, nExcitations, ExNames);
assert(~ret)
display(ExNames)

% The next steps show how to read out and plot FF results.

% IMPORTANT: FF results must have been calculated, either by clicking on
% them in the navigation tree, or by including a 1D farfield result
% template (broadband, 3D FF plot) in the simulation!

% Which monitor/excitation (number) to look at?
monNum = 2;
exNum = 1;
% Use FF approximation?
isApprox = 1; 
% Dimension? (Currently only '2' is supported)
Dimension = 2;
% Assemble the result name in the navigation tree
sTree3DResName = strcat('Farfields\',char(FFMNames(monNum)),' [',char(ExNames(exNum)),']')

% Read out number of sample points in Theta and Phi
nDataSizeTheta = 0;
nDataSizePhi = 0;
[ret, sHandle, sTree3DResName, nDataSizeTheta, nDataSizePhi] = calllib(libname, 'CST_GetFarfieldResultSize', sHandle, sTree3DResName, isApprox, Dimension, nDataSizeTheta, nDataSizePhi);
assert(~ret)

% Determine step widths used for theta, phi
PhiStepDeg = 360/nDataSizePhi;
ThetaStepDeg = 180/(nDataSizeTheta-1);
PhiStepRad = 2*pi/double(nDataSizePhi);
ThetaStepRad = pi/double((nDataSizeTheta-1));

% Read out farfield values - length is 3*nDataSizeTheta*nDataSizePhi
% without FF approximation and 2*nDataSizeTheta*nDataSizePhi with FF
% approximation, since radial component is omitted
FFDataSize = (3-isApprox)*nDataSizeTheta*nDataSizePhi;
FFre = zeros(1,FFDataSize,'double');
FFim = zeros(1,(3-isApprox)*nDataSizeTheta*nDataSizePhi,'double');
[ret, sHandle, sTree3DResName, FFre, FFim] = calllib(libname, 'CST_GetFarfieldResultField', sHandle, sTree3DResName, isApprox, Dimension, FFre, FFim);
assert(~ret)

% Split up Theta, Phi, R components into separate vectors
% Theta is varied first, then phi
FFreTheta = FFre(1:(3-isApprox):FFDataSize-(3-isApprox));
FFimTheta = FFim(1:(3-isApprox):FFDataSize-(3-isApprox));
FFabsTheta = realsqrt(FFreTheta.^2+FFimTheta.^2);
FFrePhi = FFre(2:(3-isApprox):FFDataSize-(2-isApprox));
FFimPhi = FFim(2:(3-isApprox):FFDataSize-(2-isApprox));
FFabsPhi = realsqrt(FFrePhi.^2+FFimPhi.^2);
if (~isApprox)
   FFreR = FFre(3:3:FFDataSize);
   FFimR = FFim(3:3:FFDataSize);
   FFabsR = realsqrt(FFreR.^2+FFimR.^2);
   FFabs = realsqrt(FFabsTheta.^2+FFabsPhi.^2+FFabsR.^2);
else
    FFabs = realsqrt(FFabsTheta.^2+FFabsPhi.^2);
end

% Select a constant angle phi, map to corresponding index
constPhiDeg = 45;
[minDeltaPhi constPhiIndex] = min(abs(constPhiDeg-(0:nDataSizePhi-1)*PhiStepDeg));
clear minDeltaPhi;
% Print FFabs value over theta, for constPhi
figure(1)
plot((0:nDataSizeTheta-1)*ThetaStepDeg,FFabs((constPhiIndex-1)*nDataSizeTheta+1:(constPhiIndex-1)*nDataSizeTheta+nDataSizeTheta))
xlabel('\theta in degrees')
ylabel('Absolute field value in V/m')
title(strcat('Farfield plot of absolute field value over \theta, with \phi = ',num2str(constPhiDeg)))
figure(2)
polar(double((0:nDataSizeTheta-1))*ThetaStepRad,FFabs((constPhiIndex-1)*nDataSizeTheta+1:(constPhiIndex-1)*nDataSizeTheta+nDataSizeTheta))
hold on;
polar(-double((0:nDataSizeTheta-1))*ThetaStepRad,FFabs((constPhiIndex-1)*nDataSizeTheta+1:(constPhiIndex-1)*nDataSizeTheta+nDataSizeTheta))
hold off;
title(strcat('Polar farfield plot of absolute field value over \theta, with \phi = ',num2str(constPhiDeg)))

% Select a constant angle theta, map to corresponding index
constThetaDeg = 45;
[minDeltaTheta constThetaIndex] = min(abs(constThetaDeg-(0:nDataSizeTheta-1)*ThetaStepDeg));
clear minDeltaTheta;
% Print FFabs value over phi, for constTheta
figure(3)
plot((0:nDataSizePhi-1)*PhiStepDeg,FFabs(constThetaIndex:nDataSizeTheta:constThetaIndex+nDataSizeTheta*(nDataSizePhi-1)))
xlabel('\phi in degrees')
ylabel('Absolute field value in V/m')
title(strcat('Farfield plot of absolute field value over \phi, with \theta = ',num2str(constThetaDeg)))
figure(4)
polar(double((0:nDataSizePhi-1))*PhiStepRad,FFabs(constThetaIndex:nDataSizeTheta:constThetaIndex+nDataSizeTheta*(nDataSizePhi-1)))
hold on;
polar(double((nDataSizePhi-1:nDataSizePhi))*PhiStepRad,[FFabs(constThetaIndex+nDataSizeTheta*(nDataSizePhi-1)) FFabs(constThetaIndex)])
hold off;
title(strcat('Polar farfield plot of absolute field value over \phi, with \theta = ',num2str(constThetaDeg)))

% Close the CST project handle.
[ret, sHandle] = calllib(libname, 'CST_CloseProject', sHandle);
assert(~ret)

% Free the library.
unloadlibrary(libname)

clear i j k n X Y xmargin ymargin zmargin symbol ret iResultNumber MEColor MFColor nzLevel zLevel sHandle resSize sTree3DResName

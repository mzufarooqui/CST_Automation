function [freq sMat] = f_ExportNetworkData_HFSS(oProject,solutionName,fileName,fileFormat,dataType,complexFormat)
% [freq sMat] = f_ExportNetworkData_HFSS(oProject,'Setup1',[ pwd '\tempFile.m'],7,'S',0)
% f_ExportNetworkData_HFSS(oProject,'Setup1',[ pwd '\tempFile.s6p'],3,'S',0)
% fileFormat:
% 2 : Tab delimited spreadsheet format (.tab)
% 3 : Touchstone (.sNp)
% 4 : CitiFile (.cit)
% 7 : Matlab (.m)
% 8 : Terminal Z0 spreadsheet

% dataType:
% 'S' : Scattering matrix
% 'Y' : Admittance matrix
% 'Z' : Impedance matrix

% complexFormat:
% 0 : Magnitude - Phase. 
% 1 : Real - Imaginary.
% 2 : db - Phase.

if exist(fileName)
    delete(fileName)    
end    
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('Solutions');
oModule.ExportNetworkData( '', ...
{[ solutionName ':Sweep' ]}, ...
fileFormat, ...
fileName, ...
{'All'}, ...
false, ...
50, ...
dataType, ...
-1, ...
complexFormat, ...
15 ...
);
% ind   = strfind(fileName,'\');
% fName = fileName(ind(end)+1:end);
% fName = strtok(fName,'.');
% eval(fName);
run(fileName);
freq  = f(:);
sMat  = S;
end
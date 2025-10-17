function [ surfaceCurr surfaceCurr_freq surfaceCurr_x surfaceCurr_y surfaceCurr_z surfaceCurr_KxRe surfaceCurr_KyRe surfaceCurr_KzRe surfaceCurr_KxIm surfaceCurr_KyIm surfaceCurr_KzIm ] = f_GetSurfaceCurrent(oMWS,oSurfaceCurr)
%% GET E FIELD
%% FUNCTION ARGUMENT DEFINATION
%% EXAMPLE:
% EXAMPLE: 1
% Get Surface current and also export data using Cutting plane
% oSurfaceCurr.exportFilePathWithName = [pwd '\abc'];
% surfaceCurr = f_GetSurfaceCurrent(oMWS,oSurfaceCurr)
% EXAMPLE: 2
% Get Surface current using cutting place
% surfaceCurr = f_GetSurfaceCurrent(oMWS,oSurfaceCurr)
%% MATLAB SCRIPT
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
childDirName = oResultTree.invoke('GetFirstChildName','2D/3D Results\Surface Current');
ind    = 1;
while~isempty(childDirName)
    oMWS.invoke('SelectTreeItem',childDirName);
    oASCIIExport.invoke('Reset');
    [ freqStr freq ] = f_GetFreqStr(childDirName);
    stInd  = strfind(childDirName,'=');
    endInd = strfind(childDirName,')');
    freqStrNoDot = num2str(childDirName(stInd+1:endInd-1));
    freqStrNoDot(freqStrNoDot == '.') = '_';
    %-- Check, whether save the file in path or just get the data
    if isfield(oSurfaceCurr,'exportFilePathWithName')
        exportASCII_FileName = [ oSurfaceCurr.exportFilePathWithName freqStrNoDot '.txt'];
    else
        exportASCII_FileName = [ tempdir 'E_Field' freqStr '.txt'];
    end
    oASCIIExport.invoke('FileName',exportASCII_FileName);
    oASCIIExport.invoke('Execute');
    
    if isfield(oSurfaceCurr,'exportFilePathWithName')
        temp    = importdata([ oSurfaceCurr.exportFilePathWithName freqStrNoDot '.txt']);
    else
        temp    = importdata([ tempdir 'E_Field' freqStr '.txt']);
    end
    % The following line added, requested by G.Addamo
    surfaceCurr_freq(:,ind) = freq;
    surfaceCurr_x(:,ind)    = temp.data(:,1);
    surfaceCurr_y(:,ind)    = temp.data(:,2);
    surfaceCurr_z(:,ind)    = temp.data(:,3);
    surfaceCurr_KxRe(:,ind) = temp.data(:,4);
    surfaceCurr_KyRe(:,ind) = temp.data(:,5);
    surfaceCurr_KzRe(:,ind) = temp.data(:,6);
    surfaceCurr_KxIm(:,ind) = temp.data(:,7);
    surfaceCurr_KyIm(:,ind) = temp.data(:,8);
    surfaceCurr_KzIm(:,ind) = temp.data(:,9);    
    eval(['surfaceCurr.' freqStr '.x    = temp.data(:,1);']);
    eval(['surfaceCurr.' freqStr '.y    = temp.data(:,2);']);
    eval(['surfaceCurr.' freqStr '.z    = temp.data(:,3);']);
    eval(['surfaceCurr.' freqStr '.KxRe = temp.data(:,4);']);
    eval(['surfaceCurr.' freqStr '.KyRe = temp.data(:,5);']);
    eval(['surfaceCurr.' freqStr '.KzRe = temp.data(:,6);']);
    eval(['surfaceCurr.' freqStr '.KxIm = temp.data(:,7);']);
    eval(['surfaceCurr.' freqStr '.KyIm = temp.data(:,8);']);
    eval(['surfaceCurr.' freqStr '.KzIm = temp.data(:,9);']);    
    
    childDirName = oResultTree.invoke('GetNextItemName',childDirName);
    ind = ind + 1;
end
end
function [ freqStr freq ] = f_GetFreqStr(childDirName)
stInd   = strfind(childDirName,'=');
endInd  = strfind(childDirName,')');
freqStr = childDirName(stInd:endInd-1);
freqStr = strrep(freqStr,'=','_');
freq    = str2num(freqStr(2:end));
freqStr = [ 'freq' strrep(freqStr,'.','_')];
end

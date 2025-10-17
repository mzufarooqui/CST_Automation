function farFieldData = f_GetFarfields(oMWS,varargin)
%% GET PORT MODES
%% FUNCTION ARGUMENT DEFINATION
%% EXAMPLE:
% status = f_ExportFarfields(oMWS)
%% MATLAB SCRIPT
% global tempFolderPath
% if isempty(tempFolderPath)
%     tempFolderPath = [ pwd '\TEMP\'];
% else
%     tempFolderPath = [ tempFolderPath '\'];
%     addpath(tempFolderPath);
% end
exportFilePathWithName = [];
if nargin > 1
    exportFilePathWithName = varargin{1};
end

oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
farFieldChildName = oResultTree.invoke('GetFirstChildName','Farfields');
ind    = 1;
while~isempty(farFieldChildName)
    oMWS.invoke('SelectTreeItem',farFieldChildName);
    oASCIIExport.invoke('Reset');
    freqStr = f_GetFreqStr(farFieldChildName);
    stInd  = strfind(farFieldChildName,'=');
    endInd = strfind(farFieldChildName,')');
    freqStrNoDot = num2str(farFieldChildName(stInd+1:endInd-1));
    freqStrNoDot(freqStrNoDot == '.') = '_';
    if isempty(exportFilePathWithName)               
        oASCIIExport.invoke('FileName',[ tempdir 'farField' freqStr '.txt']);
    else
        oASCIIExport.invoke('FileName',[ exportFilePathWithName freqStrNoDot '.txt']);
    end
    oASCIIExport.invoke('Execute');
    if isempty(exportFilePathWithName)               
        temp    = importdata([ tempdir 'farField' freqStr '.txt']);
    else
        temp    = importdata([ exportFilePathWithName freqStrNoDot '.txt']);        
    end    
    eval(['farFieldData.' freqStr '.theta_Deg       = temp.data(:,1);']);
    eval(['farFieldData.' freqStr '.phi_Deg         = temp.data(:,2);']);
    eval(['farFieldData.' freqStr '.abs_Dir_dBi     = temp.data(:,3);']);
    eval(['farFieldData.' freqStr '.abs_Theta_dBi   = temp.data(:,4);']);
    eval(['farFieldData.' freqStr '.phase_Theta_Deg = temp.data(:,5);']);
    eval(['farFieldData.' freqStr '.abs_Phi_dBi     = temp.data(:,6);']);
    eval(['farFieldData.' freqStr '.phase_Phi_Deg   = temp.data(:,7);']);
    eval(['farFieldData.' freqStr '.ax_Ratio_dB     = temp.data(:,8);']);
    farFieldChildName = oResultTree.invoke('GetNextItemName',farFieldChildName);
    ind = ind + 1;
end
end
function freqStr = f_GetFreqStr(farFieldChildName)
stInd   = strfind(farFieldChildName,'=');
endInd  = strfind(farFieldChildName,')');
freqStr = farFieldChildName(stInd:endInd-1);
freqStr = strrep(freqStr,'=','_');
freqStr = [ 'freq' strrep(freqStr,'.','_')];
end

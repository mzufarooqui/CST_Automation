function f_GetMaterial(oMWS,exportFilePath)
mkdir(exportFilePath,'Materials')
exportFilePath = [exportFilePath '\Materials'];
addpath(exportFilePath)
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
oMWS.invoke('SelectTreeItem','1D Results\Materials');
%-- Eff Lin
%effLinDir = oResultTree.invoke('GetFirstChildName','1D Results\Efficiencies');% this line has been comments for CST 2014
%effLinChildName = oResultTree.invoke('GetFirstChildName',effLinDir);% this line has been comments for CST 2014
effLinChildName = oResultTree.invoke('GetFirstChildName','1D Results\Materials');
ind = 1;
while~isempty(effLinChildName)
    oMWS.invoke('SelectTreeItem',[effLinChildName '\Dispersive']);
    oASCIIExport.invoke('Reset');
    f_saveInLinDir(oASCIIExport,exportFilePath,[effLinChildName '\Dispersive']);
    effLinChildName = oResultTree.invoke('GetNextItemName',effLinChildName);
    ind = ind + 1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_saveInLinDir(oASCIIExport,exportFilePath,effLinChildName)
slashInd = strfind(effLinChildName,'\');
fileName = effLinChildName(slashInd(end-1)+1:slashInd(end)-1);
oASCIIExport.invoke('FileName',[ exportFilePath '\' fileName '.txt']);
oASCIIExport.invoke('Execute');
end
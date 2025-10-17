function f_GetEfficiencies_SubArray(oMWS,saveResDataPath,actElem)
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
effLinDir = '1D Results\Efficiencies';
oMWS.invoke('SelectTreeItem',effLinDir);
effLinChildName = oResultTree.invoke('GetFirstChildName',effLinDir);
ind = 1;
while~isempty(effLinChildName)
    oMWS.invoke('SelectTreeItem',effLinChildName);
    oASCIIExport.invoke('Reset');
    f_saveInLinDir(oASCIIExport,saveResDataPath,actElem,effLinChildName);
    effLinChildName = oResultTree.invoke('GetNextItemName',effLinChildName);
    ind = ind + 1;
end
%-- Eff dB
effDB_Dir       = oResultTree.invoke('GetNextItemName',effLinDir);
effDB_ChildName = oResultTree.invoke('GetFirstChildName',effDB_Dir);
ind = 1;
while~isempty(effDB_ChildName)
    oMWS.invoke('SelectTreeItem',effDB_ChildName);
    oASCIIExport.invoke('Reset');
    f_saveInDB_Dir(oASCIIExport,exportFilePathWithName,effDB_ChildName);
    effDB_ChildName = oResultTree.invoke('GetNextItemName',effDB_ChildName);
    ind = ind + 1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_saveInLinDir(oASCIIExport,exportFilePathWithName,actElem,effLinChildName)
slashInd = strfind(effLinChildName,'\');
fileName = effLinChildName(slashInd(end)+1:end);
dirName  = effLinChildName(slashInd(end-1)+1:slashInd(end)-1);
oASCIIExport.invoke('FileName',[ exportFilePathWithName '\Rad_Eff_' fileName '_AE_' num2str(actElem) '.txt']);
oASCIIExport.invoke('Execute');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_saveInDB_Dir(oASCIIExport,exportFilePathWithName,actElem,effDB_ChildName)
slashInd = strfind(effDB_ChildName,'\');
fileName = effDB_ChildName(slashInd(end)+1:end);
dirName  = effDB_ChildName(slashInd(end-1)+1:slashInd(end)-1);
oASCIIExport.invoke('FileName',[ exportFilePathWithName '\Rad_Eff_' fileName '_AE_' num2str(actElem) '.txt']);
oASCIIExport.invoke('Execute');
end
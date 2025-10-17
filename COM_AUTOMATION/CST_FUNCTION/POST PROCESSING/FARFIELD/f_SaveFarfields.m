function f_SaveFarfields(oMWS,dirPath)
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
farFieldChildName = oResultTree.invoke('GetFirstChildName','Farfields');
ind    = 1;
while~isempty(farFieldChildName)
    oMWS.invoke('SelectTreeItem',farFieldChildName);
    slashInd = findstr(farFieldChildName,'\');
    fileName = farFieldChildName(slashInd+1:end);
    fileName(fileName==' ') = [];
    fileNameWithPath = [dirPath '\' fileName '.txt'];
    oASCIIExport.invoke('Reset');
    oASCIIExport.invoke('FileName',fileNameWithPath);
    oASCIIExport.invoke('Execute');
    farFieldChildName = oResultTree.invoke('GetNextItemName',farFieldChildName);
    ind = ind + 1;
end
end


function EfficienciesData = f_GetEfficiencies(oMWS,varargin)
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
EfficienciesData = [];
if nargin > 1
    exportFilePathWithName = varargin{1};
end

oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');


oMWS.invoke('SelectTreeItem','1D Results\Efficiencies');

%-- Eff Lin
%effLinDir = oResultTree.invoke('GetFirstChildName','1D Results\Efficiencies');
effLinDir = '1D Results\Efficiencies';
effLinChildName = oResultTree.invoke('GetFirstChildName',effLinDir);
ind = 1;
while~isempty(effLinChildName)
    oMWS.invoke('SelectTreeItem',effLinChildName);
    oASCIIExport.invoke('Reset');    
    f_saveInLinDir(oASCIIExport,exportFilePathWithName,effLinChildName);
    effLinChildName = oResultTree.invoke('GetNextItemName',effLinChildName);
    ind = ind + 1;
end  
%-- Eff dB
effDB_Dir = oResultTree.invoke('GetNextItemName',effLinDir);
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
function f_saveInLinDir(oASCIIExport,exportFilePathWithName,effLinChildName)
        slashInd = strfind(effLinChildName,'\');
        fileName = effLinChildName(slashInd(end)+1:end);
        dirName  = effLinChildName(slashInd(end-1)+1:slashInd(end)-1);
        if isempty(exportFilePathWithName)
            oASCIIExport.invoke('FileName',[ tempdir fileName '.txt']);
        else
            if ~isdir([exportFilePathWithName '\' dirName])
                mkdir([exportFilePathWithName '\' dirName]);
                addpath([exportFilePathWithName '\' dirName]);
            end
            oASCIIExport.invoke('FileName',[ exportFilePathWithName '\' dirName '\' fileName '.txt']);
        end
        oASCIIExport.invoke('Execute');
        if isempty(exportFilePathWithName)
            temp    = importdata([ tempdir fileName '.txt']);
        else
            temp    = importdata([ exportFilePathWithName '\' dirName '\' fileName '.txt']);
        end
        eval(['EfficienciesData.Linear.freq       = temp.data(:,1);']);
        eval(['EfficienciesData.Linear.RadEffAbsLin       = temp.data(:,2);']);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_saveInDB_Dir(oASCIIExport,exportFilePathWithName,effDB_ChildName)
        slashInd = strfind(effDB_ChildName,'\');
        fileName = effDB_ChildName(slashInd(end)+1:end);
        dirName  = effDB_ChildName(slashInd(end-1)+1:slashInd(end)-1);
        if isempty(exportFilePathWithName)
            oASCIIExport.invoke('FileName',[ tempdir fileName '.txt']);
        else
            if ~isdir([exportFilePathWithName '\' dirName])
                mkdir([exportFilePathWithName '\' dirName]);
                addpath([exportFilePathWithName '\' dirName]);
            end
            oASCIIExport.invoke('FileName',[ exportFilePathWithName '\' dirName '\' fileName '.txt']);
        end
        oASCIIExport.invoke('Execute');
        if isempty(exportFilePathWithName)
            temp    = importdata([ tempdir fileName '.txt']);
        else
            temp    = importdata([ exportFilePathWithName '\' dirName '\' fileName '.txt']);
        end
        eval(['EfficienciesData.db.freq         = temp.data(:,1);']);
        eval(['EfficienciesData.db.RadEffAbsLin = temp.data(:,2);']);
end    
    
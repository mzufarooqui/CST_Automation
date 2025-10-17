function portModes = f_GetPortMode(oMWS,exportMode,stepX,stepY,stepZ)
%% GET PORT MODES
%% FUNCTION ARGUMENT DEFINATION
%  portModes = f_GetPortMode(oMWS,exportMode,stepX,stepY,stepZ)
%
% *INPUT PARAMETER*
%
%  oMWS
%           MWS interface
%  exportMode
%           'FixedNumber':  Fixed number of samples
%           'FixedWidth' :  Fixed step width
%  stepX
%           Number of steps or step width in x-direction
%  stepY
%           Number of steps or step width in y-direction
%  stepZ
%           Number of steps or step width in z-direction
%
%  *OUTPUT PARAMETER*
%
%  portModes
%         portNumber      : port number
%         index           : mode number
%         cutoffFreq      : cutoff frequency
%         modeType        : type of mode: 'TE','TM','TEM','HYBRID'
%         waveImped       : wave impedance at the following frequency
%         waveImpedAtFreq : frequency at which wave impedance calculate
%         xCoord          : x coordinate
%         yCoord          : y coordinate
%         zCoord          : z coordinate
%         ex              : x component of the e mode
%         ey              : y component of the e mode
%         ez              : z component of the e mode
%         hx              : x component of the h mode
%         hy              : y component of the h mode
%         hz              : z component of the h mode
%% EXAMPLE:
% portModes = f_GetPortMode(oMWS,exportMode,stepX,stepY,stepZ)
% portModes = f_GetPortMode(oMWS,'FixedNumber',12,8,1)
%% MATLAB SCRIPT
% global tempFolderPath
% if isempty(tempFolderPath)
%     tempFolderPath = [ pwd '\TEMP\'];
% else
%     tempFolderPath = [ tempFolderPath '\'];
%     addpath(tempFolderPath);
% end

portModes    = [];
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
portName     = oResultTree.invoke('GetFirstChildName','2D/3D Results\Port Modes');
portIndex    = 1;

while~isempty(portName)
    modeName     = oResultTree.invoke('GetFirstChildName',portName);
    modeIndex    = 1;
    emIndex      = 1;
    while ~isempty(modeName)
        oMWS.invoke('SelectTreeItem',modeName);
        oASCIIExport.invoke('Reset');
        oASCIIExport.invoke('FileName',[ tempdir modeName(end-1:end) '.txt']);
        oASCIIExport.invoke('Mode',exportMode);
        oASCIIExport.invoke('StepX',stepX);
        oASCIIExport.invoke('StepY',stepY);
        oASCIIExport.invoke('StepZ',stepZ);
        oASCIIExport.invoke('Execute');
        temp = importdata([tempdir modeName(end-1:end) '.txt']);
        portModes(portIndex,modeIndex,emIndex).modeInfo = f_GetModeInfo(oResultTree,modeName,portIndex,modeIndex,emIndex);
        portModes(portIndex,modeIndex,emIndex).name = modeName(end-1:end);
        portModes(portIndex,modeIndex,emIndex).x    = temp.data(:,1);
        portModes(portIndex,modeIndex,emIndex).y    = temp.data(:,2);
        portModes(portIndex,modeIndex,emIndex).z    = temp.data(:,3);
        portModes(portIndex,modeIndex,emIndex).ex   = temp.data(:,4)+ 1j * temp.data(:,7);
        portModes(portIndex,modeIndex,emIndex).ey   = temp.data(:,5)+ 1j * temp.data(:,8);
        portModes(portIndex,modeIndex,emIndex).ez   = temp.data(:,6)+ 1j * temp.data(:,9);

        if rem(emIndex,2),
            emIndex = emIndex +1;
        else
            emIndex = 1;
            modeIndex = modeIndex + 1;
        end
        modeName = oResultTree.invoke('GetNextItemName',modeName);
    end
    oMWS.invoke('SelectTreeItem',portName);
    portName = oResultTree.invoke('GetNextItemName',portName);
    portIndex = portIndex + 1;
end
if isempty(portModes)
    disp('PORT MODES ARE NOT AVAILABLE IN CST')
end
end
%%
function modeInfo = f_GetModeInfo(oResultTree,modeName,portIndex,modeIndex,emIndex)
modeInfo = [];
itemFileName = oResultTree.invoke('GetFileFromItemName',modeName);
itemFileNameData = importdata(itemFileName,'\t');
iter = 3;
emptySpaceCounter  = 0;
while emptySpaceCounter ~= 5
    str            = itemFileNameData{iter,:};
    iter = iter + 1;
    if isempty(str)
        emptySpaceCounter = emptySpaceCounter + 1;
        continue;
    end

    [varName val ] = strtok(str,'=');
    val            = str2num(val(2:end));
    varName        = strtok(varName,' ');
    if isfield(modeInfo,varName)
        switch varName
            case 'type'
                [varName val ] = strtok(str,'=');
                val            = (val(2:end));
                val            = strtok(val,' ');
                varName        = 'modeType';
            case 'wave'
                varName = 'waveImpSig';
        end
    end
    modeInfo = setfield(modeInfo,varName,val);
end

end
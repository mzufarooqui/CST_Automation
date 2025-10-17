function [ H_FieldData h_Field_freq h_Field_x h_Field_y h_Field_z h_Field_ExRe h_Field_EyRe h_Field_EzRe h_Field_ExIm h_Field_EyIm h_Field_EzIm ] = f_GetH_Fields(oMWS,oH_Field)
%% GET E FIELD
%% FUNCTION ARGUMENT DEFINATION
%% EXAMPLE:
% EXAMPLE: 1
% Get H_FieldData and also export data using Cutting plane
% oH_Field.exportFilePathWithName = [pwd '\abc'];
% oH_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the H_FieldData
% E_FieldData = f_GetH_Fields(oMWS,oH_Field)
% EXAMPLE: 2
% Get H_FieldData using cutting place
% oH_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the H_FieldData
% H_FieldData = f_GetH_Fields(oMWS,oH_Field)
% EXAMPLE: 3
% Get H_FieldData and also export data by defining the fixed number of sample
% oH_Field.exportFilePathWithName = [pwd '\abcd'];
% oH_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
% oH_Field.exportMode             = 'FixedNumber';
% oH_Field.stepX                  = 12;
% oH_Field.stepY                  = 13;
% oH_Field.stepZ                  = 14;
% H_FieldData = f_GetH_Fields(oMWS,oH_Field)
% EXAMPLE: 4
% Get H_FieldData and also export data by defining the fixed width
% oH_Field.exportFilePathWithName = [pwd '\abc'];
% oH_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
% oH_Field.exportMode             = 'FixedWidth';
% oH_Field.DX                     = 2;
% oH_Field.DY                     = 3;
% oH_Field.DZ                     = 4;
% H_FieldData = f_GetH_Fields(oMWS,oH_Field)
%% MATLAB SCRIPT
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
childDirName = oResultTree.invoke('GetFirstChildName','2D/3D Results\H-Field');
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
    if isfield(oH_Field,'exportFilePathWithName')
        exportASCII_FileName = [ oH_Field.exportFilePathWithName freqStrNoDot '.txt'];
    else
        exportASCII_FileName = [ tempdir 'E_Field' freqStr '.txt'];
    end
    
    oMWS.invoke('Plot3DPlotsOn2DPlane',oH_Field.bPlot3DPlotsOn2DPlane);
    switch oH_Field.bPlot3DPlotsOn2DPlane
        case true
        case false
            oASCIIExport.invoke('Mode',oH_Field.exportMode);
            switch oH_Field.exportMode
                case 'FixedNumber'
                    oASCIIExport.invoke('StepX',oH_Field.stepX);
                    oASCIIExport.invoke('StepY',oH_Field.stepY);
                    oASCIIExport.invoke('StepZ',oH_Field.stepZ);
                case 'FixedWidth'
                    oASCIIExport.invoke('StepX',oH_Field.DX);
                    oASCIIExport.invoke('StepY',oH_Field.DY);
                    oASCIIExport.invoke('StepZ',oH_Field.DZ);
            end
    end
    oASCIIExport.invoke('FileName',exportASCII_FileName);
    oASCIIExport.invoke('Execute');
    
    if isfield(oH_Field,'exportFilePathWithName')
        temp    = importdata([ oH_Field.exportFilePathWithName freqStrNoDot '.txt']);
    else
        temp    = importdata([ tempdir 'E_Field' freqStr '.txt']);
    end
    % The following line added, requested by G.Addamo
    h_Field_freq(:,ind) = freq;
    h_Field_x(:,ind)    = temp.data(:,1);
    h_Field_y(:,ind)    = temp.data(:,2);
    h_Field_z(:,ind)    = temp.data(:,3);
    h_Field_ExRe(:,ind) = temp.data(:,4);
    h_Field_EyRe(:,ind) = temp.data(:,5);
    h_Field_EzRe(:,ind) = temp.data(:,6);
    h_Field_ExIm(:,ind) = temp.data(:,7);
    h_Field_EyIm(:,ind) = temp.data(:,8);
    h_Field_EzIm(:,ind) = temp.data(:,9);
    eval(['H_FieldData.' freqStr '.x    = temp.data(:,1);']);
    eval(['H_FieldData.' freqStr '.y    = temp.data(:,2);']);
    eval(['H_FieldData.' freqStr '.z    = temp.data(:,3);']);
    eval(['H_FieldData.' freqStr '.ExRe = temp.data(:,4);']);
    eval(['H_FieldData.' freqStr '.EyRe = temp.data(:,5);']);
    eval(['H_FieldData.' freqStr '.EzRe = temp.data(:,6);']);
    eval(['H_FieldData.' freqStr '.ExIm = temp.data(:,7);']);
    eval(['H_FieldData.' freqStr '.EyIm = temp.data(:,8);']);
    eval(['H_FieldData.' freqStr '.EzIm = temp.data(:,9);']);
    
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

function [ E_FieldData e_Field_freq e_Field_x e_Field_y e_Field_z e_Field_ExRe e_Field_EyRe e_Field_EzRe e_Field_ExIm e_Field_EyIm e_Field_EzIm ] = f_GetE_Fields(oMWS,oE_Field)
%% GET E FIELD
%% FUNCTION ARGUMENT DEFINATION
%% EXAMPLE:
% EXAMPLE: 1
% Get E-Field and also export data using Cutting plane
% oE_Field.exportFilePathWithName = [pwd '\abc'];
% oE_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the E-Field
% E_FieldData = f_GetE_Fields(oMWS,oE_Field)
% EXAMPLE: 2
% Get E-Field using cutting place
% oE_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the E-Field
% E_FieldData = f_GetE_Fields(oMWS,oE_Field)
% EXAMPLE: 3
% Get E-Field and also export data by defining the fixed number of sample
% oE_Field.exportFilePathWithName = [pwd '\abcd'];
% oE_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
% oE_Field.exportMode             = 'FixedNumber';
% oE_Field.stepX                  = 12;
% oE_Field.stepY                  = 13;
% oE_Field.stepZ                  = 14;
% E_FieldData = f_GetE_Fields(oMWS,oE_Field)
% EXAMPLE: 4
% Get E-Field and also export data by defining the fixed width
% oE_Field.exportFilePathWithName = [pwd '\abc'];
% oE_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
% oE_Field.exportMode             = 'FixedWidth';
% oE_Field.DX                     = 2;
% oE_Field.DY                     = 3;
% oE_Field.DZ                     = 4;
% E_FieldData = f_GetE_Fields(oMWS,oE_Field)
%% MATLAB SCRIPT
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
childDirName = oResultTree.invoke('GetFirstChildName','2D/3D Results\E-Field');
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
    if isfield(oE_Field,'exportFilePathWithName')
        exportASCII_FileName = [ oE_Field.exportFilePathWithName freqStrNoDot '.txt'];
    else
        exportASCII_FileName = [ tempdir 'E_Field' freqStr '.txt'];
    end
    
    oMWS.invoke('Plot3DPlotsOn2DPlane',oE_Field.bPlot3DPlotsOn2DPlane);
    switch oE_Field.bPlot3DPlotsOn2DPlane
        case true
        case false
            oASCIIExport.invoke('Mode',oE_Field.exportMode);
            switch oE_Field.exportMode
                case 'FixedNumber'
                    oASCIIExport.invoke('StepX',oE_Field.stepX);
                    oASCIIExport.invoke('StepY',oE_Field.stepY);
                    oASCIIExport.invoke('StepZ',oE_Field.stepZ);
                case 'FixedWidth'
                    oASCIIExport.invoke('StepX',oE_Field.DX);
                    oASCIIExport.invoke('StepY',oE_Field.DY);
                    oASCIIExport.invoke('StepZ',oE_Field.DZ);
            end
    end
    oASCIIExport.invoke('FileName',exportASCII_FileName);
    oASCIIExport.invoke('Execute');
    
    if isfield(oE_Field,'exportFilePathWithName')
        temp    = importdata([ oE_Field.exportFilePathWithName freqStrNoDot '.txt']);
    else
        temp    = importdata([ tempdir 'E_Field' freqStr '.txt']);
    end
    % The following line added, requested by G.Addamo
    e_Field_freq(:,ind) = freq;
    e_Field_x(:,ind)    = temp.data(:,1);
    e_Field_y(:,ind)    = temp.data(:,2);
    e_Field_z(:,ind)    = temp.data(:,3);
    e_Field_ExRe(:,ind) = temp.data(:,4);
    e_Field_EyRe(:,ind) = temp.data(:,5);
    e_Field_EzRe(:,ind) = temp.data(:,6);
    e_Field_ExIm(:,ind) = temp.data(:,7);
    e_Field_EyIm(:,ind) = temp.data(:,8);
    e_Field_EzIm(:,ind) = temp.data(:,9);
    eval(['E_FieldData.' freqStr '.x    = temp.data(:,1);']);
    eval(['E_FieldData.' freqStr '.y    = temp.data(:,2);']);
    eval(['E_FieldData.' freqStr '.z    = temp.data(:,3);']);
    eval(['E_FieldData.' freqStr '.ExRe = temp.data(:,4);']);
    eval(['E_FieldData.' freqStr '.EyRe = temp.data(:,5);']);
    eval(['E_FieldData.' freqStr '.EzRe = temp.data(:,6);']);
    eval(['E_FieldData.' freqStr '.ExIm = temp.data(:,7);']);
    eval(['E_FieldData.' freqStr '.EyIm = temp.data(:,8);']);
    eval(['E_FieldData.' freqStr '.EzIm = temp.data(:,9);']);
    
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

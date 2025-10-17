function f_SaveCST_SimulationResults(oMWS,deviceName,parameterName,parameterRange,simPoint,iterInd,comemat)

solverType              = comemat.flag.solverType;                 % 'TD-Solver', 'FD-Solver'
saveEfficiency          = comemat.flag.saveEfficiency;             %  Save Efficiency results              0-No, 1-Yes
saveScatMatInTouchStone = comemat.flag.saveScatMatInTouchStone ;   %  Save Scat Mat in Touch Stone Format  0-No, 1-Yes
saveScatMatInPolar      = comemat.flag.saveScatMatInPolar;         %  Save Scat Mat in Polar Form          0-No, 1-Yes
saveFarFieldsData       = comemat.flag.saveFarFieldsData;          %  Save Farfield Data                   0-No, 1-Yes
saveCST_Parameter       = comemat.flag.saveCST_Parameter;          %  Save all CST Parameter               0-No, 1-Yes
putParamNameInDir       = comemat.flag.putParamNameInDir;          %  Chooses format of directory name     0-Selected parameters, 1-All parameters
activateGridAnalysis    = comemat.flag.activateGridAnalysis;       %  Choice: activate grid analysis       0-Automatic 1-User defined grid or user-defined grid
exportSolverLog         = comemat.flag.exportSolverLog;
importModel             = comemat.flag.importModel;
exportSATFile           = comemat.flag.exportSATFile;
exportMaterials         = comemat.flag.exportMaterials;


totNumPort = f_GetNumberOfPorts(oMWS);
simPort = f_GetStimulationPort(oMWS);
if ~isdir(deviceName)
    dirStr = [pwd '/' deviceName ];
    mkdir(dirStr);
    addpath(dirStr);
    % if more than one port is defined    
    if totNumPort > 1
        
        dirStr  = [pwd '/' deviceName '/Port_' num2str(simPort)];
        mkdir(dirStr);
        addpath(dirStr);
    end
end

subDirName = [];
%-- Create Directory Name
paramList = f_GetAllParameters(oMWS);

if putParamNameInDir==1
    %-- It will put the all variable name in the directory name
    numParam = size(paramList,1);
    for paramInd = 1:numParam
        subDirName = sprintf('%s%s=%s,',subDirName,cell2mat(paramList(paramInd,1)),cell2mat(paramList(paramInd,2)));
    end
elseif putParamNameInDir == 0
    %-- It will create Directory according to the varying parameter
    numParam = size(parameterRange,2);
    for paramInd = 1:numParam
        subDirName = sprintf('%s%s=%s, ',subDirName,cell2mat(parameterName(paramInd)),num2str(simPoint(iterInd,paramInd)));
    end
end

subDirName(end-1:end) = [];
if totNumPort > 1
    dirStr = [pwd '\' deviceName '\Port_' num2str(simPort) '\' subDirName ];
else
    dirStr = [pwd '\' deviceName '\' subDirName ];
end
%if isdir([subDirName])
if isdir(dirStr)
    fprintf(1,'\n Warning: %s Directory already exist and data will be overwritten \n ',subDirName);
else
    mkdir(dirStr);
    addpath(dirStr);
end
%-- Export Materials
if exportMaterials    
    f_GetMaterial(oMWS,dirStr)
end
%-- Save Scat Mat in Touch Stone Format
if saveScatMatInTouchStone
    f_SaveS11(oMWS,dirStr); % Save scattering matrix in touchstone format
end
%-- Save Scat Mat in Polar Form
if saveScatMatInPolar
    f_ExportScatMatTextFormat(oMWS,dirStr,'scatMatS11.txt',1,'polar');% save scattering matrix in text format with theta
end
%-- Save Farfield Data
if saveFarFieldsData
    f_ExportFarfieldResultsInDir(oMWS,dirStr);
end
%-- Save all CST Parameter
if saveCST_Parameter
    f_SaveAllParameters(oMWS,[ dirStr '/' subDirName '_Parameterlist.dat'])
end
%-- Save efficiency 
if saveEfficiency
 f_GetEfficiencies(oMWS,dirStr);
end
%-- Export Solver Log File
if exportSolverLog
    solverLogFile = [ f_GetProjectInfo(oMWS,'Result') 'Model.log' ];    
    copyfile(solverLogFile,dirStr)    
end
%-- Export Model in SAT format
if exportSATFile
   impoExpoSAT.fileName     = [dirStr '\model.sat'];
   impoExpoSAT.version      = '21.0';
   impoExpoSAT.saveVersion  = '21.0';
   impoExpoSAT.importExport = 'export';
   f_ImportExportSAT(oMWS,impoExpoSAT);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_SaveS11(oMWS,dirStr)
saveFileName = ['Ref_Coeff_S11'];
exportTCH.fileName       = [ dirStr '/' saveFileName];
exportTCH.frequencyRange = 'Full';
exportTCH.bRenormalize   = 'False';
exportTCH.bUseARResults  = 'False';
exportTCH.setNSamples    = 0;
f_ExportTOUCH(oMWS,exportTCH);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f_ExportFarfieldResultsInDir(oMWS,dirStr)
farfieldFileName = [dirStr '/Directivity_'];
farFieldData = f_GetFarfields(oMWS,farfieldFileName);
end
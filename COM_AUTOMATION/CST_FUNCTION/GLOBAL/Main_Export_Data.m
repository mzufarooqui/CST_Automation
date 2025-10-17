close all;clear;clc;
addpath(genpath('D:\USERS\Farooqui\FAROOQUI_TOOLS'))
projectName = [pwd '\vivaldi3p1_mL_15_With_GND.cst'];
oCST_Studio = f_OpenCST_StudioSuit();
oMWS = f_OpenCST_MWS_Project(oCST_Studio,projectName);
slashInd = strfind(projectName,'\');
dirStr = [pwd '\exportData_' projectName(slashInd(end)+1:end-4)];
if ~isdir(dirStr),mkdir(dirStr);end
saveScatMatInTouchStone = 1;
saveFarFieldsData       = 1;
exportSolverLog         = 1;
saveEfficiency          = 1;
saveFarFieldsData       = 1;
saveCST_Parameter       = 1;
exportSATFile           = 1;

%-- Save Scat Mat in Touch Stone Format
if saveScatMatInTouchStone
    saveFileName = ['ScatMat'];
    exportTCH.fileName       = [ dirStr '/' saveFileName];
    exportTCH.frequencyRange = 'Full';
    exportTCH.bRenormalize   = 'False';
    exportTCH.bUseARResults  = 'False';
    exportTCH.setNSamples    = 0;
    f_ExportTOUCH(oMWS,exportTCH);
end
%-- Save Farfield Data
if saveFarFieldsData   
    
    %-- Set Farfields Parameters
    oFarField.plotType        = '3d'; % '2d','cartesian';
    oFarField.plotMode        = 'gain';%'directivity';
    oFarField.origin          = 'zero'; % bbox,zero,free
    oFarField.step            = 1;
    oFarField.step2           = 1;
    oFarField.dBUnit          = -1;
    oFarField.bSetTheta360    = 'False';
    oFarField.bSymmetricRange = 'False';
    f_SetFarfieldsParameter(oMWS,oFarField);    
    
    f_SaveFarfields(oMWS,dirStr)
end
%-- Export Solver Log File
if exportSolverLog
    solverLogFile = [ f_GetProjectInfo(oMWS,'Result') 'Model.log' ];
    copyfile(solverLogFile,dirStr)
end
%-- Save efficiency
if saveEfficiency
    f_GetEfficiencies(oMWS,dirStr);
end
%-- Save all CST Parameter
if saveCST_Parameter
    f_SaveAllParameters(oMWS,[ dirStr '/Parameterlist.dat'])
end
%-- Export Model in SAT format
if exportSATFile
   impoExpoSAT.fileName     = [dirStr '\model.sat'];
   impoExpoSAT.version      = '21.0';
   impoExpoSAT.saveVersion  = '21.0';
   impoExpoSAT.importExport = 'export';
   f_ImportExportSAT(oMWS,impoExpoSAT);
end


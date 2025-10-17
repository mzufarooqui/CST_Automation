clc;clear; clear global; clear variables; close all;

%-- Add CST MODEL GENERATOR path
addpath(genpath('D:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS'));
projectName = 'D:\CNR\G Addamo\Corrugated Horn\FileSat_Horn2.cst';
MWS_TemplateName = 'Coupler (Waveguide)^+MWS';
oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_CreateMWS_Template(oMWS,MWS_TemplateName);
EXPORT_EACH_LAYER_SEPERATELY = 1;
componentName = 'component1';
plateName     = 'brick';
xRange = [-40 40];
yRange = [-40 40];
satComponentName = 'Vacuum';
satImportName = 'solid1';
f_CreateComponent(oMWS,componentName);

twoInd = 2;
zeroInd = 0;
for pInd = 1:39
    impoExpoSAT.fileName     = 'D:\CNR\G Addamo\Corrugated Horn\FileSat_Horn2.sat';
    impoExpoSAT.version      = '21.0';
    impoExpoSAT.importExport = 'import';
    f_ImportExportSAT(oMWS,impoExpoSAT);
    zMin = 77 - twoInd;
    zMax = 77 - zeroInd;
    f_CreateBrick(oMWS,componentName,plateName,'PEC',xRange,xRange,[zMin zMax]);
    f_IntersectSolids(oMWS,satComponentName,satImportName,componentName,plateName);
    f_RenameComponentPart(oMWS,satComponentName,satImportName,['P_' num2str(pInd)]);
    twoInd  = twoInd + 2;
    zeroInd = zeroInd + 2;
end
f_AddSolids(oMWS,satComponentName,['P_38'],satComponentName,'P_39'); % Add both part for the screw
f_CreateBrick(oMWS,satComponentName,'P_39','PEC',xRange,xRange,[77 77+4]);
f_CreateCylinder(oMWS,satComponentName,'cylinder1','PEC','z',57.77/2,0,0,0,0,[77 77+4],0);
f_SubtractSolids(oMWS,satComponentName,['P_39'],satComponentName,'cylinder1');

if EXPORT_EACH_LAYER_SEPERATELY
    for pInd = 1:39
        oMWS.invoke('SelectTreeItem',['Components\Vacuum\P_' num2str(pInd)]); % This line is not necessary
        impoExpoSAT.fileName     = ['D:\CNR\G Addamo\Corrugated Horn\SAT FILES\SAT File For Each Plate\P_' num2str(pInd) '.sat'];
        impoExpoSAT.version      = '21.0';
        impoExpoSAT.saveVersion  = '21.0';
        impoExpoSAT.importExport = 'exportPart';
        impoExpoSAT.exportPartName = [satComponentName ':P_' num2str(pInd)];                                
        f_ImportExportSAT(oMWS,impoExpoSAT);
    end
end
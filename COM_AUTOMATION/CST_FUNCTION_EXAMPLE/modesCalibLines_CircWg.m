clc;clear; clear global; clear variables; close all;
%-- Add CST MODEL GENERATOR path
wgR   = 1.31;
wgLen = 5;
addpath(genpath('D:\Users\Farooqui\FAROOQUI_TOOLS'));
cstProjectPath      = pwd;
projectName      = 'modesCalibLine.cst';
MWS_TemplateName = 'Coupler (Waveguide)^+MWS';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_StoreDoubleParameter(oMWS,'wgR',wgR);
f_StoreDoubleParameter(oMWS,'wgLen',wgLen);
% f_SaveAsCST_MWS_Project(oMWS,projectName);
f_CreateMWS_Template(oMWS,MWS_TemplateName);
f_CreateComponent(oMWS,'component1');
%-- DEFINE Circular waveguide
% f_CreateCylinder(oMWS,componentName,cylinderName,material,axis,outerRadius,innerRadius,xCenter,yCenter,zCenter,axisRange,segments)
f_CreateCylinder(oMWS,'component1','circWg','Vacuum','z','wgR',0,0,0,0,[0 5],0)
%-- DEFINE PORT1
f_PickFaceFromId(oMWS,'component1','circWg',1);
oPort.portNumber    = 1;
oPort.numberOfModes = 2;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '1';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort.bPortImpedanceAndCalibration = 'True';
% {lineNumber, modeNumber, {xStart, yStart, zStart}, {xEnd, yEnd, zEnd}, bDirReverse, impedanceLineNumber, calibrationLineNumber,polarizationLineNumber};
oPort.addModeLineByPoint = {1,1,{0,'-wgR',0},{0,'wgR',0},'False',1,1,1
                            2,2,{'-wgR',0,0},{'wgR',0,0},'False',2,2,2};
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE PORT2
f_PickFaceFromId(oMWS,'component1','circWg',3);
oPort.portNumber    = 2;
oPort.numberOfModes = 2;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '2';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort.bPortImpedanceAndCalibration = 'True';
% {lineNumber, modeNumber, {xStart, yStart, zStart}, {xEnd, yEnd, zEnd}, bDirReverse, impedanceLineNumber, calibrationLineNumber,polarizationLineNumber};
oPort.addModeLineByPoint = {1,1,{0,'-wgR','wgLen'},{0,'wgR','wgLen'},'False',1,1,1
                            2,2,{'-wgR',0,'wgLen'},{'wgR',0,'wgLen'},'False',2,2,2};
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE FREQUENCY RANGE
oSolver.frequencyRange = [95 110];
f_CreateSolver(oMWS,oSolver);
%-- DEFINE THE MESH
 oMesh.bUseRatioLimit         = 'True' ;
 oMesh.ratioLimit             = 10.0;
 oMesh.linesPerWavelength     = 10.0;
 oMesh.minimumStepNumber      = 10.0;
 oMesh.bAutomesh              = 'True';
 oMesh.meshType               = 'PBA';
 f_CreateMesh(oMWS,oMesh);
%-- DEFINE TIME DOMAIN SOLVER
oTD_Solver.stimulationPort           = 1;
oTD_Solver.stimulationMode           = 1;
oTD_Solver.steadyStateLimit          = -30.0;
oTD_Solver.bMeshAdaption             = 'False';
oTD_Solver.bAutoNormImpedance        = 'False';
oTD_Solver.normingImpedance          = 50;
oTD_Solver.bCalculateModesOnly       = 'False';
oTD_Solver.bSParaSymmetry            = 'False';
oTD_Solver.bStoreTDResultsInCache    = 'False';
oTD_Solver.bFullDeembedding          = 'False';
oTD_Solver.bSuperimposePLWExcitation = 'False';
oTD_Solver.bUseSensitivityAnalysis   = 'False';
f_CreateTD_Solver(oMWS,oTD_Solver);

f_ActivateWCS(oMWS,'global');
%-- RUN TD SOLVER
solverStatus = f_StartSolver(oMWS);
%-- GET PORT MODES
% nPtX = 12;nPtY = 12;nPtZ = 1;
% nPtX = 12;nPtY = 11;nPtZ = 10;
 nPtX = 12;nPtY = 12;nPtZ = 12;
portModes = f_GetPortMode(oMWS,'FixedNumber',nPtX,nPtY,nPtZ);

X    = reshape(portModes(1,1,1).x,nPtX,nPtY);
Y    = reshape(portModes(1,1,1).y,nPtY,nPtX);
Ex   = reshape(portModes(1,1,1).ex,nPtX,nPtY);
Ey   = reshape(portModes(1,1,1).ey,nPtY,nPtX);
EMag = sqrt(abs(Ex).^2+abs(Ey).^2);
figure
hQu=quiver(X,Y,Ex,Ey);
% set(hQu,'MaxHeadSize',1)
grid on
% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
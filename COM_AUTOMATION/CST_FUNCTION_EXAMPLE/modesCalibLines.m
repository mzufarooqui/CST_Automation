clc;clear; clear global; clear variables; close all;
%-- Add CST MODEL GENERATOR path
addpath(genpath('E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS'));
cstProjectPath      = pwd;
projectName      = 'modesCalibLine.cst';
MWS_TemplateName = 'Coupler (Waveguide)^+MWS';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);
f_CreateMWS_Template(oMWS,MWS_TemplateName);
f_CreateComponent(oMWS,'component1');
%-- DEFINE BRICK
f_CreateBrick(oMWS,'component1','brick1','Vacuum',[-20 20],[-5 5],[0 50]);
%-- DEFINE PORT1
f_PickFaceFromId(oMWS,'component1','brick1',1);
f_AlignWCSWithSelectedFace(oMWS);
f_PickFaceFromId(oMWS,'component1','brick1',1);
oPort.portNumber    = 1;
oPort.numberOfModes = 3;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '1';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort.bPortImpedanceAndCalibration = 'True';
% {lineNumber, modeNumber, {xStart, yStart, zStart}, {xEnd, yEnd, zEnd}, bDirReverse, impedanceLineNumber, calibrationLineNumber,polarizationLineNumber};
oPort.addModeLineByPoint = {1,1,{0.0,-5,0},{0.0,5,0},'False',1,1,1
                            2,2,{2.5,-5,0},{2.5,5,0},'False',2,2,2};
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE PORT2
f_PickFaceFromId(oMWS,'component1','brick1',2);
f_AlignWCSWithSelectedFace(oMWS);
f_PickFaceFromId(oMWS,'component1','brick1',2);
oPort.portNumber    = 2;
oPort.numberOfModes = 3;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '2';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort.bPortImpedanceAndCalibration = 'True';
% {lineNumber, modeNumber, {xStart, yStart, zStart}, {xEnd, yEnd, zEnd}, bDirReverse, impedanceLineNumber, calibrationLineNumber,polarizationLineNumber};
oPort.addModeLineByPoint = {3,1,{0.0,-5,-50},{0.0,5,-50},'True',3,3,3
                            4,2,{2.5,-5,-50},{2.5,5,-50},'True',4,4,4};
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE FREQUENCY RANGE
oSolver.frequencyRange = [10 11];
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

%-- GET S PARAMETER
[frequency sParameter ] = f_GetS_Parameter(oMWS,'BY_SAVEING_RESULTS',1,1,1,1);
%-- GET PORT MODES
% nPtX = 12;nPtY = 12;nPtZ = 1;
% nPtX = 12;nPtY = 11;nPtZ = 10;
 nPtX = 12;nPtY = 12;nPtZ = 12;
portModes = f_GetPortMode(oMWS,'FixedNumber',nPtX,nPtY,nPtZ);

% for ind = 1:size(portModes,2)
% % plot the modes
% end
% return

X=reshape(portModes(1,1,1).x,nPtX,nPtY);
Y=reshape(portModes(1,1,1).y,nPtY,nPtX);

Ex=reshape(portModes(1,1,1).ex,nPtX,nPtY);
Ey=reshape(portModes(1,1,1).ey,nPtY,nPtX);



EMag=sqrt(abs(Ex).^2+abs(Ey).^2);

figure(10),cla
% contourf(X,Y,EMag)
hold on
hQu=quiver(X,Y,Ex,Ey);
% set(hQu,'MaxHeadSize',1)
grid on
% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
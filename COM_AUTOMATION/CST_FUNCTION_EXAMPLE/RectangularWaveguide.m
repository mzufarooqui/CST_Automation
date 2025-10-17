clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);
projectName      = 'RectangularWaveguide1.cst';
MWS_TemplateName = 'Filter (Waveguide)^+MWS';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_CreateMWS_Template(oMWS,MWS_TemplateName);

fMin = 3.4;
fMax = 4.0;
frequencyObs = 3.6;
brick1U = 50;
brick1V = 10;
brick1W = 50;
brick2U = brick1U/2;
brick2V = brick1V;
brick2W = 30;
brick3U = 20/2;
brick3V = brick1W/2;
brick3W = 30;
brickMaterial = 'Vacuum';

f_SaveAsCST_MWS_Project(oMWS,projectName);
f_NewComponent(oMWS,'component1');
%-- Create Objects
oMonitor = f_CreateMonitorObject(oMWS);
%-- Set Global Parameters
% oMesh = f_ConfigureMesh(oMesh);
f_StoreParameter(oMWS,'brick1U',brick1U);
f_StoreParameter(oMWS,'brick1V',brick1V);
f_StoreParameter(oMWS,'brick1W',brick1W);
f_StoreParameter(oMWS,'brick2U',brick2U);
f_StoreParameter(oMWS,'brick2V',brick2V);
f_StoreParameter(oMWS,'brick2W',brick2W);
f_StoreParameter(oMWS,'brick3U',brick3U);
f_StoreParameter(oMWS,'brick3V',brick3V);
f_StoreParameter(oMWS,'brick3W',brick3W);

%-- Create Brick 1
oBrick1.bAddToHistory = 'True';
oBrick1.component     = 'component1';
oBrick1.name          = 'solid1';
oBrick1.material      = brickMaterial;
oBrick1.xRange        = {'-brick1U' 'brick1U'};
oBrick1.yRange        = {'-brick1V' 'brick1V'};
oBrick1.zRange        = {'0' 'brick1W'};
oBrick1 = f_CreateBrick(oMWS,oBrick1);
%-- ACTIVATE LOCAL WCS
oWCS.activateWCS = 'local';
oWCS = f_CreateWCS(oMWS,oWCS);
%-- PICK FACE NO.1 OF COMPONENT 1, SOLID 1
oPick.PickFaceFromId.componentName = 'component1';
oPick.PickFaceFromId.shapeName     = 'solid1';
oPick.PickFaceFromId.id            = 1;
oPick = f_CreatePick(oMWS,oPick);
%-- ALIGN WCS WITH SELECTED FACE
oWCS.alignWCSWithSelected   = 'Face';
oWCS = f_CreateWCS(oMWS,oWCS);
oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
%-- Create Brick 2
oBrick2.bAddToHistory = 'True';
oBrick2.component     = 'component1';
oBrick2.name          = 'solid2';
oBrick2.material      = brickMaterial;
oBrick2.xRange        = {'-brick2U' 'brick2U'};
oBrick2.yRange        = {'-brick2V' 'brick2V'};
oBrick2.zRange        = {'0' 'brick2W'};
oBrick2 = f_CreateBrick(oMWS,oBrick2);
%-- PICK FACE NO.5 OF COMPONENT 1, SOLID 1
oPick.PickFaceFromId.id            = 5;
oPick = f_CreatePick(oMWS,oPick);
%-- ALIGN WCS WITH SELECTED FACE
oWCS.alignWCSWithSelected   = 'Face';
oWCS = f_CreateWCS(oMWS,oWCS);
oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
%-- Create Brick 3
oBrick3.bAddToHistory = 'True';
oBrick3.component     = 'component1';
oBrick3.name          = 'solid3';
oBrick3.material      = brickMaterial;
oBrick3.xRange        = {'-brick3U' 'brick3U'};
oBrick3.yRange        = {'-brick3V' 'brick3V'};
oBrick3.zRange        = {'0' 'brick3W'};
oBrick3 = f_CreateBrick(oMWS,oBrick3);
%-- DEFINE PORT 1
%-- PICK FACE NO.1 OF COMPONENT 1, SOLID 2
oPick.PickFaceFromId.shapeName     = 'solid2';
oPick.PickFaceFromId.id            = 1;
oPick = f_CreatePick(oMWS,oPick);
%-- ALIGN WCS WITH SELECTED FACE
oWCS.alignWCSWithSelected   = 'Face';
oWCS = f_CreateWCS(oMWS,oWCS);
oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
oPick = f_CreatePick(oMWS,oPick);

oPort.portNumber    = 1;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '1';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort = f_CreatePort(oMWS,oPort);

oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
%-- PORT 2
%-- PICK FACE NO.6 OF COMPONENT 1, SOLID 1
oPick.PickFaceFromId.shapeName     = 'solid1';
oPick.PickFaceFromId.id            = 6;
oPick = f_CreatePick(oMWS,oPick);
%-- ALIGN WCS WITH SELECTED FACE
oWCS.alignWCSWithSelected   = 'Face';
oWCS = f_CreateWCS(oMWS,oWCS);
oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
oPick = f_CreatePick(oMWS,oPick);

oPort.portNumber    = 2;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '2';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort = f_CreatePort(oMWS,oPort);

oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
%-- PORT 3
%-- PICK FACE NO.4 OF COMPONENT 1, SOLID 1
oPick.PickFaceFromId.shapeName     = 'solid1';
oPick.PickFaceFromId.id            = 4;
oPick = f_CreatePick(oMWS,oPick);
%-- ALIGN WCS WITH SELECTED FACE
oWCS.alignWCSWithSelected   = 'Face';
oWCS = f_CreateWCS(oMWS,oWCS);
oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
oPick = f_CreatePick(oMWS,oPick);

oPort.portNumber    = 3;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '3';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort = f_CreatePort(oMWS,oPort);

oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
%-- PORT 4
%-- PICK FACE NO.1 OF COMPONENT 1, SOLID 3
oPick.PickFaceFromId.shapeName     = 'solid3';
oPick.PickFaceFromId.id            = 1;
oPick = f_CreatePick(oMWS,oPick);
%-- ALIGN WCS WITH SELECTED FACE
oWCS.alignWCSWithSelected   = 'Face';
oWCS = f_CreateWCS(oMWS,oWCS);
oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
oPick = f_CreatePick(oMWS,oPick);

oPort.portNumber    = 4;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '4';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
oPort = f_CreatePort(oMWS,oPort);

oPick.clearAllPicks = 'True';
oPick = f_CreatePick(oMWS,oPick);
oPick.clearAllPicks = 'False';
%-- DEFINE MESH
oMesh.bAddToHistory              = 'True';
oMesh.meshType                   = 'Tetrahedral';
oMesh.PBAType                    = 'PBA';
oMesh.stepsPerWavelengthTet      = 4;
oMesh.minimumStepNumberTet       = 10;
oMesh.curvatureRefinementFactor  = 0.05;
oMesh.minimumCurvatureRefinement = 40; 
oMesh = f_CreateMesh(oMWS,oMesh);
%-- DEFINE FREQUENCY RANGE
oSolver.frequencyRange = [fMin fMax];
oSolver = f_CreateSolver(oMWS,oSolver);

oWCS = rmfield(oWCS,'alignWCSWithSelected');
oWCS.activateWCS = 'global';
oWCS = f_CreateWCS(oMWS,oWCS);
%-- DEFINE FREQUENCY DOMAIN SOLVER
oFD_Solver.bAddToHistory     = 'True';
oFD_Solver.accuracyTet       = 1e-6;
oFD_Solver.stimulation       = {'List' 'List'};
oFD_Solver.stimulationList   = {'p1','1,2';'p2','2,4';'p3','1,4';'p4','3,2'};
oFD_Solver.addSampleInterval = {3.5 3.6 14 'Equidistant' 'True';3.65 3.7 13 'Automatic' 'False';3.75 3.8 13 'Equidistant' 'False'};
oFD_Solver = f_CreateFD_Solver(oMWS,oFD_Solver);
%-- DEFINE MESH ADAPTION 3D
oMeshAdaption3D.setType        = 'HighFrequencyTet';
oMeshAdaption3D.minPasses      = 4;
oMeshAdaption3D.maxPasses      = 9;
oMeshAdaption3D.maxDeltaS      = 0.0001;
oMeshAdaption3D.meshIncrement  = 6;
oMeshAdaption3D  = f_CreateMeshAdaption3D(oMWS,oMeshAdaption3D);
% FD_SolverStatus = f_StartFD_Solver(oFD_Solver);
% 
% [frequency s11 ] = f_GetS_Parameter(oMWS,'S11');
% [frequency s11 ] = f_GetS_Parameter(oMWS,1,1,1,1);
% [frequency s21 ] = f_GetS_Parameter(oMWS,2,1,1,1);
% figure;
% subplot(2,1,1);plot(frequency,s11,'o-');xlabel('Frequency[GHz]');ylabel('s11');
% subplot(2,1,2);plot(frequency,s21,'o-');xlabel('Frequency[GHz]');ylabel('s21');
% 
% [frequency s21 ] = f_GetS_Parameter(oMWS,'S21');
% [frequency s31 ] = f_GetS_Parameter(oMWS,'S31');
% [frequency s41 ] = f_GetS_Parameter(oMWS,'S41');
% [frequency s12 ] = f_GetS_Parameter(oMWS,'S12');
% [frequency s22 ] = f_GetS_Parameter(oMWS,'S22');
% [frequency s32 ] = f_GetS_Parameter(oMWS,'S32');
% [frequency s42 ] = f_GetS_Parameter(oMWS,'S42');
% [frequency s13 ] = f_GetS_Parameter(oMWS,'S13');
% [frequency s23 ] = f_GetS_Parameter(oMWS,'S23');
% [frequency s33 ] = f_GetS_Parameter(oMWS,'S33');
% [frequency s43 ] = f_GetS_Parameter(oMWS,'S43');
% [frequency s14 ] = f_GetS_Parameter(oMWS,'S14');
% [frequency s24 ] = f_GetS_Parameter(oMWS,'S24');
% [frequency s34 ] = f_GetS_Parameter(oMWS,'S34');
% [frequency s44 ] = f_GetS_Parameter(oMWS,'S44');



% for outer = 1:4
%     figure;
%     for inner = 1:4
%         sParameter = eval(['s' num2str(inner) num2str(outer)]);
%         subplot(2,2,inner);plot(frequency,sParameter);grid on;
%         xlabel('Frequency[GHz]');ylabel(['| s' num2str(inner) num2str(outer) ' |'])
%     end
% end

% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);




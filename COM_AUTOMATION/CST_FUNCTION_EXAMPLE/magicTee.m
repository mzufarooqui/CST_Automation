clc;clear; clear global; clear variables; close all;
addpath(genpath('G:\FAROOQUI\FAROOQUI_TOOLS'));

currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);

projectName      = 'magicTee.cst';
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
%-- Save Project
f_SaveAsCST_MWS_Project(oMWS,projectName);
%-- Create New Component
f_CreateComponent(oMWS,'component1');
%-- Set Global Parameters
f_StoreParameter(oMWS,'brick1U',brick1U);
f_StoreParameter(oMWS,'brick1V',brick1V);
f_StoreParameter(oMWS,'brick1W',brick1W);
f_StoreParameter(oMWS,'brick2U',brick2U);
f_StoreParameter(oMWS,'brick2V',brick2V);
f_StoreParameter(oMWS,'brick2W',brick2W);
f_StoreParameter(oMWS,'brick3U',brick3U);
f_StoreParameter(oMWS,'brick3V',brick3V);
f_StoreParameter(oMWS,'brick3W',brick3W);

%-- CREATE BRICK 1
f_CreateBrick(oMWS,'component1','brick1',brickMaterial,{'-brick1U' 'brick1U'},{'-brick1V' 'brick1V'},{'0' 'brick1W'});
%-- ACTIVATE LOCAL WCS
f_ActivateWCS(oMWS,'local');
%-- PICK FACE NO.1 OF COMPONENT 1, brick1
f_PickFaceFromId(oMWS,'component1','brick1',1);
%-- ALIGN WCS WITH SELECTED FACE
f_AlignWCSWithSelectedFace(oMWS);
f_ClearAllPicks(oMWS);
%-- CREATE BRICK 2
f_CreateBrick(oMWS,'component1','brick2',brickMaterial,{'-brick2U' 'brick2U'},{'-brick2V' 'brick2V'},{'0' 'brick2W'});
%-- PICK FACE NO.5 OF COMPONENT 1, brick1
f_PickFaceFromId(oMWS,'component1','brick1',5);
%-- ALIGN WCS WITH SELECTED FACE
f_AlignWCSWithSelectedFace(oMWS);
f_ClearAllPicks(oMWS);
%-- CREATE BRICK 3
f_CreateBrick(oMWS,'component1','brick3',brickMaterial,{'-brick3U' 'brick3U'},{'-brick3V' 'brick3V'},{'0' 'brick3W'});
%-- DEFINE PORT 1
f_PickFaceFromId(oMWS,'component1','brick2',1);
f_AlignWCSWithSelectedFace(oMWS);
f_PickFaceFromId(oMWS,'component1','brick2',1);
%-- PORT SETTINGS
oPort.portNumber    = 1;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '1';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE PORT 2
f_PickFaceFromId(oMWS,'component1','brick1',6);
f_AlignWCSWithSelectedFace(oMWS);
f_PickFaceFromId(oMWS,'component1','brick1',6);
%-- PORT SETTINGS
oPort.portNumber    = 2;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '2';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE PORT 3
f_PickFaceFromId(oMWS,'component1','brick1',4);
f_AlignWCSWithSelectedFace(oMWS);
f_PickFaceFromId(oMWS,'component1','brick1',4);
%-- PORT SETTINGS
oPort.portNumber    = 3;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '3';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE PORT 4
f_PickFaceFromId(oMWS,'component1','brick3',1);
f_AlignWCSWithSelectedFace(oMWS);
f_PickFaceFromId(oMWS,'component1','brick3',1);
%-- PORT SETTINGS
oPort.portNumber    = 4;
oPort.numberOfModes = 5;
oPort.coordinates   = 'Picks';
oPort.portLabel     = '4';
oPort.textSize      = 50.0;
oPort.orientation   = 'positive';
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);
%-- DEFINE MESH
oMesh.meshType                   = 'Tetrahedral';
oMesh.PBAType                    = 'PBA';
oMesh.stepsPerWavelengthTet      = 4;
oMesh.minimumStepNumberTet       = 10;
oMesh.curvatureRefinementFactor  = 0.05;
oMesh.minimumCurvatureRefinement = 40; 
f_CreateMesh(oMWS,oMesh);
%-- DEFINE FREQUENCY RANGE
oSolver.frequencyRange = [fMin fMax];
f_CreateSolver(oMWS,oSolver);
f_ActivateWCS(oMWS,'global');
%-- DEFINE FREQUENCY DOMAIN SOLVER
oFD_Solver.bAddToHistory     = 'True';
oFD_Solver.accuracyTet       = 1e-6;
oFD_Solver.stimulation       = {'List' 'List'};
oFD_Solver.stimulationList   = {'p1','1,2';'p2','2,4';'p3','1,4';'p4','3,2'};
oFD_Solver.addSampleInterval = {3.5 3.6 14 'Equidistant' 'True';3.65 3.7 13 'Automatic' 'False';3.75 3.8 13 'Equidistant' 'False'};
f_CreateFD_Solver(oMWS,oFD_Solver);
%-- DEFINE MESH ADAPTION 3D
oMeshAdaption3D.setType        = 'HighFrequencyTet';
oMeshAdaption3D.minPasses      = 4;
oMeshAdaption3D.maxPasses      = 9;
oMeshAdaption3D.maxDeltaS      = 0.0001;
oMeshAdaption3D.meshIncrement  = 6;
f_CreateMeshAdaption3D(oMWS,oMeshAdaption3D);
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




clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);

wgA = 10;
wgB = wgA;
wgZ = 5* wgA;
%===== frequency parameters  ====
fMin       = 38;
fMax       = 40;
%===== simulation parameters
N1 = 3; % number of modes @ port 1  (common wg.)
N2 = 3; % number of modes @ port 2  (V-pol rect. wg.)

%===== mesh parameters =====
oMesh.meshType                   = 'Tetrahedral';
oMesh.PBAType                    = 'PBA';
oMesh.stepsPerWavelengthTet      = 4;
oMesh.minimumStepNumberTet       = 10;
oMesh.curvatureRefinementFactor  = 0.05;
oMesh.minimumCurvatureRefinement = 100;

%===== solver parameters =====
oFD_Solver.bSParameterSweep  = 'False';
oFD_Solver.accuracyTet       = 1e-6;
oFD_Solver.stimulation       = {'List' 'List'};
oFD_Solver.stimulationList   = {'p1','1'};

oMeshAdaption3D.setType        = 'HighFrequencyTet';
oMeshAdaption3D.minPasses      = 3;
oMeshAdaption3D.maxPasses      = 3;
oMeshAdaption3D.maxDeltaS      = 1e-14;
oMeshAdaption3D.meshIncrement  = 6;


%===== creation of the CST project ======
projectName      = 'waveguide.cst';
MWS_TemplateName = 'Filter (Waveguide)^+MWS';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_CreateMWS_Template(oMWS,MWS_TemplateName);
% f_SaveAsCST_MWS_Project(oMWS,projectName);

%====== defintion of the solid model =====
Component.Name='Turnstile_Junction';
Component.Part01.Name='InnerPart';



%-- Store Global Parameters
f_StoreParameter(oMWS,'wgA',wgA);
f_StoreParameter(oMWS,'wgB',wgB);
f_StoreParameter(oMWS,'wgZ',wgZ);


%-- Create component named Turnstile_Junction
f_CreateComponent(oMWS,'component1');

%-- Create the square waveguide
f_CreateBrick(oMWS,'component1','waveguide','Vacuum',{'-wgA/2' 'wgA/2'},{'-wgB/2' 'wgB/2'},{'0' 'wgZ'});

%====== definition of the ports ======
%-- port 1
f_PickFaceFromId(oMWS,'component1','waveguide',1);
oPort.portNumber    = 1;
oPort.numberOfModes = N1;
oPort.coordinates   = 'Picks';
oPort.orientation   = 'positive';
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);

%-- port 2
f_PickFaceFromId(oMWS,'component1','waveguide',2);
oPort.portNumber    = 2;
oPort.numberOfModes = N2;
oPort.coordinates   = 'Picks';
oPort.orientation   = 'positive';
f_CreatePort(oMWS,oPort);
f_ClearAllPicks(oMWS);


%===== definition of the mesh =====
f_CreateMesh(oMWS,oMesh);

%===== defintion of frequency range =====
oSolver.frequencyRange = [fMin fMax];
f_CreateSolver(oMWS,oSolver);
f_ActivateWCS(oMWS,'global');

%===== definition of the FD solver =====
oFD_Solver.addSampleInterval = {fMin fMax 10 'Equidistant' 'False'};

f_CreateFD_Solver(oMWS,oFD_Solver);

%===== definition of mesh adaptation 3D =====
f_CreateMeshAdaption3D(oMWS,oMeshAdaption3D);

%===== set boundary =====
f_SetSymmetryPlane(oMWS,'magnetic','electric','none');  % X-Symm Plane: magnetic, Y-Symm Plane: electric, Z-Symm Plane: none
f_StartFD_Solver(oMWS);

[frequency1 s11 ] = f_GetS_Parameter(oMWS,'BY_ITERATION',1,1,1,1);
[frequency2 s21 ] = f_GetS_Parameter(oMWS,'BY_ITERATION',2,1,1,1);
figure;
subplot(2,1,1);plot(frequency1,20.*log10(abs(s11)),'r-');xlabel('Frequency[GHz]');ylabel('|s_1_1|_d_B');grid on;hold on;
subplot(2,1,2);plot(frequency2,20.*log10(abs(s21)),'r-');xlabel('Frequency[GHz]');ylabel('|s_2_1|_d_B');grid on;hold on;
%---
% dim res1 as object          'Create an object with the project
% 
% set res1 = Result3D("^e1")  'result file "projectName^e1.m3d"
% invoke(oMWS,'Result3D','C:\Users\Farooqui\Dropbox\CNR\Oscar Peverini\CST\CST MODEL GENERATOR\CST PROJECT\resdMode\Result\Port1_e1.prt');
oResult3D = invoke(oMWS,'Result3D','')
oResult3D.invoke('Load','^e-field (#0001)_1(1).m3t')
oResult3D.invoke('IsScalar')
oResult3D.invoke('GetLength')
oResult3D.invoke('GetType')

oResult1D = invoke(oMWS,'Result1D','')
oResult1D.invoke('Load','^Port1_e1')

oResult3D = invoke(oMWS,'Result3D','')
oResult3D.invoke('Load','^Port1_e1.pmm')
oResult3D.invoke('IsScalar')
oResult3D.invoke('GetLength')
oResult3D.invoke('GetType')

oResult3D.invoke('Load','"^e-field (#0001)_1(1).m3t')


% Port1_e1.prt
% 'C:\Users\Farooqui\Dropbox\CNR\Oscar Peverini\CST\CST MODEL GENERATOR\CST PROJECT\resdMode\Result\Port1_e1.prt'

% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
%f_CloseCST_StudioSuit(oCST_Studio);



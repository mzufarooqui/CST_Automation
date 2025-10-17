clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'solverAndTemplate.cst';
MWS_TemplateName = 'Coupler (Waveguide)^+MWS';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);
f_CreateMWS_Template(oMWS,MWS_TemplateName);
f_SetBackground(oMWS,'normal',1.0,1.0,50.0,50.0,25.0,25.0,50.0,50.0,'normal',0.0,'False');
f_CreateComponent(oMWS,'component1');
f_SetBoundaryType(oMWS,'electric','electric','electric','electric','electric','electric');
f_SetSymmetryPalne(oMWS,'magnetic','electric','none');
[ xSymmetryType ySymmetryType zSymmetryType ] = f_GetSymmetryPalne(oMWS);
[ xMin xMax yMin yMax zMin zMax ] = f_GetBoundaryType(oMWS);
f_CreateBrick(oMWS,'component1','brick1','Vacuum',[-2 2],[-1 1],[0 1]);
f_ActivateWCS(oMWS,'local')
f_ActivateWCS(oMWS,'global')
f_AlignWCSWithGlobalCoordinates(oMWS)
f_PickFaceFromId(oMWS,'component1','brick1',1)
f_AlignWCSWithSelected(oMWS,'Face')
f_AlignWCSWithUW_Plane(oMWS)
f_AlignWCSWithXY_Plane(oMWS)
f_AlignWCSWithXZ_Plane(oMWS)
f_AlignWCSWithYZ_Plane(oMWS)
f_RotateWCS(oMWS,'u',90)
%-- DEFINE FREQUENCY RANGE
oSolver.frequencyRange = [2 3];
f_CreateSolver(oMWS,oSolver);
status = f_AddFieldMonitor(oMWS,2.5,'Volume','Frequency','Efield')
% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
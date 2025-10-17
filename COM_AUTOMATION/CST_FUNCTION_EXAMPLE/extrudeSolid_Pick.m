clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'extrudeSolid_Pick.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);
f_CreateMWS_Template(oMWS,'Coupler (Waveguide)^+MWS');
%-- Create New Component
f_CreateComponent(oMWS,'component1');
%-- Create Brick1
f_CreateBrick(oMWS,'component1','solid1','Vacuum',[-2 2],[-1 1],[0 1]);
%-- Select face
f_PickFaceFromId(oMWS,'component1','solid1',1)
%-- Extrude solid
% f_ExtrudeSolids(oMWS,component,solid,material,height,twist,taper,mode,pointList,origin,Uvector,Vvector)
f_ExtrudeSolids(oMWS,'component1','solid2','Vacuum',4,3,1,'Picks')


% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'chamferEdge.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);

%-- Create New Component
f_CreateComponent(oMWS,'component1');
%-- Create Brick1
f_CreateBrick(oMWS,'component1','solid1','Vacuum',[-2 2],[-1 1],[0 1]);
%-- Select edge
f_PickEdgeFromId(oMWS,'component1','solid1',12,2);
%-- Chamfer
%f_ChamferEdge(oMWS,componentName,solidName,depth,angle,bSwitch,faceID)
f_ChamferEdge(oMWS,'component1','solid1',0.5,45,'False',5);

% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'blendEdge.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);

%-- Create New Component
f_CreateComponent(oMWS,'component1');
%-- Create brick1
f_CreateBrick(oMWS,'component1','brick1','Vacuum',[-5 5],[-10 10],[0 5]);
%-- Pick Edge
f_PickEdgeFromId(oMWS,'component1','brick1',1,1);
%-- Pick Edge
f_PickEdgeFromId(oMWS,'component1','brick1',2,2);
%-- Blend Edge
f_BlendEdge(oMWS,'component1','brick1',1);

% f_SaveAsCST_MWS_Project(oMWS,projfeectName);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
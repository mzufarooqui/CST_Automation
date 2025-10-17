clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'chamferCurve.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);

%-- Create New curve
f_CreateCurve(oMWS,'curve1')
%-- Create rectangle1
f_CreateRectangle(oMWS,'rectangle1','curve1',[-5 5],[-10 10])
%-- Chamfer
% f_ChamferCurve(oMWS,name,width,curve,curveItem1,curveItem2,edgeId1,edgeId2,vertexId1,vertexId2)
f_ChamferCurve(oMWS,'chamfer1',4,'curve1','rectangle1','rectangle1',2,3,3,3);

% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
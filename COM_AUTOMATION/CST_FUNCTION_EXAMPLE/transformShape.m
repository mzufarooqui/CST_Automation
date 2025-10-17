clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);

projectName      = 'translateShape.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);

L = 1;
W = 2;
H = 3;

f_StoreParameter(oMWS,'length',L);
f_StoreParameter(oMWS,'width',W);
f_StoreParameter(oMWS,'height',H);
%-- Create New Component
f_CreateComponent(oMWS,'component1');
%-- Create brick1
f_CreateBrick(oMWS,'component1','solid1','Vacuum',{'-length' 'length'},{'-width' 'width'},{'0' 'height'});

% f_TranslateShape(oMWS,'component1','solid1',[0 0 5],1);
% f_TranslateShape(oMWS,'component1',[],[0 10 0],0);

% f_ScaleShape(oMWS,'component1','solid1',[2 2 2],'CommonCenter',[0 0 0],1);
% f_ScaleShape(oMWS,'component1',[],[2 1 1],'Free',[0 0 0],0);

% f_RotateShape(oMWS,'component1','solid1',[0 0 20],'ShapeCenter',[0 0 0],1);
% f_RotateShape(oMWS,'component1',[],[0 0 90],'Free',[0 0 0],0);

f_MirrorShape(oMWS,'component1','solid1',[0 0 10],'ShapeCenter',[0 0 0],1);
f_MirrorShape(oMWS,'component1',[],[0 0 1],'Free',[0 0 0],0);


L = 0.5;
W = 4;
H = 1.5;

f_StoreParameter(oMWS,'length',L);
f_StoreParameter(oMWS,'width' ,W);
f_StoreParameter(oMWS,'height',H);
f_UpdateModel(oMWS);

% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
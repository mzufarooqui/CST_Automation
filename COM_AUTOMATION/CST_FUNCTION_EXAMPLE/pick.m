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



f_PickFaceFromPoint(oMWS,'component1','solid1',0,0,0)
f_PickEdgeFromPoint(oMWS,'component1','solid1',1,0,0)


f_PickSolidEdgeChainFromId(oMWS,'component1','solid1',1,1)
f_PickFaceChainFromId(oMWS,'component1','solid1',1)


L = 0.5;
W = 4;
H = 1.5;

f_StoreParameter(oMWS,'length',L);
f_StoreParameter(oMWS,'width' ,W);
f_StoreParameter(oMWS,'height',H);
updateModel(oMWS);

% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
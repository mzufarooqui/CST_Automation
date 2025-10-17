clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'extrudeSolid.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);

L = 1;
W = 2;
H1 = 3;
H2 = 6;

f_StoreParameter(oMWS,'length',L);
f_StoreParameter(oMWS,'width',W);
f_StoreParameter(oMWS,'height1',H1);
f_StoreParameter(oMWS,'height2',H2);
%-- Create New Component
f_CreateComponent(oMWS,'component1');
%-- Create brick1
f_CreateBrick(oMWS,'component1','solid1','Vacuum',{'-length' 'length'},{'-width' 'width'},{'0' 'height1'});

f_PickFaceFromId(oMWS,'component1','solid1',1)
f_ExtrudeSolids(oMWS,'component1','solid2','Vacuum',2,1,2)

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
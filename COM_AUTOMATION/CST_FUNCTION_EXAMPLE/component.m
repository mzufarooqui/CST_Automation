clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'component.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);

f_CreateComponent(oMWS,'component1')
f_CreateComponent(oMWS,'component2')
f_RenameComponent(oMWS,'component1','component5')
f_DeleteComponent(oMWS,'component5')

%-- DEFINE BRICK
f_CreateBrick(oMWS,'component1','brickX','Vacuum',[-20 20],[-5 5],[0 50]);
%-- DEFINE BRICK
f_CreateBrick(oMWS,'component1','brick2','Vacuum',[-20 20],[-5 0],[0 50]);
%-- DEFINE BRICK
f_CreateBrick(oMWS,'component1','brick3','Vacuum',[-20 2],[-5 5],[0 50]);
f_ChangeComponent(oMWS,'component1','component2','brickX')
f_RotateShape(oMWS,'component1',[],[0 0 90],'Free',[0 0 0],0)
f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'extrudeSolid_PointList.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);
f_CreateMWS_Template(oMWS,'Coupler (Waveguide)^+MWS');
%-- Create New Component
f_CreateComponent(oMWS,'component1');
a =  2; 
b = -2;
f_StoreDoubleParameter(oMWS,'a',a);
f_StoreDoubleParameter(oMWS,'b',b);
pointList = ['0'  'a';'a' '0';'0' 'b';'b' '0';'0'  'a'];
% f_ExtrudeSolids(oMWS,component,solid,material,height,twist,taper,mode,pointList,origin,Uvector,Vvector)
f_ExtrudeSolids(oMWS,'component1','solid1','Vacuum',4,3,1,'Pointlist',pointList,[0 0 0],[1 0 0],[0 1 0])


% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
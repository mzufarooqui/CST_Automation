clc;clear; clear global; clear variables; close all;
global allPaths
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);


projectName      = 'curve.cst';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);

MWS_TemplateName = 'Coupler (Waveguide)^+MWS';
f_CreateMWS_Template(oMWS,MWS_TemplateName)
% f_SaveAsCST_MWS_Project(oMWS,projectName);



f_CreateCurve(oMWS,'curve1')
% f_DeleteCurveItem(oMWS,'curve1','circle1')
% f_CurveItemIsClosed(oMWS,'curve1','polygon1')
% f_DeleteCurve(oMWS,'curve1')
% f_CreateCurve(oMWS,'curve1')
% f_RenameCurve(oMWS,'curve1','curve3')

% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
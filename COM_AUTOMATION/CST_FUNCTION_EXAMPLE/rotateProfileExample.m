close all;clear all;clc
addpath(genpath('D:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS'));
projectName      = 'RotateProfile.cst';
MWS_TemplateName = 'Filter (Waveguide)^+MWS';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_CreateMWS_Template(oMWS,MWS_TemplateName);
%f_SaveAsCST_MWS_Project(oMWS,projectName);
component   = 'component1';
name        = 'solid1';
material    = 'Vacuum';
mode        = 'Pointlist'; % 'Pointlist','picks'
startAngle  = 45;
angle       = 275;
height      = 0.0;
radiusRatio = 1.0;
nSteps      = 0;
origin      = [0 0 0];
rVector     = [0 1 0];
zVector     = [1 0 0];
pointList   = [0 4
    4 4
    4 2
    0 2];
f_RotateProfile(oMWS,component,name,material,mode,startAngle,angle,height,radiusRatio,nSteps,origin,rVector,zVector,pointList);
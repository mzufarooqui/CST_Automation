close all;clear;clc
%-- CST MODEL GENERATOR PATH
CST_MODEL_GENERATOR = 'C:\Users\FAROOQUI\Dropbox\CNR\Oscar Peverini\CST\CST MODEL GENERATOR VERSION01\CST MODEL GENERATOR\';
cstProjectPath      = 'C:\Users\FAROOQUI\Dropbox\CNR\G Addamo\Zun_Field\';
cstProjectName      = 'OMT_KaK_B1_TD.cst';

%-- Add CST MODEL GENERATOR path
addpath(genpath(CST_MODEL_GENERATOR));

%-- Open CST Studio Suit
hCST_Studio = f_OpenCST_StudioSuit();
%-- Open CST MWS Project
oMWS = f_OpenCST_MWS_Project(hCST_Studio,[ cstProjectPath cstProjectName]);

%-- Add E-Field Monitor at Frequency 20.4
% f_AddFieldMonitor(oMWS,20.4,'Volume','Frequency','Current')


% EXAMPLE: 1
% Get Surface current and also export data using Cutting plane
oSurfaceCurr.exportFilePathWithName = [pwd '\abc'];
[ surfaceCurr surfaceCurr_x surfaceCurr_y surfaceCurr_z surfaceCurr_KxRe surfaceCurr_KyRe surfaceCurr_KzRe surfaceCurr_KxIm surfaceCurr_KyIm surfaceCurr_KzIm ] = f_GetSurfaceCurrent(oMWS,oSurfaceCurr);
% EXAMPLE: 2
% Get Surface current using cutting place
surfaceCurr = f_GetSurfaceCurrent(oMWS,oSurfaceCurr)

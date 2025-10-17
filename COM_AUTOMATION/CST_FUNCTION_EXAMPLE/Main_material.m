close all;clear all;clc
addpath(genpath('E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS'));
projectName      = 'createMaterial.cst';
elCond           = 7143000;
oCST_Studio      = f_OpenCST_StudioSuit();
oMWS             = f_CreateCST_MWS_Project(oCST_Studio);
% f_SaveAsCST_MWS_Project(oMWS,projectName);
f_StoreParameterWithDescription(oMWS,'elCond',elCond,'Electric conductivity in S/meter');
%-- Create New Component
f_CreateComponent(oMWS,'component1');
%-- Create Material
oMaterial.name       = 'material1';
oMaterial.colour     = [ 0.8 0.8 0.8];
oMaterial.type       = 'Lossy Metal';
oMaterial.kappa    = 'elCond'; % Electric conductivity in S/meter
oMaterial.mue        = 1;
status = f_CreateMaterial(oMWS,oMaterial);
%-- Create brick1
f_CreateBrick(oMWS,'component1','brick1','material1',[-5 5],[-10 10],[0 5]);


% f_SaveAsCST_MWS_Project(oMWS,projfeectName);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
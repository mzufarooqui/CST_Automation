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
% f_AddFieldMonitor(oMWS,20.4,'Volume','Frequency','Efield')

SET_CUT_PLANE_BY_RATIO = 0; % Option: 0: Set cut plane by Ratio, 1: Set cut plane by point
if 0
    %-- Set Cut Plane by Ratio
    oPlot.abovePlaneMode = 'hide';
    oPlot.bShowCutplane  = true;
    oPlot.cutPlaneRatio  = 0.5;
    oPlot.cutPlaneNormal = 'y';
    f_SetCutPlane(oMWS,oPlot);
else
    %-- Set Cut Plane by Point
    oPlot.definePlane.nx = 0;
    oPlot.definePlane.ny = 1;
    oPlot.definePlane.nz = 0;
    oPlot.definePlane.px = 0;
    oPlot.definePlane.py = -12;
    oPlot.definePlane.pz = 0;
    oPlot.bShowCutplane  = true;
    f_SetCutPlane(oMWS,oPlot);
end


% EXAMPLE: 1
% Get H_FieldData and also export data using Cutting plane
oH_Field.exportFilePathWithName = [pwd '\abc'];
oH_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the H_FieldData
E_FieldData = f_GetH_Fields(oMWS,oH_Field)
% EXAMPLE: 2
% Get H_FieldData using cutting place
oH_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the H_FieldData
H_FieldData = f_GetH_Fields(oMWS,oH_Field)
% EXAMPLE: 3
% Get H_FieldData and also export data by defining the fixed number of sample
oH_Field.exportFilePathWithName = [pwd '\abcd'];
oH_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
oH_Field.exportMode             = 'FixedNumber';
oH_Field.stepX                  = 12;
oH_Field.stepY                  = 13;
oH_Field.stepZ                  = 14;
H_FieldData = f_GetH_Fields(oMWS,oH_Field)
% EXAMPLE: 4
% Get H_FieldData and also export data by defining the fixed width
oH_Field.exportFilePathWithName = [pwd '\abc'];
oH_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
oH_Field.exportMode             = 'FixedWidth';
oH_Field.DX                     = 2;
oH_Field.DY                     = 3;
oH_Field.DZ                     = 4;
H_FieldData = f_GetH_Fields(oMWS,oH_Field)
% EXAMPLE: 5
% Get H_FieldData by defining the fixed width
oH_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
oH_Field.exportMode             = 'FixedWidth';
oH_Field.DX                     = 2;
oH_Field.DY                     = 3;
oH_Field.DZ                     = 4;
H_FieldData = f_GetH_Fields(oMWS,oH_Field)
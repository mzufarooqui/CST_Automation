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
% Get E-Field and also export data using Cutting plane
oE_Field.exportFilePathWithName = [pwd '\abc'];
oE_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the E-Field
[ E_FieldData e_Field_x e_Field_y e_Field_z e_Field_ExRe e_Field_EyRe e_Field_EzRe e_Field_ExIm e_Field_EyIm e_Field_EzIm ] = f_GetE_Fields(oMWS,oE_Field)
% EXAMPLE: 2
% Get E-Field using cutting place
oE_Field.bPlot3DPlotsOn2DPlane  = true; % Set cut place before getting the E-Field
E_FieldData = f_GetE_Fields(oMWS,oE_Field)
% EXAMPLE: 3
% Get E-Field and also export data by defining the fixed number of sample
oE_Field.exportFilePathWithName = [pwd '\abcd'];
oE_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
oE_Field.exportMode             = 'FixedNumber';
oE_Field.stepX                  = 12;
oE_Field.stepY                  = 13;
oE_Field.stepZ                  = 14;
E_FieldData = f_GetE_Fields(oMWS,oE_Field)
% EXAMPLE: 4
% Get E-Field and also export data by defining the fixed width
oE_Field.exportFilePathWithName = [pwd '\abc'];
oE_Field.bPlot3DPlotsOn2DPlane  = false; % Do not Set cut place
oE_Field.exportMode             = 'FixedWidth';
oE_Field.DX                     = 2;
oE_Field.DY                     = 3;
oE_Field.DZ                     = 4;
E_FieldData = f_GetE_Fields(oMWS,oE_Field)
clc;clear; clear global; clear variables; close all;
addAllMyPath_130_192_36_244 % Configure this line according to PC

projectName      = 'HideUnhide.cst';
MWS_TemplateName = 'Filter (Waveguide)^+MWS';

oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_CreateMWS_Template(oMWS,MWS_TemplateName);
%f_SaveAsCST_MWS_Project(oMWS,projectName);


a    = 5;
b    = 2.5;
l1   = 10;

f_StoreParameter(oMWS,'a',a);  f_SetParameterDescription(oMWS,'a','Broader side of he waveguide');
f_StoreParameter(oMWS,'b',b);  f_SetParameterDescription(oMWS,'b','Shorter side of he waveguide');
f_StoreParameter(oMWS,'l1',l1);f_SetParameterDescription(oMWS,'l1','Length of the waveguide');

componentName = 'waveguide';
partName = 'w1';
material = 'PEC'; % This material assign to the unhide component or part of the component
% Creaet a component
f_CreateComponent(oMWS,componentName);
% Create Brick
f_CreateBrick(oMWS,componentName,'w1','PEC',{'-a' 'a'},{'-b' 'b'},{'0' 'l1'});
% Rotate Brick by 90 degree
f_RotateShape(oMWS,componentName,'w1',[0 0 90],'ShapeCenter',[0 0 0],1);
% Hide whole component
f_HideComponent(oMWS,componentName)
% Unhide whole component
f_UnhideComponent(oMWS,componentName,material)
% Hide component part
f_HideComponentPart(oMWS,componentName,partName);
% Unhide component part
f_UnhideComponentPart(oMWS,componentName,partName,material);

% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);




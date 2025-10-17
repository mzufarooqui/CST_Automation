clc;clear; clear global; clear variables; close all;
global allPaths
global tempFolderPath
currPath = pwd;
dirList = dir;
if ~strcmp(dirList(4).name,'CST PROJECT'),cd .. ,end
allPaths   = genpath(cd);
addpath(allPaths);
% tempFolderPath = 'C:\Users\Farooqui\Desktop\savehere';

projectName = 'modesCalibLine.cst';
oCST_Studio = f_OpenCST_StudioSuit();
oMWS        = f_CreateCST_MWS_Project(oCST_Studio);
f_SaveAsCST_MWS_Project(oMWS,projectName);


a = 30;
b = 20;
l = 5;
%-- Store parameter
f_StoreParameter(oMWS,'a',a);
f_StoreParameter(oMWS,'b',b);
f_StoreParameter(oMWS,'l',l);

% f_AddMacroInHistory(oMWS,'myModel.mcs');
f_AddMacroInHistory(oMWS,'C:\Users\Farooqui\Desktop\258.mcs.bas')

%-- RUN TD SOLVER
solverStatus = f_StartSolver(oMWS);

%-- GET S PARAMETER
[frequency sParameter ] = f_GetS_Parameter(oMWS,'BY_SAVEING_RESULTS',1,1,1,1);
%-- GET PORT MODES
nPtX = 12;nPtY = 12;nPtZ = 1;
portModes = f_GetPortMode(oMWS,'FixedNumber',nPtX,nPtY,nPtZ);

X=reshape(portModes(1,1,1).x,nPtX,nPtY);
Y=reshape(portModes(1,1,1).y,nPtY,nPtX);

Ex=reshape(portModes(1,1,1).ex,nPtX,nPtY);
Ey=reshape(portModes(1,1,1).ey,nPtY,nPtX);

EMag=sqrt(abs(Ex).^2+abs(Ey).^2);

figure(10),cla
% contourf(X,Y,EMag)
hold on
hQu=quiver(X,Y,Ex,Ey);
% set(hQu,'MaxHeadSize',1)
grid on
% f_SaveCST_MWS_Project(oMWS);
% f_CloseCST_MWS_Project(oMWS);
% f_CloseCST_StudioSuit(oCST_Studio);
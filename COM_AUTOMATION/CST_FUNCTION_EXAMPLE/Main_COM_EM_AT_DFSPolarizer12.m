close all;clear;clc
LIB_PATH = 'E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS';
addpath(genpath(LIB_PATH));
cstProjectPath = 'E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS\COM_AUTOMATION\CST_FUNCTION_EXAMPLE\CST_PROJECT\';
cstProjectName = 'DFSPolarizer12.cst';
NfreqAdapt  = 1;
NfreqAnal   = 11;
R           = 1.31;
blendRad    = 0.2;  % Blend radius
fMax        = 110;
fMin        = 75;
hCap_1      = 0.1;  % Height of capacitive arm
hCap_2      = 0.122;
hCap_3      = 0.1;
hInd_1      = 0.642;% Height of inductive arm
hInd_2      = 0.632;
hInd_3      = 0.642;
lCav        = 3;
lInput      = 5;
lOutput     = 5;
lStub       = 3;
numModesIn  = 3;
numModesOut = 3;
wCap_1      = 1.238;% Width of capacitive arm
wCap_2      = 1.425;
wCap_3      = 1.238;
wInd_1      = 1;    % Width of inductive arm
wInd_2      = 1;
wInd_3      = 1;
%-- Open CST-STUDIO-SUITE
oCST_Studio = f_OpenCST_StudioSuit();
%-- Open New MWS Project
oMWS = f_CreateCST_MWS_Project(oCST_Studio);
%-- Store all parameter in CST
f_StoreParameters_DFSPolarizer12(oMWS,NfreqAdapt,NfreqAnal,R,blendRad,fMax,fMin,hCap_1,hCap_2,hCap_3,hInd_1,hInd_2,hInd_3,lCav,lInput,lOutput,lStub,numModesIn,numModesOut,wCap_1,wCap_2,wCap_3,wInd_1,wInd_2,wInd_3);
%-- CST history list in MATLAB script
f_COM_EM_AT_DFSPolarizer12(oMWS,'NfreqAdapt','NfreqAnal','R','blendRad','fMax','fMin','hCap_1','hCap_2','hCap_3','hInd_1','hInd_2','hInd_3','lCav','lInput','lOutput','lStub','numModesIn','numModesOut','wCap_1','wCap_2','wCap_3','wInd_1','wInd_2','wInd_3');
%-- Run TD solver
%status = f_StartSolver(oMWS);
%-- Run FD solver
%status = f_StartFD_Solver(oMWS);
%-- Run Optimizer
%status = f_OptimizerStart(oMWS);

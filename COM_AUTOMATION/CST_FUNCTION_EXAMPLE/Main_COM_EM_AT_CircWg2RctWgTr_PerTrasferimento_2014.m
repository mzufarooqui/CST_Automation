close all;clear;clc
LIB_PATH = 'E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS';
addpath(genpath(LIB_PATH));
cstProjectPath = 'E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS\COM_AUTOMATION\CST_FUNCTION_EXAMPLE\CST_PROJECT\';
cstProjectName = 'CircWg2RctWgTr_PerTrasferimento_2014.cst';
BendRadius = 0.4;
Lwk1       = -0.29266155591805;
Lwk2       = 0.64891829039809;
Lwk3       = 1.4345473176471;
Lwk4       = 2.1605811672497;
LwkR1      = 3;
delta_wgB2 = 0;
delta_wgB3 = 0.422;
delta_wgD2 = 0;
delta_wgD3 = 0;
delta_wgH2 = 0;
delta_wgR  = 0;
lIN1       = 5;
lIN2       = 5;
lIN3       = 5;
wgA4       = 5.69;
wgB1       = 1;
wgB4       = 2;
wgD1       = 0.85006399642212;
wgR        = 3.4;
wgR1       = 3.4450238094629;
wgS1       = 0.30275726207866;
wgA1       = 2+wgD1;
wgB2       = wgB1+delta_wgB2;
wgB3       = wgB2+delta_wgB3;
wgD2       = wgD1+delta_wgD2;
wgD3       = wgD2+delta_wgD3;
wgH1       = wgB1-wgS1;
wgH2       = wgH1+delta_wgH2;
delta_wgA2 = wgA4-wgA1;
delta_wgH3 = -wgH1;
wgA2       = wgA1+delta_wgA2;
wgH3       = wgH2+delta_wgH3;
delta_wgA3 = wgA4-wgA2;
wgA3       = wgA2+delta_wgA3;
%-- Open CST-STUDIO-SUITE
oCST_Studio = f_OpenCST_StudioSuit();
%-- Open New MWS Project
oMWS = f_CreateCST_MWS_Project(oCST_Studio);
%-- Store all parameter in CST
f_StoreParameters_CircWg2RctWgTr_PerTrasferimento_2014(oMWS,BendRadius,Lwk1,Lwk2,Lwk3,Lwk4,LwkR1,delta_wgB2,delta_wgB3,delta_wgD2,delta_wgD3,delta_wgH2,delta_wgR,lIN1,lIN2,lIN3,wgA4,wgB1,wgB4,wgD1,wgR,wgR1,wgS1,wgA1,wgB2,wgB3,wgD2,wgD3,wgH1,wgH2,delta_wgA2,delta_wgH3,wgA2,wgH3,delta_wgA3,wgA3);
%-- CST history list in MATLAB script
f_COM_EM_AT_CircWg2RctWgTr_PerTrasferimento_2014(oMWS,'BendRadius','Lwk1','Lwk2','Lwk3','Lwk4','LwkR1','delta_wgB2','delta_wgB3','delta_wgD2','delta_wgD3','delta_wgH2','delta_wgH3','delta_wgR','lIN1','lIN2','lIN3','wgA1','wgA2','wgA3','wgA4','wgB1','wgB2','wgB3','wgB4','wgD1','wgD2','wgD3','wgH1','wgH2','wgH3','wgR','wgR1','wgS1');
%-- Run TD solver
%status = f_StartSolver(oMWS);
%-- Run FD solver
%status = f_StartFD_Solver(oMWS);
%-- Run Optimizer
%status = f_OptimizerStart(oMWS);

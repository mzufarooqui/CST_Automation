close all;clear;clc;
LIB_PATH = 'E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS';
cstProjectPath = [ pwd '\CST_PROJECT\' ];
% cstProjectName = 'CircWg2RctWgTr_PerTrasferimento_2014.cst';
cstProjectName = 'DFSPolarizer12.cst';
%-- Add path
addpath(genpath(LIB_PATH));

% dbstop in f_GetAllParameters.m at 4
% dbstop in f_CST_HistoryList_To_Matlab_Script.m at 70
f_CST_HistoryList_To_Matlab_Script(LIB_PATH,cstProjectPath,cstProjectName)
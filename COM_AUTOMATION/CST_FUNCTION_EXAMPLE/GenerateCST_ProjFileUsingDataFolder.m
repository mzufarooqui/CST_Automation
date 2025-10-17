close all;clear;clc;
% dbstop in f_GetAllParametersFromModel_par_File.m at 3
LIB_PATH = 'E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS';
addpath(genpath(LIB_PATH));
cstProjectPath = 'E:\CNR\G Addamo\MaLiangRecovery\Circ2dualRg';
[temp,cstProjectName,ext] = fileparts(cstProjectPath);
cstProjectName = [ cstProjectName '.cst' ];
%-- Create matlab script by reading Model.mod file
scriptName = f_CST_ModFile_To_Matlab_Script(LIB_PATH,cstProjectPath,cstProjectName);
%-- Run matlab script to generate the CST project
run(scriptName)
%-- Save the CST project in the matlab temp dir
f_SaveAsCST_MWS_Project(oMWS,[tempdir cstProjectName]);
%-- copy newly created CST project to the required dir
copyfile([tempdir cstProjectName],[ cstProjectPath '.cst']);

close all;clear;clc;
% dbstop in f_GetAllParametersFromModel_par_File.m at 31
% dbstop in f_CST_ModFile_To_Matlab_Script.m at 11
LIB_PATH = 'E:\CNR\Oscar Peverini\CST\FAROOQUI_TOOLS';
addpath(genpath(LIB_PATH));
cstProjectsPath = 'F:\temp\MaLiangData\SemCode_CircPol\CST\Testfiles';
dirInfo = dir([ cstProjectsPath '\*']);

for dirInd = 3:length(dirInfo)
    cstProjectPath = [ cstProjectsPath '\' dirInfo(dirInd).name ];
    [temp,cstProjectName,ext] = fileparts(cstProjectPath);
    cstProjectName = [ cstProjectName '.cst' ];
    fprintf(1,'\n Project Name: %s',cstProjectName);
    %-- Create matlab script by reading Model.mod file
    scriptName = f_CST_ModFile_To_Matlab_Script(LIB_PATH,cstProjectPath,cstProjectName);
    %-- Run matlab script to generate the CST project
    run(scriptName)
    %-- Save the CST project in the matlab temp dir
    f_SaveAsCST_MWS_Project(oMWS,[tempdir cstProjectName]);
    f_CloseCST_MWS_Project(oMWS);
    f_CloseCST_StudioSuit(oCST_Studio);
    %-- copy newly created CST project to the required dir
    copyfile([tempdir cstProjectName],[ cstProjectPath '.cst']);
    fprintf(1,' Iterm Num: %2d, remaining iter: %2d',dirInd-2,length(dirInfo)-dirInd-2);
end
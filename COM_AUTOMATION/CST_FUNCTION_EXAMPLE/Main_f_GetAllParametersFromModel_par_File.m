close all;clear all;clc;
fileName = 'E:\CNR\G Addamo\CircWg2RctWgTr_PerTrasferimento\CircWg2RctWgTr_PerTrasferimento\Model\3D\Model.par';
dbstop in f_GetAllParametersFromModel_par_File.m at 17
[ paramList numParam ] = ...
    f_GetAllParametersFromModel_par_File(fileName);

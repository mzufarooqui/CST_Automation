close all;clear all;clc
addAllMyPath_130_192_36_244

S11 = [0 0; 0 0];
S12 = [1 0; 0 j];
S21 = [1 0; 0 j]
S22 = [0 0; 0 0];
[S11t,S12t,S21t,S22t] = f_Convert_Smat_Polarizer(S11,S12,S21,S22);
S21t

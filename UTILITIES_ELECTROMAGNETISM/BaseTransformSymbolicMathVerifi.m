close all;clear all;clc
syms Tp TpC Tpp s11 s12 s21 s22 s13 s14 s23 s24 s31 s32 s41 s42 s33 s34 s43 s44
Tp   = 1/sqrt(2)*[1 -1j; 1 1j];
Tpp  = 1/sqrt(2)*[1 1; 1 -1];
TpC  = conj(Tp);
%--S11
S11  = [s11 s12; s21 s22];
S11t = TpC * S11 * inv(Tp);
S11tSim = simplify(2*S11t);
%--S12
S12  = [s13 s14; s23 s24];
S12t = TpC * S12 * inv(Tpp);
S12tSim = simplify(2*S12t);
%--S21
S21  = [s31 s32; s41 s42];
S21t = Tpp * S21 * inv(Tp);
S21tSim = simple(2*S21t);
%--S22
S22  = [s33 s34; s43 s44];
S22t = Tpp * S22 * inv(Tpp);
S22tSim = simplify(2*S22t);

%--S11t
fprintf(1,'\n\nS11t = 1/2 * ');
fprintf(1,'\n  %s',char(S11tSim(1,1)))
fprintf(1,'\t\t%s',char(S11tSim(1,2)))
fprintf(1,'\n  %s',char(S11tSim(2,1)))
fprintf(1,'\t\t%s',char(S11tSim(2,2)))
%--S12t
fprintf(1,'\n\nS12t = 1/2 * ');
fprintf(1,'\n  %s',char(S12tSim(1,1)))
fprintf(1,'\t\t%s',char(S12tSim(1,2)))
fprintf(1,'\n  %s',char(S12tSim(2,1)))
fprintf(1,'\t\t%s',char(S12tSim(2,2)))
%--S21t
fprintf(1,'\n\nS21t = 1/2 * ');
fprintf(1,'\n  %s',char(S21tSim(1,1)))
fprintf(1,'\t\t%s',char(S21tSim(1,2)))
fprintf(1,'\n  %s',char(S21tSim(2,1)))
fprintf(1,'\t\t%s',char(S21tSim(2,2)))
%--S22t
fprintf(1,'\n\nS22t = 1/2 * ');
fprintf(1,'\n  %s',char(S22tSim(1,1)))
fprintf(1,'\t\t%s',char(S22tSim(1,2)))
fprintf(1,'\n  %s',char(S22tSim(2,1)))
fprintf(1,'\t\t%s',char(S22tSim(2,2)))
fprintf(1,'\n\n');
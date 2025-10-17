function f_CreateProj_vpl(simDir,freqGHz,portDef)
%function f_CreateProj_vpl(adsWorkspacePath,libName,cellName,freqGHz,portDef)

%fileNameProjVpl = sprintf('%s\\simulation\\%s\\%s\\layout\\emSetup_MoM\\proj.vpl',adsWorkspacePath,libName,cellName);
fileNameProjVpl = sprintf('%s\\proj.vpl',simDir);
fid = fopen(fileNameProjVpl,'w');
% fid = fopen([ adsWorkspacePath '\simulation\Single_patch_lib\Single_patch\layout\emSetup_MoM\proj.vpl'],'w');


fprintf(fid,'CLIP -40;\n\n');

fprintf(fid,'COPOLARANGLE 0 DEG;\n\n');

fprintf(fid,'VISUALIZATIONTYPE 1;\n\n');

fprintf(fid,'PARAMETER FREQUENCY,\n');
fprintf(fid,'UNITS GHz,\n');
fprintf(fid,'PT %f;\n\n',freqGHz);

fprintf(fid,'PARAMETER PHI,\n');
fprintf(fid,'UNITS DEG,\n');
fprintf(fid,'PT 0;\n\n');

fprintf(fid,'VAR THETA,\n');
fprintf(fid,'UNITS DEG,\n');
fprintf(fid,'START -180 STOP 180;\n\n');

for ind = 1:size(portDef,1)
    fprintf(fid,'PORT %d,\n',ind);
    fprintf(fid,'UNITS VOLT,\n');
    fprintf(fid,'UNITS DEG,\n');
    fprintf(fid,'AMPLITUDE %.1f PHASE %.1f,\n',portDef(ind,1),portDef(ind,2));
    fprintf(fid,'UNITS OHM,\n');
    fprintf(fid,'UNITS RAD,\n');
    fprintf(fid,'AMPLITUDE %.1f PHASE %.1f;\n\n',portDef(ind,3),portDef(ind,4));
end
fclose(fid);

end
function [Vfreq,VRadEff]=f_load_CST_radeff_alldata(filename)


fid=fopen(filename);

str=fgets(fid);
str=fgets(fid);

str =fgets(fid);

%carica la prima sequenza di dati
ind=1;
while str~=-1
      A=sscanf(str,'%f %f');

      Vfreq(ind)=A(1);
      VRadEff(ind)=A(2);
      str =fgets(fid);
      ind=ind+1;
end;

% [VTheta,VPhi]=f_Load_CST_farfield_plots(filename,1,2);
% [VDThdB,VDPhdB]=f_Load_CST_farfield_plots(filename,4,5);

fclose(fid);

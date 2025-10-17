function [VTheta,VPhi,VDdB,VDThdB,VDPhdB,VDThPhase,VDPhPhase]=f_load_CST_farfield_alldata(filename)


fid=fopen(filename);

str=fgets(fid);
str=fgets(fid);

str =fgets(fid);

%carica la prima sequenza di dati
ind=1;
while str~=-1
      A=sscanf(str,'%f %f');

      VTheta(ind)=A(1);
      VPhi(ind)=A(2);
      VDdB(ind)=A(3);
      VDThdB(ind)=A(4);
      VDThPhase(ind)=A(5);
      VDPhdB(ind)=A(6);
      VDPhPhase(ind)=A(7);
      str =fgets(fid);
      ind=ind+1;
end;

% [VTheta,VPhi]=f_Load_CST_farfield_plots(filename,1,2);
% [VDThdB,VDPhdB]=f_Load_CST_farfield_plots(filename,4,5);

fclose(fid);

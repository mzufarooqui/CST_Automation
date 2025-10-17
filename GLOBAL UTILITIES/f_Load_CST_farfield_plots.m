function [Vfreq,VZ]=f_Load_CST_plots(filename,ind1,ind2)



%Vfreq=zeros(1,Nfreq);
%S=zeros(NmodesTOT,NmodesTOT,Nfreq);
fid=fopen(filename);

str=fgets(fid);
str=fgets(fid);

str =fgets(fid);

%carica la prima sequenza di dati
ind=1;
while str~=-1
      A=sscanf(str,'%f %f');

      Vfreq(ind)=A(ind1);
      VZ(ind)=A(ind2);
      str =fgets(fid);
      ind=ind+1;
end;








fclose(fid);




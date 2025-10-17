function [S,freq]=f_read_sNp_CST_2012(nomefile)

%lettura dei file *.s1p, *.s2p, *.sNp

%il file deve contenere i parametri S in modulo e fase,
%la frequenza deve essere in GHz

if length(nomefile)<5
    error('Specificare anche l''estensione del file');
end
if nomefile(end-3)~='.'
    if nomefile(end-4)~='.'
        error('Specificare anche l''estensione del file')
        return
    else
        tipo=4; % estensione di 4 cifre
    end
else
    tipo=3; % estensione di 3 cifre
end

if tipo==3
    if nomefile(end)=='p'
        N=str2num(nomefile(end-1)); %trova N: numero di porte
    else
        N=str2num(nomefile(end-1:end));
    end
else
    N=str2num(nomefile(end-2:end-1));
end

fid=fopen(nomefile,'rt');

if fid==-1
    error('File non esistente');
end


dum=fgets(fid);
%str=fgets(fid);
%[str]=sscanf(str,'%s');
%if ~strcmp(str,'#GHZSRIR50')
%fclose(fid);
%error('Il formato del file non è adatto a questo programma');
%end;
dum=fgets(fid);
dum=fgets(fid);
dum=fgets(fid);
dum=fgets(fid);

for i=1:N
dum=fgets(fid);
end

ifreq=0;
while 1
    ifreq=ifreq+1;
    str=fgets(fid);
    if str==-1
        fclose(fid);
        return
    end;

    [v,count]=sscanf(str,'%f');
    v=v';

    if count==0
        fclose(fid);
        return
    end;

    freq(ifreq)=v(1);
    v=v(2:end);


    if N==1
        S(ifreq)=reshape(v(1).*exp(j*v(2)/180*pi),1,1);

    elseif N==2
        S(:,:,ifreq)=reshape(v(1:2:end).*exp(j*v(2:2:end)/180*pi),N,N);
    elseif N==3
        str=fgets(fid);
        [v2,count]=sscanf(str,'%f');
        str=fgets(fid);
        [v3,count]=sscanf(str,'%f');

        v=[v v2' v3'];

        S(:,:,ifreq)=(reshape(v(1:2:end).*exp(j*v(2:2:end)/180*pi),N,N)).';

    elseif N==4
        str=fgets(fid);
        [v2,count]=sscanf(str,'%f');
        str=fgets(fid);
        [v3,count]=sscanf(str,'%f');
        str=fgets(fid);
        [v4,count]=sscanf(str,'%f');

        v=[v v2' v3' v4'];

        S(:,:,ifreq)=(reshape(v(1:2:end).*exp(j*v(2:2:end)/180*pi),N,N)).';

    elseif N>4
        nrighe=N*(ceil(N/4));


        for inr=2:nrighe
            str=fgets(fid);
            [v2,count]=sscanf(str,'%f');

            v=[v v2'];
        end;

        S(:,:,ifreq)=(reshape(v(1:2:end).*exp(j*v(2:2:end)/180*pi),N,N)).';



    else
        error('il numero di porte può essere 1 o 2 o 3 o 4');

    end



end

return



function [freq_p_dataList eps_p_dataList freq_pp_dataList eps_pp_dataList freq_p_fit eps_p_fit freq_pp_fit eps_pp_fit] = f_ReadCST_MaterialProperties(fileName)
fid = fopen(fileName,'r');
tline = fgets(fid);
while ischar(tline)
    if strfind(tline,['        Frequency / GHz                Eps'' (Fit)/real'])
        tline = fgets(fid); % skip line
        tline = fgets(fid);
        ind = 1;
        while length(tline)>2
            temp = sscanf(tline,'%f %f',inf);
            freq_p_fit(ind)  = temp(1);
            eps_p_fit(ind) = temp(2);
            tline = fgets(fid);
            ind = ind + 1;
        end
    elseif strfind(tline,['Frequency / GHz                Eps'''' (Fit)/real'])
        tline = fgets(fid); % skip line
        tline = fgets(fid);
        ind = 1;
        while length(tline)>2
            temp = sscanf(tline,'%f %f',inf);
            freq_pp_fit(ind)  = temp(1);
            eps_pp_fit(ind) = temp(2);
            tline = fgets(fid);
            ind = ind + 1;
        end
    elseif strfind(tline,['Frequency / GHz                Eps'' (Data list)/real'])
        tline = fgets(fid); % skip line
        tline = fgets(fid);
        ind = 1;
        while length(tline)>2
            temp = sscanf(tline,'%f %f',inf);
            freq_p_dataList(ind)  = temp(1);
            eps_p_dataList(ind) = temp(2);
            tline = fgets(fid);
            ind = ind + 1;
        end
    elseif strfind(tline,['Frequency / GHz                Eps'''' (Data list)/real'])
        tline = fgets(fid); % skip line
        tline = fgets(fid);
        ind = 1;
        while length(tline)>2
            temp = sscanf(tline,'%f %f',inf);
            freq_pp_dataList(ind)  = temp(1);
            eps_pp_dataList(ind) = temp(2);
            tline = fgets(fid);
            ind = ind + 1;
        end
    end
    tline = fgets(fid);
end
fclose(fid);
if ~exist('freq_p_dataList','var')
    freq_p_dataList = [];
end
if ~exist('eps_p_dataList','var')
    eps_p_dataList = [];
end
if ~exist('eps_p_dataList','var')
    eps_p_dataList = [];
end
if ~exist('freq_pp_dataList','var')
    freq_pp_dataList = [];
end
if ~exist('freq_pp_dataList','var')
    freq_pp_dataList = [];
end
if ~exist('eps_pp_dataList','var')
    eps_pp_dataList = [];
end
if ~exist('eps_pp_dataList','var')
    eps_pp_dataList = [];
end
end
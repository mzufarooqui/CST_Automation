function [xVal,yVal,paramVal] = f_GetCST_ParamData(fileName)
%-- Read the CST MWS parametric file
fid = fopen(fileName,'rt');
paramVal = [];
col = 1;
row = 1;
fLine      = fgetl(fid);
paramVal = [paramVal f_GetParamVal(fLine)];
fLine = fgetl(fid); % skip this line
while(1)
    fLine      = fgetl(fid);
    %-- Get 1 iteration
    if isempty(fLine)
        fLine      = fgetl(fid); % read next param val
        if feof(fid)
            break;
        end
        paramVal = [paramVal f_GetParamVal(fLine)];
        fLine = fgetl(fid); % skip this line
        col = 1;
        row = row + 1;
        continue
    else
        data       = str2num(fLine);
        xVal(row,col)  = data(1);
        yVal(row,col)  = data(2);
        col        = col + 1;
    end
end
fclose(fid)
end
%--------------------------
function paramVal = f_GetParamVal(fLine)
[temp tok] = strtok(fLine,'=');
paramVal = strtok(tok,'/');
paramVal = str2num(paramVal(2:end));
end
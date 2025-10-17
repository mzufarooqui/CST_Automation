function [ paramCnt paramName ParamValue ] = f_ReadAllCST_Parameters(fileName)
cnt = 1;
paramCnt = 1;
paramName = [];
fid = fopen(fileName,'r');
tline = fgetl(fid);
cnt = cnt + 1;
while ischar(tline)
    if strcmp(tline(1),'#')
        
    else
        % disp(tline)
        spaceInd             = findstr(tline,'  ');
        temp                 = {tline(1:spaceInd(1)-1)};
        paramName            = [paramName,temp];
        ParamValue(paramCnt) = str2num(tline(spaceInd(1)+2:spaceInd(2)-1));
        paramCnt = paramCnt + 1;
    end
    tline = fgetl(fid);
    cnt = cnt + 1;
end
fclose(fid);
paramCnt = paramCnt - 1;
end
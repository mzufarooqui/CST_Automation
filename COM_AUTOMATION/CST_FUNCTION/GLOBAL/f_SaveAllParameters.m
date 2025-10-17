function f_SaveAllParameters(oMWS,fileName)

projectPathWithName = invoke(oMWS,'GetProjectPath','Project');
numParam            = invoke(oMWS,'GetNumberOfParameters');
paramList = cell(numParam,3);

for paramInd = 0:numParam-1
    paramList{paramInd+1,1} = invoke(oMWS,'GetParameterName',paramInd);
    paramList{paramInd+1,2} = invoke(oMWS,'GetParameterSValue',paramInd);
    paramList{paramInd+1,3} = invoke(oMWS,'GetParameterDescription',paramList{paramInd+1,1});
end

fid = fopen(fileName,'w');
fprintf(fid,'# ===============================================================');
fprintf(fid,'\n# File Created on:');
fprintf(fid,'\n# %s',datestr(now));
fprintf(fid,'\n# Project File:');
fprintf(fid,'\n# %s.cst',projectPathWithName);
fprintf(fid,'\n# ===============================================================');
fprintf(fid,'\n# Total Number of Parameters: %d',numParam);
fprintf(fid,'\n# ===============================================================');

for paramInd = 1:numParam
    fprintf(fid,'\n%s  %s  %s',paramList{paramInd,1},paramList{paramInd,2},paramList{paramInd,3});
end
fprintf(fid,'\n# ===============================================================');

fclose(fid);
end
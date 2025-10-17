function [paramList model3DPath]= f_GetCST_ParamListInMATLABFormat(cstProjectNameWithPath,scriptName)
%-- Open CST-MWS
oCST_Studio = f_OpenCST_StudioSuit();

%-- Open Existing MWS Project
oMWS = f_OpenCST_MWS_Project(oCST_Studio,cstProjectNameWithPath);

numParam  = f_GetNumberOfParameters(oMWS);
paramList = f_GetAllParameters(oMWS);

fid = fopen(scriptName,'w');
fprintf(fid,'close all;clear all;clc\n');

%-- Save the parameter list in the main script
for iParamList = 1:size(paramList,1)
    maxLenList(iParamList)    = length(paramList{iParamList,1});
    maxLenValList(iParamList) = length(paramList{iParamList,2});
end
maxLen     = max(maxLenList);
maxLenVal  = max(maxLenValList);
for iParamList = 1:size(paramList,1)
    fprintf(fid,'%s',paramList{iParamList,1});
    %Leave empty space
    for iSpace = 1:maxLen-length(paramList{iParamList,1})
        fprintf(fid,' ');
    end
    fprintf(fid,' = %s;',paramList{iParamList,2});
    if ~isempty(paramList{iParamList,3})
        %Leave empty space
        for iSpace = 1:maxLenVal-length(paramList{iParamList,2})
            fprintf(fid,' ');
        end
        fprintf(fid,'%% %s',paramList{iParamList,3});
    end
    fprintf(fid,'\n');
end
fclose(fid);
model3DPath = f_GetProjectInfo(oMWS,'Model3D');
f_CloseCST_MWS_Project(oMWS);
f_CloseCST_StudioSuit(oCST_Studio);
end
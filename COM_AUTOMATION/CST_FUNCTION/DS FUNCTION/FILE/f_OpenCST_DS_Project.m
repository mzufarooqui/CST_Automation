function oDS = f_OpenCST_DS_Project(oCST_Studio,projectName)
% function f_OpenCST_MWS_Project(hMWS,projectName)
%-- Open CST Project
[token, remain] = strtok(projectName,':');
if isempty(remain)
    projPathWithName = [ pwd '\CST PROJECT\' projectName ];
else
    projPathWithName = projectName;
end
oDS = oCST_Studio.invoke('OpenFile',projPathWithName);
end
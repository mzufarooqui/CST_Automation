function oMWS = f_OpenCST_MWS_Project(oCST_Studio,projectName)
% function f_OpenCST_MWS_Project(hMWS,projectName)
%-- Open CST Project
[token, remain] = strtok(projectName,':');
if isempty(remain)
    projPathWithName = [ pwd '\CST PROJECT\' projectName ];
else
    projPathWithName = projectName;
end
oMWS = oCST_Studio.invoke('OpenFile',projPathWithName);
end
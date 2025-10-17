function f_SaveCST_MWS_Project(hMWS)
% function f_OpenCST_MWS_Project(hMWS,projectName)
% Saves the current state of the project, including all results obtained so
% far. 

%-- Save Project
invoke(hMWS,'Save');
end
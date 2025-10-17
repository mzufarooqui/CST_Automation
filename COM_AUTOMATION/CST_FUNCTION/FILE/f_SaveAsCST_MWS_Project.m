function f_SaveAsCST_MWS_Project(hMWS,projectName)
% function f_SaveAsCST_MWS_Project(hMWS,projectName)
% Saves the current state of the project, including all results obtained so
% far (optional with 'bIncludeResults''). 'filename' is the name of the
% project to be opened.
bIncludeResults = 'False'; % do not save the results with the project
%-- SaveAs Project
%invoke(hMWS,'SaveAs',strcat(cd,'\',projectName),bIncludeResults);
invoke(hMWS,'SaveAs',projectName,bIncludeResults);
end
function f_CloseCST_MWS_Project(oMWS)
% function f_CloseCST_MWS_Project(oMWS)
% Closes the program without saving unless the structure of the project has
% been changed.

%-- Close Project
invoke(oMWS,'Quit');
release(oMWS);
end
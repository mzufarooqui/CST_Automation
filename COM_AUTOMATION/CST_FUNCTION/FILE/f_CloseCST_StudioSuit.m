function f_CloseCST_StudioSuit(hCST_Studio)
% function f_CloseCST_StudioSuit(hCST_Studio)
% Closes the program without saving unless the structure of the project has
% been changed.

%-- Close Project
pause(2);
invoke(hCST_Studio,'Quit');
release(hCST_Studio);
end
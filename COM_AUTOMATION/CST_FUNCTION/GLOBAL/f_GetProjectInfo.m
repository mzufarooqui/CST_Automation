function info = f_GetProjectInfo(oMWS,str)
% Gets the project path. If the name of the current project is Try and its
% location is in c:\MySolvedProblems, the result of this function will be
% -----------------------------------
% Type        Path Returned
% -----------------------------------
% Root        c:\MySolvedProblems
% Project     c:\MySolvedProblems\Try
% Model3D     c:\MySolvedProblems\Try\Model\3D
% ModelCache  c:\MySolvedProblems\Try\ModelCache
% Result      c:\MySolvedProblems\Try\Result
% Temp        c:\MySolvedProblems\Try\Temp

info = invoke(oMWS,'GetProjectPath',str);
end
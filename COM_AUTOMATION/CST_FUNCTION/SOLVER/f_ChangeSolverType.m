function status = f_ChangeSolverType(oMWS,solverType)
% solverType could be 'HF Frequency Domain' or 'HF Time Domain'
% Example: 
% For Frequency domain solver
%   f_ChangeSolverType(oMWS,'HF Frequency Domain')
% For Time Domain solver
%   f_ChangeSolverType(oMWS,'HF Time Domain')
historyStr = [];
if strfind(solverType,'HF Time Domain')
    historyStr = sprintf('ChangeSolverAndMeshType "%s"',solverType);
    historyHeader = [ 'change solver type and mesh type' ];
elseif strfind(solverType,'HF Frequency Domain')
    historyStr = sprintf('ChangeSolverType "%s"',solverType);
    historyHeader = [ 'change solver type' ];
end
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end

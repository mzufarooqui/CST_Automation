function totNumPort = f_GetNumberOfPorts(oMWS)
oSolver    = oMWS.invoke('Solver');
totNumPort = oSolver.invoke('GetNumberOfPorts');
end
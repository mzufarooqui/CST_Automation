function simPort = f_GetStimulationPort(oMWS)
oSolver = oMWS.invoke('Solver');
simPort = oSolver.invoke('GetStimulationPort');
end
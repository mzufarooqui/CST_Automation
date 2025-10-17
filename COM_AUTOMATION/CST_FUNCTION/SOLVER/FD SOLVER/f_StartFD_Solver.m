function status = f_StartFD_Solver(oMWS)
%% START FD SOLVER
%% EXAMPLE
%  status = f_StartFD_Solver(oMWS)
%% MATLAB SCRIPT
oFDSolver        = oMWS.invoke('FDSolver');
status           = 0;
while status == 0
    status           = oFDSolver.invoke('Start');
    if status == 0
        disp(['******* Solver Restart, For more Info, see the Message Window *****************************************'])
    end
end
end
function status = f_StartSolver(oMWS)
%% START SOLVER
%% EXAMPLE
%  status = f_StartSolver(oMWS)
%% MATLAB SCRIPT
oSolver          = oMWS.invoke('Solver');
status           = 0;
while status == 0
    status           = oSolver.invoke('Start');
    if status == 0
        disp(['******* Solver Restart, For more Info, see the Message Window *****************************************'])
    end
end
end

function f_DeleteAllGoals(oMWS)
% Deletes all goals that were previously created.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'DeleteAllGoals');
end
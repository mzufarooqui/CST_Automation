function f_SetGoalUseFlag(oMWS,bFlag)
% Marks a previously defined goal to be used or not to be used for the optimization. 
% You must select a previously defined goal using the f_SelectGoal method before you can apply this method.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalUseFlag',bFlag);
end
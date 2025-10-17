function f_SetGoalTarget(oMWS,val)
% Sets a target value for a previously defined goal. You must select a previously
% defined goal using the f_SelectGoal method before you can apply this method.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalTarget',val);
end
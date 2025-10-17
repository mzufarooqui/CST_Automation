function f_SetGoal1DCResultName(oMWS,resultName)
% Set the tree name of a complex valued 1D result to the previously selected 1DC goal.
 oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoal1DCResultName',resultName);
end
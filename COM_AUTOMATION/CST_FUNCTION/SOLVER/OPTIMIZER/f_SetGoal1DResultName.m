function f_SetGoal1DResultName(oMWS,resultName)
% Set the tree name of a 1D result to the previously selected 1D goal. 
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoal1DResultName',resultName);
end
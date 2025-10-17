function f_SetGoalRange(oMWS,min,max)
%  Set a range for a previously selected 1D or 1DC result goal. 
% You must select a previously defined 1D result goal using the SelectGoal method before you can apply this method.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalRange',min,max);
end
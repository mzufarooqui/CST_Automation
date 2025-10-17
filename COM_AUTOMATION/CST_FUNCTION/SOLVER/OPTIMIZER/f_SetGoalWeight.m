function f_SetGoalWeight(oMWS,val)
% Each goal can be weighted. Thus it is possible to distinguish between goals of greater or less importance. 
% You must select a previously defined goal using the SelectGoal method before you can apply this method.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalWeight',val);
end
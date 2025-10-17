function f_SetGoalTargetMax(oMWS,target2)
% Sets a previously defined goal to use target2 as maximum target.
% This setting has only an effect if the goal is set to use a slope operator, set by the method UseSlope.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalTargetMax',target2);
end
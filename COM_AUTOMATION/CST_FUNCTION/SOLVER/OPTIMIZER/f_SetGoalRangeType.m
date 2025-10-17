function f_SetGoalRangeType(oMWS,rangeType)
% For a defined template based post processing 1D result goal, you can define the range that is being evaluated with this goal while the optimization is running. If the 1D result goal is based on an S-Parameter template then the range may cover the entire frequency range (total) of the simulation, only a part of the simulation's frequency range (range) or only one single frequency point (single). You must select a previously defined 1D result goal using the SelectGoal method before you can apply this method.
%         'total'
%         'range'
%         'single'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalRangeType',rangeType);
end
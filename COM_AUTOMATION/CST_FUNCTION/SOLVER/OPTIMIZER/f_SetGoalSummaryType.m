function f_SetGoalSummaryType(oMWS,goalSumType)
% Selects a summary type of all goals. The optimizer will minimize the sum or the maximum of all goals corresponding to what is selected. 
%   'Sum_All_Goals' 
%   'Max_All_Goals'
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalSummaryType',goalSumType);
end
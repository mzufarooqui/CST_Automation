function f_SelectGoal(oMWS,goalID,bFlag)
% Selects the goal specified by its ID id. The ID is returned when the goal is created 
% using the AddGoal function. It is necessary to call this method before many other 
% methods may be called because these other methods apply to a previously selected goal.
% 
% If bFlag is True the selected goal is used for the optimization else it is ignored.
    
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SelectGoal',goalID,bFlag);
end
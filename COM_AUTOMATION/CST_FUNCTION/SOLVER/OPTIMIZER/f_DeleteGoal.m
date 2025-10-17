function f_DeleteGoal(oMWS,goalID)
% Deletes the specified goal. To specify the goal use the ID that is returned by the AddGoal function when the goal is created.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'DeleteGoal',goalID);
end
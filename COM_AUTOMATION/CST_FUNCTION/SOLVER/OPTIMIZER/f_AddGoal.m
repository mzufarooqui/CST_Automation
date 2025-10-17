function goalID = f_AddGoal(oMWS,goalType)
% Creates a new goal and adds it to the internal list of goals. Upon creation an ID is created for
% each goal which is returned by this function. The newly defined goal is selected automatically for use 
% with the currently selected optimizer. The newly defined goal is selected automatically for use 
% with the currently selected optimizer.
% goalType can have one of the following values:
% '1D Primary Result'	
%       Adds a goal for 1D result data	
%       A goal specification can be done on some 1D result in the result tree, e.g. Time signal equal zero at t equal 3 Milliseconds.
% '1DC Primary Result'	
%       Adds a goal for complex valued 1D result data	
%       A goal specification can be done on some complex valued 1D result in the result tree, e.g. S-Parameter 'S11'  smaller -20 dB from 2-3 GHz.
% '0D Result'	
%       Adds a template based post processing goal for 0D result data	
%       A goal specification can be done on some template based post processing result that creates a single value, e.g. the maximum gain of a farfield monitored at a certain frequency.
% '1D Result'	
%       Adds a template based post processing goal for 1D result data	
%       A goal specification can be done on some template based  post processing that creates1D result data.
% '1DC Result'	
%       Adds a template based post processing goal for complex valued 1D result data	
%       A goal specification can be done on some template based  post processing that creates1DC result data.
    
oOptimizer = invoke(oMWS,'Optimizer');
goalID = invoke(oOptimizer,'AddGoal',goalType);
goalID = invoke(oOptimizer,'SelectGoal',goalID,'True');
end
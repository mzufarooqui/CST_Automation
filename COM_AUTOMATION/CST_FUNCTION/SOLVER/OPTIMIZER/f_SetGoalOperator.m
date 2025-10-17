function f_SetGoalOperator(oMWS,opType)
% Almost every goal needs a goal operator that indicates how to evaluate the goal function value. 
% The selectable operator types depend on the goal type of the currently selected goal. 
% E.g. the operators "min", "max", "<", ">" or "="  indicate that a goal function should be minimized, maximized, 
% lowered under or raised upon a certain value or that the goal function should reach a certain value respectively.
% You must select a previously defined goal using the SelectGoal method before you can apply this method.
%
% operatorType can have one of the following values:
% <
% 	lower goal function value under a given target value
% 	0D and 1D template based post processing goals
% >
% 	raise goal function value upon a given target value
% 	0D and 1D template based post processing goals
% =
% 	0D and 1D template based post processing goals
% 	0D and 1D template based post processing goals
% min
% 	minimize goal function
% 	1D results based on the amplitude or dB entity of an S-Parameter template
% max
% 	maximize goal function
% 	1D results based on the amplitude or dB entity of an S-Parameter template
% move min
% 	minimize the abscissa distance of the minimum of the 1D result to the selected target. Keep in mind that sensitivities can't be exploited if this goal is used because the min operator is not differentiable
% 	1D template based post processing goals
% move max
% 	minimize the distance of the maximum of the 1D result to the selected target. Keep in mind that sensitivities can't be exploited if this goal is used because the max operator is not differentiable
% 	1D template based post processing goals
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalOperator',opType);
end
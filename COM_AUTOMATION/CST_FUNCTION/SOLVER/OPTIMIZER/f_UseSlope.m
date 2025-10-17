function f_UseSlope(oMWS,bFlag)
% Sets a previously defined goal to use a slope for the goal operator. 
% The selected goal needs to be defined on a range and the operators have 
% to be "<", ">" or "=". The slope will be from the target at the minimum range
% to the maximum target at the maximum range.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'UseSlope',bFlag);
end
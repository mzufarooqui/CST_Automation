function f_SetNumRefinements(oMWS,number)
% Sets the number of Quasi-Newton optimizer passes. With each Quasi-Newton optimizer pass past the first pass, 
% the minimum and maximum parameter values are refined around the optimal parameter values found in the previous pass.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetNumRefinements',number);
end 
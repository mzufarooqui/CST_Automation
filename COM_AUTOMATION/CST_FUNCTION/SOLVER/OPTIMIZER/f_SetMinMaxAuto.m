function f_SetMinMaxAuto(oMWS,percentage)
% Sets the specified percentage for the calculation of the minimum and maximum values for all parameters.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetMinMaxAuto',percentage);
end
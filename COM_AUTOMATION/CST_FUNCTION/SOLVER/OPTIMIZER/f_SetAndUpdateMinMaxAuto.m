function f_SetAndUpdateMinMaxAuto(oMWS,percentage)
% Resets the minimum and maximum values for all parameters. The new minimum and maximum values are calculated by 
% subtracting respectively adding the specified percentage of the current parameter values to the current parameter values. 
% If a parameter is 0 (or very close to 0), the minimum and maximum values are set to the negative respectively positive percentage value
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetAndUpdateMinMaxAuto',percentage);
end
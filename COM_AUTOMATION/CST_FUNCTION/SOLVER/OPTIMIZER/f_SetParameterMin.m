function status = f_SetParameterMin(oMWS,paramVal)
% Set the minimum value the currently selected parameter can reach. You must select a parameter using the SelectParameter  method before you can apply this method.
oOptimizer = invoke(oMWS,'Optimizer');
status     = invoke(oOptimizer,'SetParameterMin',paramVal);
end
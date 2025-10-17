function status = f_SetParameterMax(oMWS,paramVal)
% Set the maximum value the currently selected parameter can reach. You must select a parameter using the SelectParameter  method before you can apply this method.
oOptimizer = invoke(oMWS,'Optimizer');
status     = invoke(oOptimizer,'SetParameterMax',paramVal);
end
function status = f_SetParameterInit(oMWS,paramVal)
% This method initializes a previously selected parameter with the given value. 
% The parameter is selected using the f_SelectParameter method.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetAlwaysStartFromCurrent','False');
status     = invoke(oOptimizer,'SetParameterInit',paramVal);
end
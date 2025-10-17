function status = f_ResetParameterList(oMWS)
%Deselect all parameters in the optimizer's parameter list. After calling this function no parameter is chosen to be optimized.
oOptimizer = invoke(oMWS,'Optimizer');
status     = invoke(oOptimizer,'ResetParameterList');
end
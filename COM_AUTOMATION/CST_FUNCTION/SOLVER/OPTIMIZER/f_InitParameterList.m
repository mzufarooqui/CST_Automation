function status = f_InitParameterList(oMWS)
%Initialize the optimizer's parameter list from the projects parameter list.
oOptimizer = invoke(oMWS,'Optimizer');
status     = invoke(oOptimizer,'InitParameterList');
end
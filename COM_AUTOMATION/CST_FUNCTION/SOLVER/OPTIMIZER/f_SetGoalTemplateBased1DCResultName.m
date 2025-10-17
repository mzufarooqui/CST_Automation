function f_SetGoalTemplateBased1DCResultName(oMWS,resultName)
% Set the name of a complex valued template based post processing 1D result. 
% The name needs to be an absolute path containing the template based post processing
% path and the template name to the previously selected template based postprocessing 1DC goal.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalTemplateBased1DCResultName',resultName);
end
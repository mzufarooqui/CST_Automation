function f_SetGoalTemplateBased1DResultName(oMWS,resultName)
% Set the name of a template based post processing 1D result. 
% The name needs to be an absolute path containing the template based post
% processing path and the template name to the previously selected template based postprocessing 1D goal.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalTemplateBased1DResultName',resultName);
end
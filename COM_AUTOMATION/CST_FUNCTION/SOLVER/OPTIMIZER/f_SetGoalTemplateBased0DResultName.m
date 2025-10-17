function f_SetGoalTemplateBased0DResultName(oMWS,resultName)
% Set the name of a template based post processing 0D result. 
% The name needs to be an absolute path containing the template based post 
% processing path and the template name to the previously selected template based postprocessing 0D goal.
oOptimizer = invoke(oMWS,'Optimizer');
invoke(oOptimizer,'SetGoalTemplateBased0DResultName',resultName);
end
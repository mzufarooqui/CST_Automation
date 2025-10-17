function numOfVarParam = f_GetNumberOfVaryingParameters(oMWS)
% Returns the number of varying parameters.
oOptimizer = invoke(oMWS,'Optimizer');
numOfVarParam = invoke(oOptimizer,'GetNumberOfVaryingParameters');
end
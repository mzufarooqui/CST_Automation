function nameOfVarParam = f_GetNameOfVaryingParameter(oMWS,index)
% Returns the name of the parameter referenced by index between 0 and N-1, where N can be determined by GetNumberOfVaryingParameters.
oOptimizer = invoke(oMWS,'Optimizer');
nameOfVarParam = invoke(oOptimizer,'GetNameOfVaryingParameter',index);
end
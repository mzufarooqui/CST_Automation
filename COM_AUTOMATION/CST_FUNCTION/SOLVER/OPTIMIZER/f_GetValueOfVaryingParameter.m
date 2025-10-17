function valOfVarParam = f_GetValueOfVaryingParameter(oMWS,index)
% Returns the value of the parameter referenced by index between 0 and N-1, where N can be determined by GetNumberOfVaryingParameters.
oOptimizer = invoke(oMWS,'Optimizer');
valOfVarParam = invoke(oOptimizer,'GetValueOfVaryingParameter',index);
end
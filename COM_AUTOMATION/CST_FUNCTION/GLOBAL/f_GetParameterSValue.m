function parameterValueExpression = f_GetParameterSValue(oMWS,index)
% Returns the numerical expression for the parameter referenced by the given index. The first parameter is referenced by the index 0.
parameterValueExpression = oMWS.invoke('GetParameterSValue',index);
end
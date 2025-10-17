function numExpressionOfSpecifiedParameter = f_RestoreParameterExpression(oMWS,name)
% Gets the numerical expression for the specified string parameter.
numExpressionOfSpecifiedParameter = oMWS.invoke('RestoreParameterExpression',name);
end
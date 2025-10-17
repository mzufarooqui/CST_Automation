function parameterName = f_GetParameterName(oMWS,index)
% Returns the name of the parameter referenced by the given index. The first parameter is reference by the index 0.
parameterName = oMWS.invoke('GetParameterName',index);
end
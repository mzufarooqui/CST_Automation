function parameterValue = f_GetParameterNValue(oMWS,index)
% Returns the value of the double parameter referenced by the given index. The first parameter is referenced by the index 0.
parameterValue = oMWS.invoke('GetParameterNValue',index);
end 
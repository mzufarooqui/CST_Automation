function numOfParameters = f_GetNumberOfParameters(oMWS)
% Returns the number of parameters defined so far.
numOfParameters = oMWS.invoke('GetNumberOfParameters');
end
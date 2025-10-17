function valueOfSpecifiedString = f_RestoreParameter(oMWS,name)
% Gets the value of the specified string parameter.
valueOfSpecifiedString = oMWS.invoke('RestoreParameter',name);
end
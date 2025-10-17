function valueSpecifiedDoubleParameter = f_RestoreDoubleParameter(oMWS,name)
% Gets the value of a specified double parameter.
valueSpecifiedDoubleParameter = oMWS.invoke('RestoreDoubleParameter',name);
end
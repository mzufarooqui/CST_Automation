function f_StoreDoubleParameter(oMWS,name,value)
% Creates a new double parameter or changes an existing one, with the specified double value.
oMWS.invoke('StoreDoubleParameter',name,value);
end
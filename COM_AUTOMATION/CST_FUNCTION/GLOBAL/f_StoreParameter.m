function f_StoreParameter(oMWS,name,value)
% Creates a new string parameter or changes an existing one, with the specified string value.
oMWS.invoke('StoreParameter',name,value);
end
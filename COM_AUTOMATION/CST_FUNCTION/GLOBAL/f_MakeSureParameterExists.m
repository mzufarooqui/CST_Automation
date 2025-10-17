function f_MakeSureParameterExists(oMWS,name,value)
% Makes sure that the parameter name is available. If it is already defined it is left unchanged. If there is no parameter name, it is created with the specified value.
oMWS.invoke('MakeSureParameterExists',name,value);
end

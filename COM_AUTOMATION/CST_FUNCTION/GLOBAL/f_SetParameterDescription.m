function f_SetParameterDescription(oMWS,name,description)
% Defines the description for a given parameter, which is specified by its name.
oMWS.invoke('SetParameterDescription',name,description);
end
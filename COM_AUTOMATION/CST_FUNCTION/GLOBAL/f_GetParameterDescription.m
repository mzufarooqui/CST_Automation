function description = f_GetParameterDescription(oMWS,name)
% Returns the description of a given parameter, which is specified by its name.
description = oMWS.invoke('GetParameterDescription',name);
end
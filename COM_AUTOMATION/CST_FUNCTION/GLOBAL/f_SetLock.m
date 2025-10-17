function f_SetLock(oMWS,boolSwitch)
%% MIRROR SHAPE
% # Disables the interaction with the CST MICROWAVE STUDIO®. No user actions can be made. After a MATLAB-Script has been executed, Lock is automatically reset to False.
%% EXAMPLE:
% status = f_SetLock(oMWS,boolSwitch)
% status = f_SetLock(oMWS,'True')
% status = f_SetLock(oMWS,'False')
%% MATLAB SCRIPT
oMWS.invoke('SetLock',boolSwitch);
end
function status = f_DeleteComponentPart(oMWS,ComponentName,SolidName)
% Delete component.
% EXAMPLE
% status = f_DeleteComponentPart(oMWS,'component01','solid01')
historyStr = sprintf('Solid.Delete "%s:%s"',ComponentName,SolidName);
historyHeader = [ 'delete shape: ' ComponentName ':' SolidName];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end


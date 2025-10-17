function status = f_RenameCurve(oMWS,oldName,newName)
% This function is used to Renames a specified curve object.
% EXAMPLE:
% status = f_RenameCurve(oMWS,oldName,newName)
% status = f_RenameCurve(oMWS,'curve1','curve3')
historyStr = sprintf('Curve.RenameCurve "%s", "%s"',oldName,newName);
historyHeader = [ 'rename curve: ' oldName ' to: ' newName];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
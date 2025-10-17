function status = f_DeleteCurve(oMWS,name)
% This function is used to Deletes a specified curve object.
% EXAMPLE:
% status = f_DeleteCurve(oMWS,Name)
% status = f_DeleteCurve(oMWS,'Curve1')
historyStr = sprintf('Curve.DeleteCurve "%s"',name);
historyHeader = [ 'delete curve: ' name];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
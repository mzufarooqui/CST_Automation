function status = f_CreateCurve(oMWS,name)
% This function is used to apply operations on curves and curve items.
% EXAMPLE:
% status = f_CreateCurve(oMWS,Name)
% status = f_CreateCurve(oMWS,'Curve1')
historyStr = sprintf('Curve.NewCurve "%s"',name);
historyHeader = [ 'new curve: ' name];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
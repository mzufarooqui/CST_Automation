function status = f_DeleteCurveItem(oMWS,curveName,curveItemName)
% This function is used to Deletes a specified item object associated to a curve object.
% EXAMPLE:
% status = f_DeleteCurveItem(oMWS,curveName,curveItemName)
% status = f_DeleteCurveItem(oMWS,'curve1','circle1')
historyStr = sprintf('Curve.DeleteCurveItem "%s", "%s"',curveName,curveItemName);
historyHeader = [ 'delete curve item: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
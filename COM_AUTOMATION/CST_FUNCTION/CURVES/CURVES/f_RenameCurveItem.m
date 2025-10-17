function status = f_RenameCurveItem(oMWS,curveName,oldCurveItemName,newCurveItemName)
% This function is used to Renames a specified item object associated to a curve object.
% EXAMPLE:
% status = f_RenameCurveItem(oMWS,curveName,oldCurveItemName,newCurveItemName)
% status = f_RenameCurveItem(oMWS,'curve1','circle1','circle6')
historyStr = [];
historyStr = strcat(historyStr,['Curve.RenameCurveItem "' curveName '","' oldCurveItemName '","' newCurveItemName ]);
historyHeader = [ 'RenameCurveItem ' curveName ':' oldCurveItemName ':' newCurveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
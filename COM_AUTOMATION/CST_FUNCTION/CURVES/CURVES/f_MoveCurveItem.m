function status = f_MoveCurveItem(oMWS,curveItemName,oldCurveName,newCurveName)
% This function is used to Moves a specified item from the curve it belongs to another curve object.
% EXAMPLE:
% status = f_MoveCurveItem(oMWS,curveItemName,oldCurveName,newCurveName)
% status = f_MoveCurveItem(oMWS,'circle1','curve1','curve5')
historyStr = [];
historyStr = strcat(historyStr,['Curve.MoveCurveItem "' curveItemName '","' oldCurveName '","' newCurveName ]);
historyHeader = [ 'MoveCurveItem ' curveItemName ':' oldCurveName ':' newCurveName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
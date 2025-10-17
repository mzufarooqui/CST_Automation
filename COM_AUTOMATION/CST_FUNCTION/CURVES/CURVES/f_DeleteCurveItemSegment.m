function status = f_DeleteCurveItemSegment(oMWS,curveName,curveItemName,edgeID)
% This function is used to Deletes a segment of an item object associated to a curve object. The segment is specified by the name of the curve and the item that it belongs as well as an identity number.
% EXAMPLE:
% status = f_DeleteCurveItemSegment(oMWS,curveName,curveItemName,edgeID)
% status = f_DeleteCurveItemSegment(oMWS,'curve1','circle1',1)
historyStr = [];
historyStr = strcat(historyStr,['Curve.DeleteCurveItemSegment "' curveName '","' curveItemName '","' num2str(edgeID) ]);
historyHeader = [ 'DeleteCurveItemSegment ' curveName ':' curveItemName ':' num2str(edgeID) ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
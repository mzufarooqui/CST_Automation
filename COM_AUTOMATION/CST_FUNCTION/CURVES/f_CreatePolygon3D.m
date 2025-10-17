function status = f_CreatePolygon3D(oMWS,curveItemName,curveName,pointList)
% This function is used to create a new polygon3D curve item.
% curveItemName ( name ellipsename )
%         Sets the name of the polygon3D.
% curveName ( name curvename  )
%         Sets the name of the curve for the new Polygon3D curve item. The curve must already exist.
% pointList 
%         A list of point to draw the polygon e.g. pointList = [0 3 4; -4 0 4;-3 -2 4; 0 -2 4; 3 0 4]
% EXAMPLE:
% status = f_CreatePolygon3D(oMWS,curveItemName,curveName,pointList)
% pointList = [0 3 4; -4 0 4;-3 -2 4; 0 -2 4; 3 0 4]
% status = f_CreatePolygon3D(oMWS,'Polygon3D','curve1',pointList)

historyStr = [];
historyStr = sprintf('With Polygon3D');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,curveItemName);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
for rowInd = 1:size(pointList,1)
    historyStr = sprintf('%s\n\t.Point "%s", "%s", "%s"',historyStr,num2str(pointList(rowInd,1)),num2str(pointList(rowInd,2)),num2str(pointList(rowInd,3)));
end
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve 3dpolygon: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
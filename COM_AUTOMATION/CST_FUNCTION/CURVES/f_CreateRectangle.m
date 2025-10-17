function status = f_CreateRectangle(oMWS,curveItemName,curveName,xRange,yRange)
% This function is used to create a new rectangle curve item.
% curveItemName
%         Sets the name of the rectangle.
% curveName ( name curvename  )
%         Sets the name of the curve for the new rectangle curve item. The curve must already exist.
% Xrange ( double xmin, double xmax )
%         Sets the bounds for the x- or u-coordinate for the new rectangle, depending if a local coordinate system is active or not.
% Yrange ( double ymin, double ymax )
%         Sets the bounds for the y- or v-coordinate for the new rectangle, depending if a local coordinate system is active or not.
% EXAMPLE:
% status = f_CreateRectangle(oMWS,curveItemName,curveName,xRange,yRange)
% status = f_CreateRectangle(oMWS,'rectangle1','curve1',[-5 5],[-10 10])
% status = f_CreateRectangle(oMWS,'rectangle1','curve1',{'-xParam' 'xParam'},{'-yParam' 'yParam'})

if iscell(xRange(1))
    xRangeMin = num2str(cell2mat(xRange(1)));
    xRangeMax = num2str(cell2mat(xRange(2)));
else
    xRangeMin = num2str(xRange(1));
    xRangeMax = num2str(xRange(2));
end

if iscell(yRange(1))
    yRangeMin = num2str(cell2mat(yRange(1)));
    yRangeMax = num2str(cell2mat(yRange(2)));
else
    yRangeMin = num2str(yRange(1));
    yRangeMax = num2str(yRange(2));
end

historyStr = [];
historyStr = sprintf('With Rectangle');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,curveItemName);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
historyStr = sprintf('%s\n\t.Xrange "%s", "%s"',historyStr,xRangeMin,xRangeMax);
historyStr = sprintf('%s\n\t.Yrange "%s", "%s"',historyStr,yRangeMin,yRangeMax);
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve rectangle: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
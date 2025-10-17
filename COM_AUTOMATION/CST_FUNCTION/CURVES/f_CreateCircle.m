function status = f_CreateCircle(oMWS,curveName,curveItemName,radius,xCenter,yCenter,segments)
% This function is used to create a new circle curve item.
% Reset
%         Resets all internal settings to their default values.
% Name ( name circlename )
%         Sets the name of the circle.
% Curve ( name curvename  )
%         Sets the name of the curve for the new circle curve item. The curve must already exist.
% Radius ( double radius )
%         Sets the radius for the circle.
% Xcenter ( double xcenter )
%         Sets the x-coordinate from the center point of the circle.
% Ycenter ( double  ycenter )
%         Sets the y-coordinate from the center point of the circle.
% segments ( int segments )
%         Sets the number of parts the circle should be segmented.The value must be either 0 or greater than 2.
% EXAMPLE:
% status = f_CreateCircle(oMWS,curveItemName,curveName,radius,xCenter,yCenter,segments)
% status = f_CreateCircle(oMWS,'circle1','curve1',1,0,0,0)

if isnumeric(radius),   radius = num2str(radius);end
if isnumeric(xCenter),  xCenter = num2str(xCenter);end
if isnumeric(yCenter),  yCenter = num2str(yCenter);end
if isnumeric(segments), segments = num2str(segments);end

historyStr = [];
historyStr = sprintf('With Circle');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,curveItemName);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
historyStr = sprintf('%s\n\t.Radius "%s"',historyStr,radius);
historyStr = sprintf('%s\n\t.Xcenter "%s"',historyStr,xCenter);
historyStr = sprintf('%s\n\t.Ycenter "%s"',historyStr,yCenter);
historyStr = sprintf('%s\n\t.Segments "%s"',historyStr,segments);
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve circle: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
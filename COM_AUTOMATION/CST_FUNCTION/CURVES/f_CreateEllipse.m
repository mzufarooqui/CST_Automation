function status = f_CreateEllipse(oMWS,curveItemName,curveName,xRadius,yRadius,xCenter,yCenter,segments)
% This function is used to create a new circle curve item.
% curveItemName ( name ellipsename )
%         Sets the name of the ellipse.
% curveName ( name curvename  )
%         Sets the name of the curve for the new ellipse curve item. The curve must already exist.
% XRadius ( double radiusXdirection )
%         Sets the radius in x-direction for the ellipse.
% YRadius ( double radiusYdirection )
%         Sets the radius in y-direction for the ellipse.
% Xcenter ( double  xcenter )
%         Sets the x-coordinate from the center point of the ellipse.
% Ycenter ( double  ycenter )
%         Sets the y-coordinate from the center point of the ellipse.
% segments ( int segments )
%         Sets the number of parts the ellipse should be segmented. The value must be either 0 or greater than 2.
% EXAMPLE:
% status = f_CreateEllipse(oMWS,curveItemName,curveName,xRadius,yRadius,xCenter,yCenter,segments)
% status = f_CreateEllipse(oMWS,'ellipse1','curve1',3.9,1.6,0,0,0)


if isnumeric(xRadius),  xRadius  = num2str(xRadius); end
if isnumeric(yRadius),  yRadius  = num2str(yRadius); end
if isnumeric(xCenter),  xCenter  = num2str(xCenter); end
if isnumeric(yCenter),  yCenter  = num2str(yCenter); end
if isnumeric(segments), segments = num2str(segments);end

historyStr = [];
historyStr = sprintf('With Ellipse');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,curveItemName);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
historyStr = sprintf('%s\n\t.XRadius "%s"',historyStr,xRadius);
historyStr = sprintf('%s\n\t.YRadius "%s"',historyStr,yRadius);
historyStr = sprintf('%s\n\t.Xcenter "%s"',historyStr,xCenter);
historyStr = sprintf('%s\n\t.Ycenter "%s"',historyStr,yCenter);
historyStr = sprintf('%s\n\t.Segments "%s"',historyStr,segments);
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve ellipse: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
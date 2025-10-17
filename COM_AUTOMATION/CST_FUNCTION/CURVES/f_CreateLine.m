function status = f_CreateLine(oMWS,curveItemName,curveName,x1,y1,x2,y2)
% This function is used to create a new line curve item.
% curveItemName ( name linename )
%         Sets the name of the line.
% curveName ( name curvename  )
%         Sets the name of the curve for the new line curve item. The curve must already exist.
% X1 ( double x1 )
%         Sets the x-coordinate from the first point of the line.
% Y1 ( double y1 )
%         Sets the y-coordinate from the first point of the line.
% X2 ( double x2 )
%         Sets the x-coordinate from the second point of the line.
% Y2 ( double y2 )
%         Sets the y-coordinate from the second point of the line.
% EXAMPLE:
% status = f_CreateLine(oMWS,curveItemName,curveName,x1,y1,x2,y2)
% status = f_CreateLine(oMWS,'line1','curve1',x1,y1,x2,y2)

if isnumeric(x1), x1 = num2str(x1);end
if isnumeric(y1), y1 = num2str(y1);end
if isnumeric(x2), x2 = num2str(x2);end
if isnumeric(y2), y2 = num2str(y2);end

historyStr = [];
historyStr = sprintf('With Line');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,curveItemName);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
historyStr = sprintf('%s\n\t.X1 "%s"',historyStr,x1);
historyStr = sprintf('%s\n\t.Y1 "%s"',historyStr,y1);
historyStr = sprintf('%s\n\t.X2 "%s"',historyStr,x2);
historyStr = sprintf('%s\n\t.Y2 "%s"',historyStr,y2);
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve line: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
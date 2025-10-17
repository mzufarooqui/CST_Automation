function status = f_CreateArc(oMWS,curveItemName,curveName,orientation,xCenter,yCenter,x1,y1,x2,y2,bUseAngle,angle,segment)
% This function is used to create a new Arc curve item.
% curveItemName
%         Sets the name of the Arc.
% curveName
%         Sets the name of the curve for the new Arc curve item. The curve must already exist.
% Orientation ( enum{'Clockwise', 'CounterClockwise'} orientationtype )
%         Sets the direction for the arc. If the start point and the end point is connected clockwise or counter clockwise.
% Xcenter ( double xcenter )
%         Sets the x-coordinate from the center point of the arc.
% Ycenter ( double ycenter )
%         Sets the y-coordinate from the center point of the arc.
% X1 ( double  xStartPoint )
%         Sets the x-coordinate from the start point of the arc.
% Y1 ( double  yStartPoint )
%         Sets the y-coordinate from the start point of the arc.
% X2 ( double  xEndPoint )
%         Sets the x-coordinate from the end point of the arc. The end point will be projected to the circle, because the radius is already defined by center point and start point. If UseAngle is true, this information is not used.
% Y2 ( double  yEndPoint )
%         Sets the y-coordinate from the end point of the arc. The end point will be projected to the circle, because the radius is already defined by center point and start point. If UseAngle is true, this information is not used.
% Angle ( double  angle )
%         Sets the interior angle of the arc. This is alternative information to the end point. See UseAngle.
% bUseAngle ( boolean useAngle )
%         If this boolean is true, the angle information is used and has to be specified instead of an end point. This Method might be omitted, as well as Angle; the end point is used as default.
% Segments ( int segments )
%         Sets the number of parts the arc should be segmented.
% EXAMPLE:
% status = f_CreateArc(oMWS,curveItemName,curveName,orientation,xCenter,yCenter,x1,y1,x2,y2,bUseAngle,angle,segment)
% status = f_CreateArc(oMWS,'arc2','curve1','Clockwise',-2,4.7,-0.2,7.3,-8.2,4,'True',3.2,0)
% status = f_CreateArc(oMWS,'arc1','curve1','Clockwise',-2,4.7,-0.2,7.3,-8.2,4,'False',[],0)


historyStr = [];
historyStr = sprintf('With Arc');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,curveItemName);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
historyStr = sprintf('%s\n\t.Orientation "%s"',historyStr,orientation);
historyStr = sprintf('%s\n\t.XCenter "%s"',historyStr,num2str(xCenter));
historyStr = sprintf('%s\n\t.YCenter "%s"',historyStr,num2str(yCenter));
historyStr = sprintf('%s\n\t.X1 "%s"',historyStr,num2str(x1));
historyStr = sprintf('%s\n\t.Y1 "%s"',historyStr,num2str(y1));
historyStr = sprintf('%s\n\t.X2 "%s"',historyStr,num2str(x2));
historyStr = sprintf('%s\n\t.Y2 "%s"',historyStr,num2str(y2));
historyStr = sprintf('%s\n\t.UseAngle "%s"',historyStr,bUseAngle);
if strcmp(lower(bUseAngle),'true')
    historyStr = sprintf('%s\n\t.Angle "%s"',historyStr,num2str(angle));
end
historyStr = sprintf('%s\n\t.Segments "%s"',historyStr,num2str(segment));
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve arc: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
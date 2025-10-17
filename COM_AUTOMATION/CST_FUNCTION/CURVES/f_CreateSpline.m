function status = f_CreateSpline(oMWS,curveItemName,curveName,point,pointList,bAbsolute)
% This function is used to create a new Spline curve item.
% curveItemName
%         Sets the name of the Spline
% curveName
%         Sets the name of the curve for the new Spline curve item. The curve must already exist.
% Point ( double xCoord, double yCoord )
%         Sets the coordinates for the first point of the Spline to be defined.
% pointList ( double xCoord, double yCoord )
%         A list of point to draw the Spline e.g. pointList = [0 3; -4 0;-3 -2; 0 -2; 3 0]
% bAbsolute
%         If it is true then draw the poing in absoulte coordinate otherwise in relative coordinate
% EXAMPLE:
% status = f_CreateSpline(oMWS,curveItemName,curveName,point,pointList,bAbsolute)
% point = [2 1];pointList = [0 3; -4 0; -3 -2; 0 -2; 3 0]
% status = f_CreateSpline(oMWS,'spline1','curve1',point,pointList,'True')
if iscell(point)
    xPoint = point{1};
    yPoint = point{2};
else
    xPoint = num2str(point(1));
    yPoint = num2str(point(2));
end
historyStr = [];
historyStr = sprintf('With Spline');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,curveItemName);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
historyStr = sprintf('%s\n\t.Point "%s","%s"',historyStr,xPoint,yPoint);
if strcmp(lower(bAbsolute),'true')
    for rowInd = 1:size(pointList,1)
        if iscell(pointList)
            historyStr = sprintf('%s\n\t.LineTo "%s", "%s"',historyStr,pointList{rowInd,1},pointList{rowInd,2});
        else
            historyStr = sprintf('%s\n\t.LineTo "%s", "%s"',historyStr,num2str(pointList(rowInd,1)),num2str(pointList(rowInd,2)));
        end
    end
else
    for rowInd = 1:size(pointList,1)
        historyStr = sprintf('%s\n\t.RLine "%s", "%s"',historyStr,num2str(pointList(rowInd,1)),num2str(pointList(rowInd,2)));
    end
end
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define curve spline: ' curveName ':' curveItemName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
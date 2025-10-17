function status = f_CreateBrick(oMWS,componentName,brickName,material,xRange,yRange,zRange)
% function status = f_CreateBrick(oMWS,componentName,brickName,material,xRange,yRange,zRange)
% brickName
%         Sets the name of the brick.
% componentName
%         Sets the name of the component for the new brick. The component must already exist.
% material
%         Sets the material name for the new brick. The material must already exist.
% Xrange ( double xmin, double xmax )
%         Sets the bounds for the x- or u-coordinate for the new brick, depending if a local coordinate system is active or not.
% Yrange ( double ymin, double ymax )
%         Sets the bounds for the y- or v-coordinate for the new brick, depending if a local coordinate system is active or not.
% Zrange ( double zmin, double zmax )
%         Sets the bounds for the z- or w-coordinate for the new brick, depending if a local coordinate system is active or not.
%
% EXAMPLE:
% status = f_CreateBrick(oMWS,componentName,brickName,material,xRange,yRange,zRange)
% status = f_CreateBrick(oMWS,'component1','brick1','Vacuum',[-2 2],[-1 1],[0 1])
% status = f_CreateBrick(oMWS,'component1','brick1','Vacuum',{'-xParam','xParam'},{'-yParam','yParam'},{'-zParam','zParam'})

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

if iscell(zRange(1))
    zRangeMin = num2str(cell2mat(zRange(1)));
    zRangeMax = num2str(cell2mat(zRange(2)));
else
    zRangeMin = num2str(zRange(1));
    zRangeMax = num2str(zRange(2));
end

historyStr = [];
historyStr = sprintf('With Brick');
historyStr = sprintf('%s\n.Reset',historyStr);
historyStr = sprintf('%s\n.Name "%s"',historyStr,brickName);
historyStr = sprintf('%s\n.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n.Xrange "%s", "%s"',historyStr,xRangeMin,xRangeMax);
historyStr = sprintf('%s\n.Yrange "%s", "%s"',historyStr,yRangeMin,yRangeMax);
historyStr = sprintf('%s\n.Zrange "%s", "%s"',historyStr,zRangeMin,zRangeMax);
historyStr = sprintf('%s\n.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define brick: ' componentName ':' brickName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
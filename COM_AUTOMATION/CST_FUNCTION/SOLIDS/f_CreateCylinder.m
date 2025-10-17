function status = f_CreateCylinder(oMWS,componentName,cylinderName,material,axis,outerRadius,innerRadius,xCenter,yCenter,zCenter,axisRange,segments)
% This function is used to create a new cylinder shape.
% cylinderName
%         Sets the name of the cylinder.
% componentName 
%         Sets the name of the component for the new cylinder. The component must already exist.
% material
%         Sets the material name for the new cylinder. The material must already exist.
% axis ( enum{"x", "y", "z"} direction )
%         Sets the axis of the cylinder. According to this setting, either Xrange, Yrange or Zrange need to be set for the extension of the cylinder along the axis.
% outerRadius ( double radius )
%         Sets the outer radius of the cylinder.
% innerRadius ( double radius )
%         Sets the inner radius of the cylinder. This setting may be set to zero to define a solid cylinder.
% xCenter ( double centercoordinate )
%         Sets the x- or u-coordinate of the center point of the bottom face of the cylinder, depending on whether a local coordinate system is active or not.
% yCenter ( double centercoordinate )
%         Sets the y- or v-coordinate of the center point of the bottom face of the cylinder, depending on whether a local coordinate system is active or not.
% zCenter ( double centercoordinate )
%         Sets the z- or w-coordinate of the center point of the bottom face of the cylinder, depending on whether a local coordinate system is active or not.
% Xrange ( double xmin, double xmax )
%         Sets the bounds for the x- or u-coordinate extensions of the new cylinder depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "x".
% Yrange ( double ymin, double ymax )
%         Sets the bounds for the y- or v-coordinate extensions of the new cylinder depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "y".
% Zrange ( double zmin, double zmax )
%         Sets the bounds for the z- or w-coordinate extensions of the new cylinder depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "z".
% Segments ( int number )
%         This setting specifies how the cylinder's geometry is modelled, either as a smooth surface of by a facetted approximation. If this value is set to "0", an analytical (smooth) representation of the cylinder will be created. If this number is set to another value greater than 2, the cylinder's face will be approximated by this number of planar facets. The higher the number of segments, the better the representation of the cylinder will be. 
% EXAMPLE:
% status = f_CreateCylinder(oMWS,componentName,cylinderName,material,axis,outerRadius,innerRadius,xCenter,yCenter,zCenter,axisRange,segments)
% status = f_CreateCylinder(oMWS,'component1','cylinder1','PEC','z',1.5,0.5,2,1,0,[0 3],0)
 
if iscell(axisRange(1))
    rangeMin = num2str(cell2mat(axisRange(1)));
    rangeMax = num2str(cell2mat(axisRange(2)));
else
    rangeMin = num2str(axisRange(1));
    rangeMax = num2str(axisRange(2));
end

historyStr = [];
historyStr = sprintf('With Cylinder');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,cylinderName);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Axis "%s"',historyStr,axis);
historyStr = sprintf('%s\n\t.Outerradius "%s"',historyStr,num2str(outerRadius));
historyStr = sprintf('%s\n\t.Innerradius "%s"',historyStr,num2str(innerRadius));
historyStr = sprintf('%s\n\t.Xcenter "%s"',historyStr,num2str(xCenter));
historyStr = sprintf('%s\n\t.Ycenter "%s"',historyStr,num2str(yCenter));
historyStr = sprintf('%s\n\t.Zcenter "%s"',historyStr,num2str(zCenter));
switch lower(axis)
    case 'x'
        historyStr = sprintf('%s\n\t.Xrange "%s", "%s"',historyStr,rangeMin,rangeMax);
    case 'y'
        historyStr = sprintf('%s\n\t.Yrange "%s", "%s"',historyStr,rangeMin,rangeMax);
    case 'z'
        historyStr = sprintf('%s\n\t.Zrange "%s", "%s"',historyStr,rangeMin,rangeMax);
    otherwise
        error('Define the Axis Cone i.e. X or Y or Z');
end
historyStr = sprintf('%s\n\t.Segments "%s"',historyStr,num2str(segments));
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define cylinder: ' componentName ':' cylinderName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
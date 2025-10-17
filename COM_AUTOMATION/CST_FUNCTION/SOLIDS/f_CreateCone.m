function status = f_CreateCone(oMWS,componentName,coneName,material,conAxis,topRadius,bottomRadius,xCenter,yCenter,zCenter,axisRange,segments)
% This function is used to create a new cone shape.
% coneName
% Sets the name of the cone.
% componentName
% Sets the name of the component for the new cone. The component must already exist.
% material ( name materialname )
% Sets the material name for the new cone. The material must already exist.
% conAxis ( enum{"x", "y", "z"} direction )
% Sets the axis of the cone. According to this setting, either Xrange, Yrange or Zrange need to be set for the extension of the cone along the axis.
% topRadius ( double radius )
% Sets the top radius of the cone. This setting may be set to zero to define a cone with an infinitely sharp cone end. Please note that the settings Topradius and Bottomradius must not both be set to zero.
% bottomRadius ( double radius )
% Sets the bottom radius of the cone. This setting may be set to zero to define a cone with an infinitely sharp cone end. Please note that the settings Topradius and Bottomradius must not both be set to zero.
% xCenter ( double centercoordinate )
% Sets the x- or u-coordinate of the center point of the bottom face of the cone, depending on whether a local coordinate system is active or not.
% yCenter ( double centercoordinate )
% Sets the y- or v-coordinate of the center point of the bottom face of the cone, depending on whether a local coordinate system is active or not.
% zCenter ( double centercoordinate )
% Sets the z- or w-coordinate of the center point of the bottom face of the cone, depending on whether a local coordinate system is active or not.
% Xrange ( double xmin, double xmax )
% Sets the bounds for the x- or u-coordinate extensions of the new cone depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "x".
% Yrange ( double ymin, double ymax )
% Sets the bounds for the y- or v-coordinate extensions of the new cone depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "y".
% Zrange ( double zmin, double zmax )
% Sets the bounds for the z- or w-coordinate extensions of the new cone depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "z".
% Segments ( int number )
% This setting specifies how the cone's geometry is modelled, either as a smooth surface of by a facetted approximation. If this value is set to "0", an analytical (smooth) representation of the cone will be created. If this number is set to another value greater than 2, the cone's face will be approximated by this number of planar facets. The higher the number of segments, the better the representation of the cone will be.
% EXAMPLE
% status = f_CreateCone(oMWS,componentName,coneName,material,conAxis,topRadius,bottomRadius,xCenter,yCenter,zCenter,axisRange,segments)
% status = f_CreateCone(oMWS,'component1','cone1','PEC','z',0.5,2.0,2,1,0,[0 3],0)

if iscell(axisRange(1))
    rangeMin = num2str(cell2mat(axisRange(1)));
    rangeMax = num2str(cell2mat(axisRange(2)));
else
    rangeMin = num2str(axisRange(1));
    rangeMax = num2str(axisRange(2));
end

historyStr = [];
historyStr = sprintf('With Cone');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,coneName);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Axis "%s"',historyStr,conAxis);
historyStr = sprintf('%s\n\t.Topradius "%s"',historyStr,num2str(topRadius));
historyStr = sprintf('%s\n\t.Bottomradius "%s"',historyStr,num2str(bottomRadius));
historyStr = sprintf('%s\n\t.Xcenter "%s"',historyStr,num2str(xCenter));
historyStr = sprintf('%s\n\t.Ycenter "%s"',historyStr,num2str(yCenter));
historyStr = sprintf('%s\n\t.Zcenter "%s"',historyStr,num2str(zCenter));
switch lower(conAxis)
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
historyHeader = [ 'define cone: ' componentName ':' coneName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
function status = f_CreateECylinder(oMWS,componentName,eCylinderName,material,axis,radii,xCenter,yCenter,zCenter,axisRange,segments)
% This function is used to create a new elliptical cylinder shape.
% eCylinderName
% Sets the name of the elliptical cylinder.
% componentName
% Sets the name of the component for the new elliptical cylinder. The component must already exist.
% material ( name materialname )
% Sets the material name for the new elliptical cylinder. The material must already exist.
% axis ( enum{"x", "y", "z"} direction )
% Sets the axis of the elliptical cylinder. According to this setting, either Xrange, Yrange or Zrange need to be set for the extension of the elliptical cylinder along the axis. Furthermore the radii for the two transversal directions need to be specified as Xradius, Yradius or Zradius. For example, an elliptical cylinder along the z-axis needs the specification of a Zrange and Xradius and Yradius.
% xRadius ( double radius )
% Sets the radius of the elliptical cylinder in the x- or u-direction, depending on whether a local coordinate system is active or not. This setting is only used if the axis of the elliptical cylinder has not been set to "x".
% yRadius ( double radius )
% Sets the radius of the elliptical cylinder in the y- or v-direction, depending on whether a local coordinate system is active or not. This setting is only used if the axis of the elliptical cylinder has not been set to "y".
% zRadius ( double radius )
% Sets the radius of the elliptical cylinder in the z- or w-direction, depending on whether a local coordinate system is active or not. This setting is only used if the axis of the elliptical cylinder has not been set to "z".
% xCenter ( double centercoordinate )
% Sets the x- or u-coordinate of the center point of the bottom face of the elliptical cylinder, depending on whether a local coordinate system is active or not.
% yCenter ( double centercoordinate )
% Sets the y- or v-coordinate of the center point of the bottom face of the elliptical cylinder, depending on whether a local coordinate system is active or not.
% zCenter ( double centercoordinate )
% Sets the z- or w-coordinate of the center point of the bottom face of the elliptical cylinder, depending on whether a local coordinate system is active or not.
% Xrange ( double xmin, double xmax )
% Sets the bounds for the x- or u-coordinate extensions of the new elliptical cylinder depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "x".
% Yrange ( double ymin, double ymax )
% Sets the bounds for the y- or v-coordinate extensions of the new elliptical cylinder depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "y".
% Zrange ( double zmin, double zmax )
% Sets the bounds for the z- or w-coordinate extensions of the new elliptical cylinder depending on whether a local coordinate system is active or not. This setting is only used if the axis is set to "z".
% Segments ( int number )
% This setting specifies how the elliptical cylinder's geometry is modelled, either as a smooth surface of by a facetted approximation. If this value is set to "0", an analytical (smooth) representation of the elliptical cylinder will be created. If this number is set to another value greater than 2, the elliptical cylinder's face will be approximated by this number of planar facets. The higher the number of segments, the better the representation of the elliptical cylinder will be.
% EXAMPLE:
% status = f_CreateECylinder(oMWS,componentName,cylinderName,material,axis,radii,xCenter,yCenter,zCenter,axisRange,segments)
% status = f_CreateECylinder(oMWS,'component1','ecylinder1','PEC','z',[1.5 0.5],2,1,0,[0 3],0)

if iscell(axisRange(1))
    rangeMin = num2str(cell2mat(axisRange(1)));
    rangeMax = num2str(cell2mat(axisRange(2)));
else
    rangeMin = num2str(axisRange(1));
    rangeMax = num2str(axisRange(2));
end

if iscell(radii(1))
    radii1 = num2str(cell2mat(radii(1)));
    radii2 = num2str(cell2mat(radii(2)));
else
    radii1 = num2str(radii(1));
    radii2 = num2str(radii(2));
end

historyStr = [];
historyStr = sprintf('With ECylinder');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,eCylinderName);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Axis "%s"',historyStr,axis);
switch lower(axis)
    case 'x'
        historyStr = sprintf('%s\n\t.Xrange "%s", "%s"',historyStr,rangeMin,rangeMax);
        historyStr = sprintf('%s\n\t.Yradius "%s"',historyStr,radii1);
        historyStr = sprintf('%s\n\t.Zradius "%s"',historyStr,radii2);
        historyStr = sprintf('%s\n\t.Ycenter "%s"',historyStr,num2str(yCenter));
        historyStr = sprintf('%s\n\t.Zcenter "%s"',historyStr,num2str(zCenter));
    case 'y'
        historyStr = sprintf('%s\n\t.Yrange "%s", "%s"',historyStr,rangeMin,rangeMax);
        historyStr = sprintf('%s\n\t.Zradius "%s"',historyStr,radii1);
        historyStr = sprintf('%s\n\t.Xradius "%s"',historyStr,radii2);
        historyStr = sprintf('%s\n\t.Xcenter "%s"',historyStr,num2str(xCenter));
        historyStr = sprintf('%s\n\t.Zcenter "%s"',historyStr,num2str(zCenter));
    case 'z'
        historyStr = sprintf('%s\n\t.Zrange "%s", "%s"',historyStr,rangeMin,rangeMax);
        historyStr = sprintf('%s\n\t.Yradius "%s"',historyStr,radii1);
        historyStr = sprintf('%s\n\t.Xradius "%s"',historyStr,radii2);
        historyStr = sprintf('%s\n\t.Xcenter "%s"',historyStr,num2str(xCenter));
        historyStr = sprintf('%s\n\t.Ycenter "%s"',historyStr,num2str(yCenter));
    otherwise
        error('Define the Axis Cone i.e. X or Y or Z');
end


historyStr = sprintf('%s\n\t.Segments "%s"',historyStr,num2str(segments));
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define ecylinder: ' componentName ':' eCylinderName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
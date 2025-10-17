function status = f_CreateSphere(oMWS,componentName,sphereName,material,axis,centerRadius,topRadius,bottomRadius,center,segments)
% This function is used to create a new sphere shape.
% sphereName
%         Sets the name of the sphere.
% componentName
%         Sets the name of the component for the new sphere. The component must already exist.
% material
%         Sets the material name for the new sphere. The material must already exist.
% axis ( enum{"x", "y", "z"} direction )
%         Sets the axis of the sphere.
% centerRadius ( double radius )
%         Sets the center radius of the sphere.
% topRadius ( double radius )
%         Sets the radius at the top of the sphere.
% bottomRadius ( double radius )
%         Sets the radius at the bottom of the sphere.
% center ( double xcenter, double ycenter, double zcenter )
%         Sets the (x, y, z) or (u, v, w) coordinates of the sphere's center point depending on whether a local coordinate system is active or not.
% Segments ( int number )
%         This setting specifies how the sphere's geometry is modelled, either as a smooth surface of by a facetted approximation. If this value is set to "0", an analytical (smooth) representation of the sphere will be created. If this number is set to another value greater than 2, the sphere's face will be approximated by this number of planar facets along each of the angular directions. The higher the number of segments, the better the representation of the sphere will be.
% EXAMPLE
% status = f_CreateSphere(oMWS,componentName,sphereName,material,axis,centerRadius,topRadius,bottomRadius,center,segments)
% status = f_CreateSphere(oMWS,'component1','sphere1','PEC','z',1,0,0,[2 1 3], 0)

historyStr = [];
historyStr = sprintf('With Sphere');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,sphereName);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Axis "%s"',historyStr,axis);
historyStr = sprintf('%s\n\t.CenterRadius "%s"',historyStr,num2str(centerRadius));
historyStr = sprintf('%s\n\t.Topradius "%s"',historyStr,num2str(topRadius));
historyStr = sprintf('%s\n\t.Bottomradius "%s"',historyStr,num2str(bottomRadius));
historyStr = sprintf('%s\n\t.Center "%s", "%s", "%s"',historyStr,num2str(center(1)),num2str(center(2)),num2str(center(3)));
historyStr = sprintf('%s\n\t.Segments "%s"',historyStr,num2str(segments));
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define sphere: ' componentName ':' sphereName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
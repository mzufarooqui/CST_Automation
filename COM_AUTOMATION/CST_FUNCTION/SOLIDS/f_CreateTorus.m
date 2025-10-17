function status = f_CreateTorus(oMWS,componentName,torusName,material,axis,outerRadius,innerRadius,xCenter,yCenter,zCenter,segments)
% This function is used to create a new torus shape.
% torusName
%         Sets the name of the torus.
% componentName
%     Sets the name of the component for the new torus. The component must already exist.
% material ( name materialname )
%         Sets the material name for the new torus. The material must already exist.
% axis ( enum{"x", "y", "z"} direction )
%         Sets the axis of the torus.
% outerRadius ( double radius )
%         Sets the large radius of the torus.
% innerRadius ( double radius )
%         Sets the small radius of the torus.
% xCenter ( double centercoordinate )
%         Sets the x- or u-coordinate of the center point of the torus depending on whether a local coordinate system is active or not.
% yCenter ( double centercoordinate )
%         Sets the y- or v-coordinate of the center point of the torus, depending on whether a local coordinate system is active or not.
% zCenter ( double centercoordinate )
%         Sets the z- or w-coordinate of the center point of the torus, depending on whether a local coordinate system is active or not.
% segments ( int number )
%         This setting specifies how the torus' geometry is modelled, either as a smooth surface of by a facetted approximation. If this value is set to "0", an analytical (smooth) representation of the torus will be created. If this number is set to another value greater than 2, the torus' face will be approximated by this number of planar facets along each angular direction. The higher the number of segments, the better the representation of the torus will be.
%
% EXAMPLE:
% status = f_CreateTorus(oMWS,componentName,torusName,material,axis,outerRadius,innerRadius,xCenter,yCenter,zCenter,segments)
% status = f_CreateTorus(oMWS,'component1','torus1','PEC','z',1.5,0.5,2,2,0,0)
% status = f_CreateTorus(oMWS,'component1','torus1','PEC','z','outerRadius','innerRadius','xCenter','yCenter','zCenter',0)

historyStr = [];
historyStr = sprintf('With Torus');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,torusName);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Axis "%s"',historyStr,axis);
historyStr = sprintf('%s\n\t.Outerradius "%s"',historyStr,num2str(outerRadius));
historyStr = sprintf('%s\n\t.Innerradius "%s"',historyStr,num2str(innerRadius));
historyStr = sprintf('%s\n\t.Xcenter "%s"',historyStr,num2str(xCenter));
historyStr = sprintf('%s\n\t.Ycenter "%s"',historyStr,num2str(yCenter));
historyStr = sprintf('%s\n\t.Zcenter "%s"',historyStr,num2str(zCenter));
historyStr = sprintf('%s\n\t.Segments "%s"',historyStr,num2str(segments));
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define torus: ' componentName ':' torusName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
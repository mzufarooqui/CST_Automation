function status = f_ExtrudeCurve(oMWS,componentName,solidName,curveName,curveItemName,material,thickness,twistangle,taperangle)
% This function enables an extrude operation on a curve item, which has to be closed and planar. The curve plane will be filled up as a solid with a specified thickness associated to a determined component and material. After that operation the curve item will not exist any longer. As soon as the new shape is created it will appear in the main plot window and on the navigation tree.
% solidName 
%         Sets the name of the new solid.
% componentName
%         Sets the name of the component for the new solid. The component must already exist.
% material ( name materialname )
%         Sets the material name for the new solid. The material must already exist.
% thickness ( double thicknessvalue )
%         Sets the thickness which the extrude operation will take place. Thus it determines the extension of the resulting solid shape. Negative thickness settings will result in an extrusion into the opposite direction.
% twistangle ( double twistvalue )
%         Sets the angle to twist the created shape around the direction of the extrusion.
% taperangle ( double tapervalue )
%         Sets the angle to taper the created shape along the direction of the extrusion. A negative angle will taper the shape, a positive angle will flare the shape.
% curveName
%         The name of the curve item the new solid should be created. The correct format for the name should be 'curvename:curveitemname' (see the example below). If the curve item (e.g. a line) is connected with an other curve item (e.g. a polygon) both curve items will be transformed into the new solid.
% EXAMPLE:
% status = f_CreateExtrudeCurve(oMWS,solidName,componentName,curveName,material,thickness,twistangle,taperangle)
% status = f_ExtrudeCurve(oMWS,'component1','solid2','curve1','circle1','Vacuum',2,0,0)


historyStr = [];
historyStr = sprintf('With ExtrudeCurve');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,solidName);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Thickness "%s"',historyStr,num2str(thickness));
historyStr = sprintf('%s\n\t.Twistangle "%s"',historyStr,num2str(twistangle));
historyStr = sprintf('%s\n\t.Taperangle "%s"',historyStr,num2str(taperangle));
historyStr = sprintf('%s\n\t.Curve "%s:%s"',historyStr,curveName,curveItemName);
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define extrudeprofile: ' componentName ':' solidName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
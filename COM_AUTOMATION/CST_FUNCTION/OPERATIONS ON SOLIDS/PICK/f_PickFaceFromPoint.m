function status = f_PickFaceFromPoint(oMWS,componentName,solidName,xPoint,yPoint,zPoint)
% Pick’s a face - using a point on the face - whereby the point is always
% defined in global coordinates. The method so represents the ”Absolute Pick Positioning” mode from the ”Objects” menu.
historyStr = sprintf('Pick.PickFaceFromPoint "%s:%s", "%s", "%s", "%s"',componentName,solidName,num2str(xPoint),num2str(yPoint),num2str(zPoint));
historyHeader = [ 'pick face' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
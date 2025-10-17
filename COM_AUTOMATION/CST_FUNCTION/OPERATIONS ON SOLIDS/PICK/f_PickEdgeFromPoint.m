function status = f_PickEdgeFromPoint(oMWS,componentName,solidName,xPoint,yPoint,zPoint)
% Pick’s an edge of a solid - using a point on the edge - whereby the point is always defined in global coordinates. The method so represents the ”Absolute Pick Positioning” mode from the ”Objects” menu. 
historyStr = sprintf('Pick.PickEdgeFromPoint "%s:%s", "%s", "%s", "%s"',componentName,solidName,num2str(xPoint),num2str(yPoint),num2str(zPoint));
historyHeader = [ 'pick edge' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
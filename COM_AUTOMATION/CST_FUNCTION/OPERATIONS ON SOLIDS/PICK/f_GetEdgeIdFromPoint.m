function edgeIdFromPoint = f_GetEdgeIdFromPoint(oMWS,componentName,solidName,x,y,z)
% Returns the edge id at a given point for one shape.
historyStr = sprintf('GetEdgeIdFromPoint "%s:%s", "%s,%s,%s"',componentName,solidName,num2str(x),num2str(y),num2str(z));
historyHeader = [ '--' ];
edgeIdFromPoint = oMWS.invoke('AddToHistory',historyHeader,historyStr); 
end
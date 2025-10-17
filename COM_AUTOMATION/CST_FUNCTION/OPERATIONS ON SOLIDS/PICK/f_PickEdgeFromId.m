function status = f_PickEdgeFromId(oMWS,componentName,solidName,edgeID,vertexID)
% Picks an edge of a solid. The edge is specified by the solid that it belongs to and an identity number. 'vertex_id' is the index of the start point of this edge.
historyStr = sprintf('Pick.PickEdgeFromId "%s:%s", "%s", "%s"',componentName,solidName,num2str(edgeID),num2str(vertexID));
historyHeader = [ 'pick edge' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
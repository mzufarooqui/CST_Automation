function status = f_PickSolidEdgeChainFromId(oMWS,componentName,solidName,edgeID,faceID)
% Picks an edge chain (a set of connected edges) of a solid. The edge chain is specified by the solid that it belongs to and two identity numbers.
% EXAMPLE
% status = f_PickSolidEdgeChainFromId(oMWS,componentName,solidName,edgeID,faceID)
% status = f_PickSolidEdgeChainFromId(oMWS,componentName,solidName,1,1)
historyStr = sprintf('Pick.PickSolidEdgeChainFromId "%s:%s", "%s", "%s"',componentName,solidName,num2str(edgeID),num2str(faceID));
historyHeader = [ 'pick solid edge chain' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
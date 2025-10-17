function status = f_BlendEdge(oMWS,componentName,solidName,radius)
% BlendEdge ( double rad )
% This method changes the transition between two faces. If two faces join each other at a straight edge this edge can be picked and replaced by a cylindrical shape of radius rad. This shape is inserted into the structure such that a smooth transition between the two original faces arises.
% If radius is chosen in a way that the structure would change significantly, the operation might not be possible.
% If no edge is picked this method performs no action.
% 
% EXAMPLE:
% First pick and edge with following function
% f_PickEdgeFromId(oMWS,componentName,solidName,edgeID,vertexID)
% f_PickEdgeFromId(oMWS,'component1','component1',11,13)
% and then blend the edge
% status = f_BlendEdge(oMWS,componentName,solidName,radius)
% status = f_BlendEdge(oMWS,'component1','solid1',1)

historyStr = sprintf('Solid.BlendEdge "%s" ',num2str(radius));
historyHeader = [ 'blend edges of: ' componentName ':' solidName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end




function pickedEdgeFromIndex = f_GetPickedEdgeFromIndex(oMWS,index,edgeid,vertexid)
% Returns the shapename of a picked edge. The edge id  and the vertex id is returned through the argument list. The picked edge is specified by index starting with 1.
oPick = oMWS.invoke('Pick');
pickedEdgeFromIndex = oPick.invoke('GetPickedEdgeFromIndex',index,edgeid,vertexid);
end
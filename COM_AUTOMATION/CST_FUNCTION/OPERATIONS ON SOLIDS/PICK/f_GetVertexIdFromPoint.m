function vertexIdFromPoint = f_GetVertexIdFromPoint(oMWS,componentName,solidName,x,y,z)
% Returns the edge id at a given point for one shape.
oPick = oMWS.invoke('Pick');
vertexIdFromPoint = oPick.invoke('GetVertexIdFromPoint',[componentName ':' solidName],x,y,z);
end
function f_UpdateMesh(oMWS)
% Updates the mesh causing a recalculation of the mesh line distribution.
oMesh = invoke(oMWS,'Mesh');
oMesh.invoke('Update');
end
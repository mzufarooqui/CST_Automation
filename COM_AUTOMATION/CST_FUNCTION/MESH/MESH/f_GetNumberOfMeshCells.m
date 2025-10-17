function numMeshCells = f_GetNumberOfMeshCells(oMWS)
% Returns the total number of mesh cells (may be either hexahedral elements or tetrahedrons).
oMesh = invoke(oMWS,'Mesh');
numMeshCells = invoke(oMesh,'GetNumberOfMeshCells');
end
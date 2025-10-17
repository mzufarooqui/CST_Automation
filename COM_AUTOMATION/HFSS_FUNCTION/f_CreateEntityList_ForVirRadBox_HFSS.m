function f_CreateEntityList_ForVirRadBox_HFSS(oProject,boxName,listName,xStart,yStart,zStart,xSize,ySize,zSize)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
faceList = {
    ['(' xSize ')/2'],'0mm','0mm'
    ['-(' xSize ')/2'],'0mm','0mm'
    '0mm',['(' ySize ')/2'],'0mm'
    '0mm',['-(' ySize ')/2'],'0mm'
    '0mm','0mm',['(' zStart ')+' '(' zSize ')']
    '0mm','0mm',['(' zStart ')']};
for ind = 1:size(faceList,1)
    faceID{1,ind} = oEditor.GetFaceByPosition({'NAME:Parameters','BodyName:=' boxName, 'XPosition:=', faceList{ind,1}, 'YPosition:=', faceList{ind,2}, 'ZPosition:=', faceList{ind,3}});
end
invoke(oEditor,'CreateEntityList', {'NAME:GeometryEntityListParameters', 'EntityType:=','Face', 'EntityList:=', faceID}, {'NAME:Attributes', 'Name:=',listName});
end
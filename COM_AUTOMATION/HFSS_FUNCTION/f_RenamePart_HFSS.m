function f_RenamePart_HFSS(oProject,oldName,newName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.RenamePart({'NAME:Rename Data','Old Name:=',oldName,'New Name:=',newName})
end
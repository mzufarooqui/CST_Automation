function f_RenameSolid_HFSS(oProject,oldName,newName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'ChangeProperty', {'NAME:AllTabs', {'NAME:Geometry3DAttributeTab', {'NAME:PropServers',oldName}, {'NAME:ChangedProps', {'NAME:Name', 'Value:=', newName}}}});
end
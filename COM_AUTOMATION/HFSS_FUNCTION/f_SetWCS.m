function f_SetWCS(oProject,coordSysName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'SetWCS',{'NAME:SetWCS Parameter', 'Working Coordinate System:=', coordSysName});
end
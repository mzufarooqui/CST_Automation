function f_CopySolid_HFSS(oProject,solidName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'Copy', {'NAME:Selections', 'Selections:=', solidName});
end


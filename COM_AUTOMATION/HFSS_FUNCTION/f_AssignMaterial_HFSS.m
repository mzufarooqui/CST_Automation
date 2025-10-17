function f_AssignMaterial_HFSS(oProject,activeDsg,name,material)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.AssignMaterial({'NAME:Selections','Selections:=',name},{'NAME:Attributes','MaterialName:=',material,'SolveInside:=', true});
end
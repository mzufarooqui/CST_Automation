function f_DeletePart_HFSS(oProject,partName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.Delete({'NAME:Selections', 'Selections:=', partName});
end
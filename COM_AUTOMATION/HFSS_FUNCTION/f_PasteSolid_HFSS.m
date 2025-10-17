function f_PasteSolid_HFSS(oProject)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'Paste');
end
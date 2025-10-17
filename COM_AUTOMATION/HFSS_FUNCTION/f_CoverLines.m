function f_CoverLines(oProject,activeDsg,selName)
oDesign       = oProject.SetActiveDesign(activeDsg);
oEditor       = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'CoverLines',{'NAME:Selections', 'Selections:=', selName, 'NewPartsModelFlag:=','Model'});
end
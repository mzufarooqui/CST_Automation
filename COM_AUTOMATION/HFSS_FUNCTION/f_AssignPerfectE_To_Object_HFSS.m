function f_AssignPerfectE_To_Object_HFSS(oProject,activeDsg,bndName,objNameList)
oDesign       = oProject.SetActiveDesign(activeDsg);
oEditor       = oDesign.SetActiveEditor('3D Modeler');
oModule = oDesign.GetModule("BoundarySetup");
oModule.AssignPerfectE({['NAME:' bndName],'Objects:=',objNameList});
end
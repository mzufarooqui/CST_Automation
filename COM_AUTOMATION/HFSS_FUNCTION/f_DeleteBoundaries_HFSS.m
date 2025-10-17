function f_DeleteBoundaries_HFSS(oProject,name)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
oModule.DeleteBoundaries({name})
end
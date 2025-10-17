function f_AssignPerfectE_Sheet_HFSS(oProject,sheetName,boundaryName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
oModule.AssignPerfectE( {['NAME:' boundaryName], 'Objects:=', {sheetName}, 'InfGroundPlane:=',false})
end
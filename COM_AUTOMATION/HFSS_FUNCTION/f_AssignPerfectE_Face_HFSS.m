function f_AssignPerfectE_Face_HFSS(oProject,faceNum,boundaryName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
oModule.AssignPerfectE({['NAME:' boundaryName], 'Faces:=', {faceNum}, 'InfGroundPlane:=',false});
end
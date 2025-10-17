function f_AssignPerfectE_HFSS(oProject,faceNum)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
faceNumStr      = sprintf('%d,',faceNum);
faceNumStr(end) = [];
oModule.AssignPerfectE({'NAME:PerfE1', 'Faces:=', eval(['{' (faceNumStr) '}']), 'InfGroundPlane:=',false})
end
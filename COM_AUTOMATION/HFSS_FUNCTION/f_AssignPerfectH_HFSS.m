function f_AssignPerfectH_HFSS(oProject,faceNum)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
faceNumStr      = sprintf('%d,',faceNum);
faceNumStr(end) = [];
oModule.AssignPerfectH({'NAME:PerfH1', 'Faces:=', eval(['{' (faceNumStr) '}']), 'InfGroundPlane:=',false})
end
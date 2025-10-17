function f_AssignSymmetryPerfectE_HFSS(oProject,symName,faceNum)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
faceNumStr      = sprintf('%d,',faceNum);
faceNumStr(end) = [];
oModule.AssignSymmetry({['NAME:' symName ], 'Faces:=', eval(['{' (faceNumStr) '}']), 'IsPerfectE:=',true})
end
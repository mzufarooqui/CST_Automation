function f_AssignRadiation_OnFace_HFSS(oProject,faceNum,boundName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
invoke(oModule,'AssignRadiation',{['NAME:' boundName], 'Faces:=', {faceNum}, 'IsIncidentField:=',false, 'IsEnforcedField:=', false, 'IsFssReference:=', false, 'IsForPML:=',false, 'UseAdaptiveIE:=', false, 'IncludeInPostproc:=', true});
end  
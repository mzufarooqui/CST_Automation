function f_AssignRadiation(oProject,oName,radName)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
invoke(oModule,'AssignRadiation',{['NAME:' radName], 'Objects:=', {oName}, 'IsIncidentField:=',false, 'IsEnforcedField:=', false, 'IsFssReference:=', false, 'IsForPML:=',  ...
    false, 'UseAdaptiveIE:=', false, 'IncludeInPostproc:=', true});
end
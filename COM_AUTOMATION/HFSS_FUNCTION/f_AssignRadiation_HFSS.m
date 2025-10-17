function f_AssignRadiation_HFSS(oProject,boxName,boundName)
% oDesign = oProject.SetActiveDesign('HFSSDesign1');
% oModule = oDesign.GetModule('BoundarySetup');
% oModule.AssignRadiation({'NAME:' boundName,'Objects:=',{boxName},'IsIncidentField:=',false,'IsEnforcedField:=',false,'IsFssReference:=',false,'IsForPML:=', false,'UseAdaptiveIE:=',false,'IncludeInPostproc:=',true});
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('BoundarySetup');
invoke(oModule,'AssignRadiation',{['NAME:' boundName ],'Objects:=', {boxName}, 'IsIncidentField:=',false, 'IsEnforcedField:=', false, 'IsFssReference:=', false, 'IsForPML:=',  false, 'UseAdaptiveIE:=', false, 'IncludeInPostproc:=', true});
end




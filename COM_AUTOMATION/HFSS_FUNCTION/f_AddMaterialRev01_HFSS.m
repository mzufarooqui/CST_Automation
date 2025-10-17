function f_AddMaterialRev01_HFSS(oProject,matName,epsR,tandDelta)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
oDefinitionManager = oProject.GetDefinitionManager();
if ~(oDefinitionManager.DoesMaterialExist(matName))
    oDefinitionManager.AddMaterial({['NAME:' matName], 'CoordinateSystemType:=','Cartesian', {'NAME:AttachedData'}, {'NAME:ModifierData'}, 'permittivity:=', num2str(epsR), 'dielectric_loss_tangent:=', num2str(tandDelta)});
end
end
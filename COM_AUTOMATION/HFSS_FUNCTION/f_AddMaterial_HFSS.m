function f_AddMaterial_HFSS(oProject,name,conductivity)
oDefinitionManager = oProject.GetDefinitionManager();
oDefinitionManager.AddMaterial({['NAME:' name ], 'CoordinateSystemType:=', ...
  'Cartesian', {'NAME:AttachedData'}, {'NAME:ModifierData'}, 'conductivity:=',num2str(conductivity)});
end



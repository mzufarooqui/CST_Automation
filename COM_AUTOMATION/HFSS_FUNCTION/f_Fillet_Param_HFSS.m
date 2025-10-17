function f_Fillet_Param_HFSS(oProject,partName,vertNum,radIn_mm,setBackIn_mm)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.Fillet({'NAME:Selections', 'Selections:=', partName, 'NewPartsModelFlag:=','Model'}, {'NAME:Parameters', {'NAME:FilletParameters', 'Edges:=', {}, 'Vertices:=', {vertNum}, 'Radius:=', radIn_mm, 'Setback:=', setBackIn_mm}})      
end
function f_Chamfer_Param_HFSS(oProject,partName,vertNum,leftDistIn_mm)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
for ind = 1:numel(vertNum)
    oEditor.Chamfer({'NAME:Selections', 'Selections:=', partName, 'NewPartsModelFlag:=','Model'}, {'NAME:Parameters', {'NAME:ChamferParameters', 'Edges:=', {}, 'Vertices:=', {vertNum(ind)}, 'LeftDistance:=', leftDistIn_mm, 'RightDistance:=', leftDistIn_mm, 'ChamferType:=','Symmetric'}})
end
end
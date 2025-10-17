function f_BlendEdge_HFSS(oProject,name,vertList,blendRad,setBackDist)

oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');

vertListStr      = sprintf('%d,',vertList);
vertListStr(end) = [];
oEditor.Fillet({'NAME:Selections', 'Selections:=', name, 'NewPartsModelFlag:=','Model'},{'NAME:Parameters',{'NAME:FilletParameters', 'Edges:=', eval(['{' vertListStr '}']), 'Vertices:=', { }, 'Radius:=',[ num2str(blendRad) 'mm' ], 'Setback:=', [ num2str(setBackDist) 'mm' ] }});
end

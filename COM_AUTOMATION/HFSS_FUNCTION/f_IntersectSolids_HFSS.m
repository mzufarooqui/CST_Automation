function f_IntersectSolids_HFSS(oProject,name1,name2)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'Intersect', {'NAME:Selections', 'Selections:=', [ name1 ',' name2 ]}, {'NAME:IntersectParameters', 'KeepOriginals:=','false'});
end
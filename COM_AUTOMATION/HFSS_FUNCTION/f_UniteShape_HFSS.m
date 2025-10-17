function f_UniteShape_HFSS(oProject,activeDsg,uniteList)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
uniteListStr = [];
for ind = 1:size(uniteList,2)
    uniteListStr = sprintf('%s,%s',uniteListStr,uniteList{ind});
end
uniteListStr(1) = [];
invoke(oEditor,'Unite',{'NAME:Selections', 'Selections:=',uniteListStr}, ...
    {'NAME:UniteParameters', 'KeepOriginals:=','false'})
end
function f_RotateShape_HFSS(oProject,name,angleDeg)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'Rotate',{'NAME:Selections', 'Selections:=', name, 'NewPartsModelFlag:=','Model'}, ...
    {'NAME:RotateParameters', 'RotateAxis:=', 'Z', 'RotateAngle:=',[ num2str(angleDeg) 'deg' ]});
end
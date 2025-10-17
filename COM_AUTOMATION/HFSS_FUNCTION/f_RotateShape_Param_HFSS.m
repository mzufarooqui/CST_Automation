function f_RotateShape_Param_HFSS(oProject,activeDsg,name,angleDeg,rotAxis)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.Rotate({'NAME:Selections','Selections:=',name,'NewPartsModelFlag:=','Model'}, ...
    {'NAME:RotateParameters','RotateAxis:=',rotAxis,'RotateAngle:=',[ num2str(angleDeg) 'deg']})
end



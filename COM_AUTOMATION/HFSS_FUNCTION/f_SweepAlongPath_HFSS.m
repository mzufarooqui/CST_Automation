function f_SweepAlongPath_HFSS(oProject,activeDsg,objName,pathName)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.SweepAlongPath({'NAME:Selections','Selections:=',[ objName ',' pathName ],'NewPartsModelFlag:=','Model'},{'NAME:PathSweepParameters','DraftAngle:=','0deg','DraftType:=','Round','CheckFaceFaceIntersection:=','False','TwistAngle:=','0deg'})
end
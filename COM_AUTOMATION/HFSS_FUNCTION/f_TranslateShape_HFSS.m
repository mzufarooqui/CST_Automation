function f_TranslateShape_HFSS(oProject,activeDsg,name,xDir,yDir,zDir)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'Move', {'NAME:Selections', 'Selections:=', name, 'NewPartsModelFlag:=','Model'},{'NAME:TranslateParameters','TranslateVectorX:=', [ num2str(xDir) 'mm'], 'TranslateVectorY:=',[ num2str(yDir) 'mm'], 'TranslateVectorZ:=', [ num2str(zDir) 'mm']})
end
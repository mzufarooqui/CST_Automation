function f_ImportModel_HFSS(oProject,fileNameWithPath)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
oEditor.Import({'NAME:Unnamed_1','CoordinateSystemID:=',-1,'HealOption:=',0,'CheckModel:=','True','Options:=','','FileType:=','UnRecognized','MaxStitchTol:=',0.001,'SourceFile:=',fileNameWithPath});
end
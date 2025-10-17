function f_ThickenSheet_HFSS(oProject,activeDsg,name,thickness,bothSides)
oDesign       = oProject.SetActiveDesign(activeDsg);
oEditor       = oDesign.SetActiveEditor('3D Modeler');
oEditor.ThickenSheet({'NAME:Selections','Selections:=',name,'NewPartsModelFlag:=','Model'}, ... 
	{'NAME:SheetThickenParameters','Thickness:=',[ num2str(thickness) 'mm'],'BothSides:=',bothSides});
end
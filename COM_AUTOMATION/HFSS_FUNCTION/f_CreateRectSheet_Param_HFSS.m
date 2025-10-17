function f_CreateRectSheet_Param_HFSS(oProject,name,xStart,yStart,zStart,width,height,axisDir)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'CreateRectangle',{'NAME:RectangleParameters', 'IsCovered:=', true, 'XStart:=',xStart, 'YStart:=', yStart, 'ZStart:=', zStart, 'Width:=', width, 'Height:=',height, 'WhichAxis:=', axisDir } , ...
    {'NAME:Attributes', 'Name:=', name, 'Flags:=','', 'Color:=', '(132 132 193)', 'Transparency:=', 0, 'PartCoordinateSystem:=','Global', 'UDMId:=', '', 'MaterialValue:=',['' char(34) 'vacuum' char(34) ''], 'SolveInside:=',true});
end
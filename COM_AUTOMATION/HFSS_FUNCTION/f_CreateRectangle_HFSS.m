function f_CreateRectangle_HFSS(oProject,rectName,xStart,yStart,zStart,width,height,axis,partCoodSys,materialValue)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
% invoke(oEditor,'CreateBox', {'NAME:BoxParameters', ...
%     'XPosition:=', [ num2str(xPos) 'mm' ], 'YPosition:=',[ num2str(yPos) 'mm' ], 'ZPosition:=', [ num2str(zPos) 'mm' ], ...
%     'XSize:=', [ num2str(xSize) 'mm' ], 'YSize:=', [ num2str(ySize) 'mm' ], 'ZSize:=',[ num2str(zSize) 'mm' ]}, ...
%     {'NAME:Attributes', 'Name:=', name, 'Flags:=', '', 'Color:=','(132 132 193)', 'Transparency:=',0, ...
%     'PartCoordinateSystem:=','Global', 'UDMId:=','', 'MaterialValue:=', ['' char(34) materialValue char(34) ''], 'SolveInside:=','True'});

invoke(oEditor,'CreateRectangle', {'NAME:RectangleParameters', 'IsCovered:=', 'True', 'XStart:=',[ num2str(xStart) 'mm' ], 'YStart:=', [ num2str(yStart) 'mm' ], 'ZStart:=', [ num2str(zStart) 'mm' ], ...
   'Width:=', [ num2str(width) 'mm' ], 'Height:=',[ num2str(height) 'mm' ], 'WhichAxis:=', axis}, {'NAME:Attributes', 'Name:=', rectName, 'Flags:=',  ...
'', 'Color:=', '(132 132 193)', 'Transparency:=', 0, 'PartCoordinateSystem:=',  ...
partCoodSys, 'UDMId:=', '', 'MaterialValue:=', ['' char(34) materialValue char(34) ''], 'SolveInside:=','True'})

end







% oEditor.CreateRectangle Array("NAME:RectangleParameters", "IsCovered:=", true, "XStart:=",  _
% "0mm", "YStart:=", "0mm", "ZStart:=", "0mm", "Width:=", "1.3mm", "Height:=",  _
% "0.4mm", "WhichAxis:=", "Z"), Array("NAME:Attributes", "Name:=", "Rectangle1", "Flags:=",  _
% "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
% "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
% true)
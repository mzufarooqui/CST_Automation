function f_CreateRelativeCS_Param_HFSS(oProject,csName,xOrig,yOrig,zOrig)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'CreateRelativeCS',{'NAME:RelativeCSParameters', 'OriginX:=', xOrig, 'OriginY:=',yOrig, 'OriginZ:=', zOrig, ...
    'XAxisXvec:=', '1mm', 'XAxisYvec:=','0mm', 'XAxisZvec:=', '0mm', 'YAxisXvec:=', '0mm', 'YAxisYvec:=', '1mm', 'YAxisZvec:=','0mm'}, ...
    {'NAME:Attributes', 'Name:=', csName});
end






%
%   function f_CreateRectangle_Param_HFSS(oProject,rectName,xStart,yStart,zStart,width,height,axis,partCoodSys,materialValue)
% oDesign = oProject.SetActiveDesign('HFSSDesign1');
% oEditor = oDesign.SetActiveEditor('3D Modeler');
% invoke(oEditor,'CreateRectangle', {'NAME:RectangleParameters', 'IsCovered:=', 'True', 'XStart:=',xStart, 'YStart:=', yStart, 'ZStart:=', zStart, ...
%    'Width:=', width, 'Height:=',height, 'WhichAxis:=', axis}, {'NAME:Attributes', 'Name:=', rectName, 'Flags:=',  ...
% '', 'Color:=', '(132 132 193)', 'Transparency:=', 0, 'PartCoordinateSystem:=',  ...
% partCoodSys, 'UDMId:=', '', 'MaterialValue:=', ['' char(34) materialValue char(34) ''], 'SolveInside:=','True'});
% end
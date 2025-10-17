function f_CreateCircleParam_HFSS(oProject,activeDsg,itemName,coord,radius,materialValue,axis,bCoverLine)
oDesign = oProject.SetActiveDesign(activeDsg);
oEditor = oDesign.SetActiveEditor('3D Modeler');
% oEditor.CreateCircle Array("NAME:CircleParameters", "IsCovered:=", true, "XCenter:=",  _
%   "-280mm", "YCenter:=", "-120mm", "ZCenter:=", "0mm", "Radius:=",  _
%   "223.606797749979mm", "WhichAxis:=", "Z", "NumSegments:=", "0"), Array("NAME:Attributes", "Name:=",  _
%   "Circle1", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
%   "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
%   true)
invoke(oEditor,'CreateCircle',{'NAME:CircleParameters', 'IsCovered:=', bCoverLine, ...
    'XCenter:=', coord{1}, 'YCenter:=', coord{2}, 'ZCenter:=', coord{3}, 'Radius:=',radius, 'WhichAxis:=', axis, 'NumSegments:=', '0'}, ...
    {'NAME:Attributes', 'Name:=',itemName, 'Flags:=', '', 'Color:=', '(132 132 193)', 'Transparency:=', 0, 'PartCoordinateSystem:=', ...
    'Global', 'UDMId:=', '', 'MaterialValue:=', ['' char(34) materialValue char(34) ''], 'SolveInside:=','True'});
end
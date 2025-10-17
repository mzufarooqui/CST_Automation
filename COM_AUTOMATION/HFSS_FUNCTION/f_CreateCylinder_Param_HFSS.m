function f_CreateCylinder_Param_HFSS(oProject,name,xCenter,yCenter,zCenter,radius,height,axisDir,materialValue)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
invoke(oEditor,'CreateCylinder',{'NAME:CylinderParameters', 'XCenter:=', xCenter, 'YCenter:=',yCenter, 'ZCenter:=', zCenter, 'Radius:=', radius, 'Height:=',height, 'WhichAxis:=', axisDir, 'NumSides:=', '0'}, ...
    {'NAME:Attributes', 'Name:=',name, 'Flags:=', '', 'Color:=', '(132 132 193)', 'Transparency:=', 0, 'PartCoordinateSystem:=','Global', 'UDMId:=', '', 'MaterialValue:=', ['' char(34) materialValue char(34) ''], 'SolveInside:=',true})
end



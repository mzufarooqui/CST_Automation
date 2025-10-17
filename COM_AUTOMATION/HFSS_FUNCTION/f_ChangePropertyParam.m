function f_ChangePropertyParam(oProject,objName,varName,varValue)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
% invoke(oEditor,'ChangeProperty',{'NAME:AllTabs', {'NAME:LocalVariableTab', {'NAME:PropServers','LocalVariables'}, {'NAME:ChangedProps', {['NAME:' varName ], 'Value:=', varValue}}}})
% invoke(oEditor,'ChangeProperty',{'NAME:AllTabs', {'NAME:Geometry3DAttributeTab', {'NAME:PropServers',objName}, {'NAME:ChangedProps', {'NAME:' varName, 'Value:=', varValue}}}})

%invoke(oEditor,'ChangeProperty', {'NAME:AllTabs', {'NAME:Geometry3DAttributeTab', {'NAME:PropServers','coaxPin'}, {'NAME:ChangedProps', {'NAME:Material', 'Value:=', ['' char(34) 'pec' char(34) '']}}}})
invoke(oEditor,'ChangeProperty', {'NAME:AllTabs', {'NAME:Geometry3DAttributeTab', {'NAME:PropServers',objName}, {'NAME:ChangedProps', {['NAME:' varName], 'Value:=', varValue}}}})
% invoke(oEditor,'ChangeProperty', {'NAME:AllTabs', {'NAME:Geometry3DAttributeTab', {'NAME:PropServers','PML_AirBox_7'}, {'NAME:ChangedProps', {'NAME:Orientation', 'Value:=', 'FaceCS9'}}}})
end
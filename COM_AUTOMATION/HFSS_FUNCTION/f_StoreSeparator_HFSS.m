function f_StoreSeparator_HFSS(oProject,name)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
invoke(oDesign,'ChangeProperty',{'NAME:AllTabs', {'NAME:LocalVariableTab', {'NAME:PropServers','LocalVariables'}, {'NAME:NewProps', {['NAME:--' name], 'PropType:=','SeparatorProp', 'UserDef:=', true, 'Value:=', ''}}}});
end
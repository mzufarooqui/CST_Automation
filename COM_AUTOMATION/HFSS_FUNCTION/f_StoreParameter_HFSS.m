function f_StoreParameter_HFSS(oProject,name,value,unit)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
invoke(oDesign,'ChangeProperty', {'NAME:AllTabs', {'NAME:LocalVariableTab', {'NAME:PropServers','LocalVariables'}, {'NAME:NewProps', {['NAME:' name],       'PropType:=', 'VariableProp', 'UserDef:=',true, 'Value:=', [ num2str(value) unit]}}}});
end

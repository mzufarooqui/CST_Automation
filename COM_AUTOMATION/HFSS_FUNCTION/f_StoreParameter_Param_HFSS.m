function f_StoreParameter_Param_HFSS(oProject,name,value)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
invoke(oDesign,'ChangeProperty', {'NAME:AllTabs', {'NAME:LocalVariableTab', {'NAME:PropServers','LocalVariables'}, {'NAME:NewProps', {['NAME:' name],'PropType:=', 'VariableProp', 'UserDef:=',true, 'Value:=', value}}}});
end

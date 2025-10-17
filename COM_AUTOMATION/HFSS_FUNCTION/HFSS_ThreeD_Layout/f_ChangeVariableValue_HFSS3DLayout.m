function f_ChangeVariableValue_HFSS3DLayout(oDesign,projName,varName,varVal)
    oDesign.ChangeProperty({'NAME:AllTabs',{'NAME:LocalVariableTab',{'NAME:PropServers',['Instance:0;' projName]	},{'NAME:ChangedProps',{['NAME:' varName],'Value:=', varVal}}}})
end
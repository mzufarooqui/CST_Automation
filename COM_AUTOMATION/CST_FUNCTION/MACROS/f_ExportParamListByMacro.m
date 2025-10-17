function f_ExportParamListByMacro(oMWS,macroName)
macroFullName = which(macroName);
f_RunMacro(oMWS,macroFullName)
end
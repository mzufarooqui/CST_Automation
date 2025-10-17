function f_ImportParamListByMacro(oMWS,macroName)
macroFullName = which(macroName);
f_RunMacro(oMWS,macroFullName)
end
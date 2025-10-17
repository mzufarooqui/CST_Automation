function f_ASCIIExportSummary(oMWS,fileName)
% This method offers ASCII file export of the summarized settings concerning the
% farfield plot (array pattern, monitor name, component, plot type, step angle, frequency)
% as well as the most important farfield values characterizing the current
% calculation (radiation efficiency, total efficiency, maximum directivity, maximum gain).
% The summary is saved to a file named fileName.
oFarfieldPlot = invoke(oMWS,'FarfieldPlot');
invoke(oFarfieldPlot,'ASCIIExportSummary',fileName);
end
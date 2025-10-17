function f_ASCIIExportAsSource(oMWS,sourceFileName)
% This method creates a farfield source from the selected farfield plot (2D/3D plot type only).
% The data are saved to a file named fileName.
% This file can be used for defining a farfield excitation.
oFarfieldPlot = invoke(oMWS,'FarfieldPlot');
invoke(oFarfieldPlot,'ASCIIExportAsSource',sourceFileName);
end
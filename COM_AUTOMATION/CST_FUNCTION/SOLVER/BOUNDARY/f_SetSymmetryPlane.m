function status = f_SetSymmetryPlane(oMWS,xSymmetryType,ySymmetryType,zSymmetryType)
% xSymmetryType, ySymmetryType and zSymmetryType can have one of the following values:
% 'electric' : All tangential E-fields are considered zero at the symmetry plane.
% 'magnetic' : All tangential H-fields are considered zero at the symmetry plane.
% 'none'     : No symmetry.
% EXAMPLE
% status = f_SetSymmetryPlane(oMWS,xSymmetryType,ySymmetryType,zSymmetryType)
% status = f_SetSymmetryPlane(oMWS,'magnetic','electric','none')
historyStr = [];
historyStr = sprintf('With Boundary');
historyStr = sprintf('%s\n\t.Xsymmetry "%s"',historyStr,xSymmetryType);
historyStr = sprintf('%s\n\t.Ysymmetry "%s"',historyStr,ySymmetryType);
historyStr = sprintf('%s\n\t.Zsymmetry "%s"',historyStr,zSymmetryType);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define boundaries symm' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end

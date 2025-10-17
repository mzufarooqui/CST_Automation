function [ xSymmetryType ySymmetryType zSymmetryType ] = f_GetSymmetryPalne(oMWS)

% xSymmetryType, ySymmetryType and zSymmetryType can have one of the following values:
% 'electric' : All tangential E-fields are considered zero at the symmetry plane.
% 'magnetic' : All tangential H-fields are considered zero at the symmetry plane.
% 'none'     : No symmetry.
% EXAMPLE
% [ xSymmetryType ySymmetryType zSymmetryType ] = f_GetSymmetryPalne(oMWS)
oBoundary     = oMWS.invoke('Boundary');
xSymmetryType = oBoundary.invoke('GetXSymmetry');
ySymmetryType = oBoundary.invoke('GetYSymmetry');
zSymmetryType = oBoundary.invoke('GetZSymmetry');
end

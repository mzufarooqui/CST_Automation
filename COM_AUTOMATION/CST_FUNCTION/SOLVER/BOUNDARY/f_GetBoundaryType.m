function [ xMin xMax yMin yMax zMin zMax ] = f_GetBoundaryType(oMWS)
% Boundary Type can have one of the following values:
% 'electric'        : Electric boundary condition (Etan = 0)
% 'magnetic'        : Magnetic boundary condition (Htan = 0)
% 'open'            : Simulates the open space.
% 'expanded open'   : Same as 'open' but adds some extra space to the calculation domain.
% 'periodic'        : Simulates a periodic expansion of the calculation domain.
% 'conducting wall' : This boundary behaves like a wall of lossy metal material.
% 'unit cell'       : Simulates a unit cell structure.
% EXAMPLE
% [ xMin xMax yMin yMax zMin zMax ] = f_GetBoundaryType(oMWS)
oBoundary     = oMWS.invoke('Boundary');
xMin = oBoundary.invoke('GetXmin');
xMax = oBoundary.invoke('GetXmax');
yMin = oBoundary.invoke('GetYmin');
yMax = oBoundary.invoke('GetYmax');
zMin = oBoundary.invoke('GetZmin');
zMax = oBoundary.invoke('GetZmax');

end
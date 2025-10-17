function [subv_nxyz, subv_indexes] = GetSubvolumeMesh(nxyz, xyzLines, p1, p2)

% Input arguments:
% nxyz:             Dimensions of the complete grid
% xyzLines:         Grid line positions
% p1:               Corner point 1 of subvolume
% p2:               Corner point 2 of subvolume
%
% Output arguments:
% subv_nxyz:        Dimensions of subvolume grid
% subv_indexes:     A list of indexes for points in the subvolume

% Store mesh dimensions for x/y/z in separate variables
nx = nxyz(1);
ny = nxyz(2);
nz = nxyz(3);
% Store mesh line positions in separate variables 
xLines = xyzLines(1:nx);
yLines = xyzLines(nx+1:nx+ny);
zLines = xyzLines(nx+ny+1:nx+ny+nz);

% Find indexes where lines are between corner points
x_subv_indexes = find(xLines >= p1(1) & xLines <= p2(1));
y_subv_indexes = find(yLines >= p1(2) & yLines <= p2(2));
z_subv_indexes = find(zLines >= p1(3) & zLines <= p2(3));

% Store subvolume mesh dimensions and indexes in new variables
subv_nxyz = int32([length(x_subv_indexes);length(y_subv_indexes);length(z_subv_indexes)]);
subv_indexes=int32([x_subv_indexes y_subv_indexes z_subv_indexes]);

end
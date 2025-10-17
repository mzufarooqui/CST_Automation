function [matValue] = GetMaterialValueAtXYZ(matMatrix_cst, nxyz, xyzLines, xyz, matType)
% This function returns the matValue at a given xyz position
% Input values:
%   matMatrix_cst : The material matrix as returned by CST_GetMaterialMatrixHexMesh
%   nxyz          : Mesh size as returned by CST_GetHexMeshInfo
%   xyzLines      : The grid lines as returned by CST_GetHexMesh
%   xyz           : A vector containing the x, y, and z coordinates where the material value is requested
%   matType       : Integer value describing the material type, usage like for
%               CST_GetMaterialMatrixHexMesh: 0 - eps, 1 - mue, 2 - kap, 3 - rho
% Output values:
%   matValue  : The material value (3 components that differ for anisotropic materials) at position given by xyz

% Set up physical constants
eps0 = 8.85418782e-12;
mue0 = pi*4e-7;

nx = nxyz(1); ny = nxyz(2); nz = nxyz(3);
xLines = xyzLines(1:nx); yLines = xyzLines(nx+1:nx+ny); zLines = xyzLines(nx+ny+1:nx+ny+nz);
xLines = [xLines xLines(nx)];yLines = [yLines yLines(ny)]; zLines = [zLines zLines(nz)];
% CST MWS stores values in one long 1D array (index n) instead of a 3D array (indexes i,j,k).
% Formula for the reparametrization/super-index:
% n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny
nmax = nx*ny*nz;

% Find values/indexes of cell in which xyz lies
i=max(find(xLines(1:nx-1)-xyz(1)<=0));
j=max(find(yLines(1:ny-1)-xyz(2)<=0));
k=max(find(zLines(1:nz-1)-xyz(3)<=0));

% Extract information about cell geometries. These data are necessary for
% the material matrix calculations further below.
% Primary (p) grid first: Lengths L, Areas A
%
% Cell lengths in x/y/z direction at index i/j/k and (i+1)/(j+1)/(k+1).
pLxi1 = xLines(i+1)-xLines(i);
pLyj1 = yLines(j+1)-yLines(j);
pLzk1 = zLines(k+1)-zLines(k);
% Cell face areas with face normal x/y/z at index i/j/k
pAxjk = pLyj1*pLzk1;
pAyik = pLxi1*pLzk1;
pAzij = pLxi1*pLyj1;

% Now dual (d) grid: Lengths L, Areas A
%
% Cell lengths in x/y/z direction at index i/j/k.
% Dual grid is a bit more complex since first and last cell are different
% from the rest.
if (i==1)
    dLxi = pLxi1/2;   % first dual cell length is half the length of first primary cell
else
    pLxi2 = xLines(i)-xLines(i-1);
    dLxi = pLxi1/2+pLxi2/2;
end
if (j==1)
    dLyj = pLyj1/2;   % first dual cell length is half the length of first primary cell
else
    pLyj2 = yLines(j)-yLines(j-1);
    dLyj = pLyj1/2+pLyj2/2;
end
if (k==1)
    dLzk = pLzk1/2;   % first dual cell length is half the length of first primary cell
else
    pLzk2 = zLines(k)-zLines(k-1);
    dLzk = pLzk1/2+pLzk2/2;
end
% Cell face areas with face normal x/y/z at index i/j/k
% One more cell per direction to cover the same total area as the primary grid
dAxjk = dLyj*dLzk;
dAyik = dLxi*dLzk;
dAzij = dLxi*dLyj;

if (matType == 1) % mue matrix
    % Define super-index and its maximum value
    n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny;
    % x component
    inv_x = pAxjk/dLxi;
    % y component
    inv_y = pAyik/dLyj;
    % z component
    inv_z = pAzij/dLzk;
    matValue = 1./(matMatrix_cst([n nmax+n 2*nmax+n]).*([inv_x inv_y inv_z]).*mue0);
elseif (matType == 0 || matType == 2) % eps or kap
    % Define super-index and its maximum value
    n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny;
    % x components
    inv_x = dAxjk/pLxi1;
    % y components
    inv_y = dAyik/pLyj1;
    % z components
    inv_z = dAzij/pLzk1;
    if(matType==0) % eps
        matValue = 1./(matMatrix_cst([n nmax+n 2*nmax+n]).*([inv_x inv_y inv_z]).*eps0);
    else % kap
        matValue = matMatrix_cst([n nmax+n 2*nmax+n])./([inv_x inv_y inv_z]);
    end
elseif (matType == 3) % rho
    n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny;
    matValue = matMatrix_cst([n nmax+n 2*nmax+n]);
else % unsupported material type
    matValue = NaN;
end

end

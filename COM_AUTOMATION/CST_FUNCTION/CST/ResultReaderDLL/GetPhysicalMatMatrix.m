function [physMatMatrix] = GetPhysicalMatMatrix(matMatrix_cst, nxyz, xyzLines, matType)
% This function removes the grid information from CST material matrices
% Input values:
%   matMatrix_cst : The material matrix as returned by CST_GetMaterialMatrixHexMesh
%   nxyz          : Mesh size as returned by CST_GetHexMeshInfo
%   xyzLines      : The grid lines as returned by CST_GetHexMesh
%   matType       : Integer value describing the material type, usage like for
%                   CST_GetMaterialMatrixHexMesh: 0 - eps, 1 - mue, 2 - kap, 3 - rho
% Output values:
%   physMatMatrix : Physical material matrix

% Set up physical constants
eps0 = 8.85418782e-12;
mue0 = pi*4e-7;

nx = nxyz(1); ny = nxyz(2); nz = nxyz(3);
xLines = xyzLines(1:nx); yLines = xyzLines(nx+1:nx+ny); zLines = xyzLines(nx+ny+1:nx+ny+nz);
% CST MWS stores values in one long 1D array (index n) instead of a 3D array (indexes i,j,k).
% Formula for the reparametrization/super-index:
% n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny
nmax = nx*ny*nz;

% Extract information about cell geometries. These data are necessary for
% the material matrix calculations further below.
% Primary (p) grid first: Points P, Lengths L, Areas A, Volumes V
%
% x/y/z-coordinates of point at position (i,j,k)
pPijk = zeros(nx,ny,nz,3,'double');
for k = 1:nz
    for j = 1:ny
        for i = 1:nx
            pPijk(i,j,k,:) = [xLines(i) yLines(j) zLines(k)];
        end
    end
end
% Cell lengths in x/y/z direction at index i/j/k. Since there is no
% subgridding, the length can vary in one index only
% Zero padded for dimensional compatibility
pLxi = [pPijk(2:nx,1,1,1)-pPijk(1:nx-1,1,1,1);0];
pLyj = pPijk(1,2:ny,1,2)-pPijk(1,1:ny-1,1,2);
pLyj = [pLyj(1,:)';0];
pLzk = pPijk(1,1,2:nz,3)-pPijk(1,1,1:nz-1,3);
pLzk = [reshape(pLzk(1,1,:),nz-1,1);0];
% Cell face areas with face normal x/y/z at index i/j/k
% Zero padded for dimensional compatibility
pAxjk = zeros(ny,nz,'double');
pAyik = zeros(nx,nz,'double');
pAzij = zeros(nx,ny,'double');
for j = 1:ny-1
    pAxjk(j,:) = pLyj(j)*pLzk;
end
for i = 1:nx-1
    pAyik(i,:) = pLxi(i)*pLzk;
end
for i = 1:nx-1
    pAzij(i,:) = pLxi(i)*pLyj;
end
% Cell volume at index i/j/k
% Zero padded for dimensional compatibility
pVijk = zeros(nx,ny,nz,'double');
for i = 1:nx-1
    pVijk(i,:,:) = pLxi(i)*pAxjk;
end
% Now dual (d) grid: Points P, Lengths L, Areas A, Volumes V
%
% x/y/z-coordinates of point at position (i,j,k)
% Dual grid has 1 point less in each direction
dPijk = zeros(nx-1,ny-1,nz-1,3,'double');
for k = 1:nz-1
    for j = 1:ny-1
        for i = 1:nx-1
            dPijk(i,j,k,:) = [xLines(i)+pLxi(i)/2 yLines(j)+pLyj(j)/2 zLines(k)+pLzk(k)/2];
        end
    end
end
% Cell lengths in x/y/z direction at index i/j/k. Since there is no
% subgridding, the length can vary in one index only
% Dual grid is a bit more complex since first and last cell are different
% from the rest. Dual grid has 1 length more per direction (degenerated edge).
dLxi = zeros(1,nx,'double');
dLyj = zeros(1,ny,'double');
dLzk = zeros(1,nz,'double');
dLxi(1)      = pLxi(1)/2;   % first dual cell length is half the length of first primary cell
dLxi(2:nx-1) = dPijk(2:nx-1,1,1,1)-dPijk(1:nx-2,1,1,1);
dLxi(nx)     = pLxi(nx-1)/2;
dLyj(1)      = pLyj(1)/2;   % first dual cell length is half the length of first primary cell
dLyj(2:ny-1) = dPijk(1,2:ny-1,1,2)-dPijk(1,1:ny-2,1,2);
dLyj(ny)     = pLyj(ny-1)/2;
dLzk(1)      = pLzk(1)/2;   % first dual cell length is half the length of first primary cell
dLzk(2:nz-1) = dPijk(1,1,2:nz-1,3)-dPijk(1,1,1:nz-2,3);
dLzk(nz)     = pLzk(nz-1)/2;
% Cell face areas with face normal x/y/z at index i/j/k
% One more cell per direction to cover the same total area as the primary grid
dAxjk = zeros(ny,nz,'double');
dAyik = zeros(nx,nz,'double');
dAzij = zeros(nx,ny,'double');
for j = 1:ny
    dAxjk(j,:) = dLyj(j)*dLzk;
end
for i = 1:nx
    dAyik(i,:) = dLxi(i)*dLzk;
end
for i = 1:nx
    dAzij(i,:) = dLxi(i)*dLyj;
end
% Cell volume at index i/j/k
% One more cell per direction to cover the same total volume as the primary grid
dVijk = zeros(nx,ny,nz,'double');
for i = 1:nx
    dVijk(i,:,:) = dLxi(i)*dAxjk;
end
% Reserve space for inversion matrices
invMatrix = zeros(1,3*nx*ny*nz,'single');
% Reserve memory for physical material matrices
physMatMatrix = zeros(1,3*(nx-1)*(ny-1)*(nz-1),'single');

% Preparation for the upcoming calculations:
% Which eps/kap/mue values are zero?
pZeroFindVector = zeros(1,3*nx*ny*nz);
for k = 1:nz-1
    for j = 1:ny-1
        for i = 1:nx-1
            pZeroFindVector(1 + (i-1) + (j-1)*nx + (k-1)*nx*ny) = 1;
        end
    end
end
pNonZeros = int32(find(pZeroFindVector));

% Setup inversion matrices to remove cell geometry information from matrices
if (matType == 1) % mue matrix
    matMatrix_cst = matMatrix_cst*mue0;
    for k = 1:nz
        for j = 1:ny
            for i = 1:nx
                % Define super-index and its maximum value
                % Reminder: Mu = 1; Mv = nx; Mw = nx*ny;
                n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny;
            
                % x components
                invMatrix(n) = pAxjk(j,k)/dLxi(i);
                % y components
                invMatrix(nmax+n) = pAyik(i,k)/dLyj(j);
                % z components
                invMatrix(2*nmax+n) = pAzij(i,j)/dLzk(k);
            end
        end
    end
    physMatMatrix = 1./(matMatrix_cst([pNonZeros nmax+pNonZeros 2*nmax+pNonZeros]).*invMatrix([pNonZeros nmax+pNonZeros 2*nmax+pNonZeros]));
elseif (matType == 0 || matType == 2) % eps or kap
     for k = 1:nz
         for j = 1:ny
             for i = 1:nx
                 % Define super-index and its maximum value
                 % Reminder: Mu = 1; Mv = nx; Mw = nx*ny;
                 n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny;
            
                 % x components
                 invMatrix(n) = dAxjk(j,k)/pLxi(i);
                 % y components
                 invMatrix(nmax+n) = dAyik(i,k)/pLyj(j);
                 % z components
                 invMatrix(2*nmax+n) = dAzij(i,j)/pLzk(k);
             end
         end
     end
     if(matType==0)
        matMatrix_cst = matMatrix_cst*eps0;
        physMatMatrix = 1./(matMatrix_cst([pNonZeros nmax+pNonZeros 2*nmax+pNonZeros]).*invMatrix([pNonZeros nmax+pNonZeros 2*nmax+pNonZeros]));
     else
        physMatMatrix = matMatrix_cst([pNonZeros nmax+pNonZeros 2*nmax+pNonZeros])./invMatrix([pNonZeros nmax+pNonZeros 2*nmax+pNonZeros]);
     end
elseif (matType == 3) % rho
     physMatMatrix = matMatrix_cst([pNonZeros nmax+pNonZeros 2*nmax+pNonZeros]);
else
     physMatMatrix = NaN;
end

end


clear all;
close all;

% Set up physical constants
eps0 = 8.85418782e-12;
mue0 = pi*4e-7;

% Load library. The path to these files must be known to matlab.
DLL_Path = '..\';
HeaderPath = '.\';
libname = 'CSTResultReader';
if (strcmp(computer, 'PCWIN64')) 
    libname = 'CSTResultReader_AMD64';
    DLL_Path = '..\AMD64\';
end
CSTResultReader = strcat( DLL_Path, libname, '.dll' );
CSTResultReaderH = strcat( HeaderPath, 'CSTResultReaderInterf.h' );
loadlibrary(CSTResultReader,CSTResultReaderH);

mwsProjName = '.\coaxial connector td-hex.cst';
sHandle.m_pProj = 0;
% Initalize the return value
% Values: 0-OK; 1-Unknown; 2-File not found; 3-Invalid cst file;
%         4-Tree item not found; 5-Incompatible result;
%         6-Error in function arguments; 7-Result incompatible with dll;
%         8-Memory error; 9-Unsupported mesh type; 10-Version conflict
ret = 0;
[ret, mwsProjName, sHandle] = calllib(libname, 'CST_OpenProject', mwsProjName, sHandle);  % Initialize the handle

nxyz = zeros(1,3,'int32');                                                              % Initialize variable for mesh dimensions
[ret, sHandle, nxyz] = calllib(libname, 'CST_GetHexMeshInfo', sHandle, nxyz); % Read out hex mesh dimensions
nx = nxyz(1); ny = nxyz(2); nz = nxyz(3);                                               % Store mesh dimensions separately
% Constants for reparametrization/super-index applied later:
% n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny
nmax = nx*ny*nz;                % maximum value of super-index n
nCells = (nx-1)*(ny-1)*(nz-1);  % number of cells

xyzLines = zeros(1,sum(nxyz),'double');                                                         % Initialize variable for mesh lines
[ret, sHandle, xyzLines] = calllib(libname, 'CST_GetHexMesh', sHandle, xyzLines);     % Read out hex mesh lines
xLines = xyzLines(1:nx); yLines = xyzLines(nx+1:nx+ny); zLines = xyzLines(nx+ny+1:nx+ny+nz);    % Store mesh line positions separately

% Create a 3D mesh view
figure(1)
symbol = 'b';   % Define line type
hold on         % Hold plot
for i = 1:nx
    plot3([xLines(i)*ones(1,nz); xLines(i)*ones(1,nz)],[min(yLines)*ones(1,nz); max(yLines)*ones(1,nz)],[zLines(1:nz); zLines(1:nz)],symbol) % Plot x mesh lines
end
for j = 1:ny
    plot3([min(xLines)*ones(1,nz); max(xLines)*ones(1,nz)],[yLines(j)*ones(1,nz); yLines(j)*ones(1,nz)],[zLines(1:nz); zLines(1:nz)],symbol) % Plot y mesh lines
end
for i = 1:nx
    plot3([xLines(i)*ones(1,ny); xLines(i)*ones(1,ny)],[yLines(1:ny); yLines(1:ny)],[min(zLines)*ones(1,ny); max(zLines)*ones(1,ny)],symbol) % Plot z mesh lines
end
xmargin = (max(xLines)-min(xLines))/10; % Define x margin around mesh lines
ymargin = (max(yLines)-min(yLines))/10; % Define y margin around mesh lines
zmargin = (max(zLines)-min(zLines))/10; % Define z margin around mesh lines
axis([min(xLines)-xmargin max(xLines)+xmargin min(yLines)-ymargin max(yLines)+ymargin min(zLines)-zmargin max(zLines)+zmargin]) % Apply margins
xlabel('x');ylabel('y');zlabel('z');
title('3D mesh view')
hold off    % Release plot

% Reserve memory for cst material matrices
% cst matrices contain information about cell geometry
epsMatrix_cst = zeros(1,3*nx*ny*nz,'single');
mueMatrix_cst = zeros(1,3*nx*ny*nz,'single');
kapMatrix_cst = zeros(1,3*nx*ny*nz,'single');
rhoMatrix_cst = zeros(1,3*nx*ny*nz,'single');
% Reserve memory for physical material matrices
epsMatrix = zeros(1,3*(nx-1)*(ny-1)*(nz-1),'single'); 
mueMatrix = zeros(1,3*(nx-1)*(ny-1)*(nz-1),'single');
kapMatrix = zeros(1,3*(nx-1)*(ny-1)*(nz-1),'single');
rhoMatrix = zeros(1,3*(nx-1)*(ny-1)*(nz-1),'single');

% Read out cst materical matrices,
% adjust physical constants and project units
[ret, sHandle, epsMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 0, epsMatrix_cst);
[ret, sHandle, mueMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 1, mueMatrix_cst);
[ret, sHandle, kapMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 2, kapMatrix_cst);
[ret, sHandle, rhoMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 3, rhoMatrix_cst);

epsMatrix = GetPhysicalMatMatrix(epsMatrix_cst, nxyz, xyzLines, 0);
mueMatrix = GetPhysicalMatMatrix(mueMatrix_cst, nxyz, xyzLines, 1);
kapMatrix = GetPhysicalMatMatrix(kapMatrix_cst, nxyz, xyzLines, 2);
rhoMatrix = GetPhysicalMatMatrix(rhoMatrix_cst, nxyz, xyzLines, 3);

figure(2)   % mue plot
mueMax = max(mueMatrix(isfinite(mueMatrix)));   % Maximum value of mue, necessary for rgb normalization
hold on                                           % Hold plot
for k=1:nz-1
    for j=1:ny-1
        for i=1:nx-1
            % Reduced super-index for reduced matrices
            n = 1 + (i-1)*1 + (j-1)*(nx-1) + (k-1)*(nx-1)*(ny-1);
            if(isinf(mueMatrix(n))) % choosing exactly 1 sometimes yields incorrect results due to numerical errors
                symbol = '.';
                MEColor = 'k'; % PEC is black
                MFColor = 'k'; % PEC is black
            elseif(abs(mueMatrix(n)-1) < 1e-4)
                % Vacuum is a cyan dot
                symbol = '';
                MEColor = 'c';
                MFColor = 'c';
            else
                % Adjust color scheme to your liking here
                symbol = 'O';
                MEColor = 1-[.3 .3 mueMatrix(n)/mueMax];
                MFColor = 1-[.3 .3 mueMatrix(n)/mueMax];
            end
            plot3((xLines(i)+xLines(i+1))/2,(yLines(j)+yLines(j+1))/2,(zLines(k)+zLines(k+1))/2,symbol,'MarkerEdgeColor',MEColor,'MarkerFaceColor',MFColor)
        end
    end
end
axis([min(xLines)-xmargin max(xLines)+xmargin min(yLines)-ymargin max(yLines)+ymargin min(zLines)-zmargin max(zLines)+zmargin]) % Apply margins
xlabel('x');ylabel('y');zlabel('z');
title('Spatial distribution of \mu')
hold off         % Release plot

% The next steps show how to read out and plot field results.
% Specify the desired result number. In most cases there is only one result.
% (as assumed here)
iResultNumber = 0;
% The name of the result
sTree3DResName = '2D/3D Results\H-Field\h-field (f=8) [1]'
% Size of expected 3D-Data
resSize = 0;

% Ask for the size of the expected data vector.
[ret, sHandle, sTree3DResName, resSize] = calllib(libname, 'CST_Get3DHexResultSize', sHandle, sTree3DResName, iResultNumber, resSize);
assert(~ret)
 
% Define an array of proper size. 
% NOTE: If the array size does not have the proper size, matlab may crash!
hField3D=zeros(resSize,1,'single');

% Get the h-field values.
[ret, sHandle, sTree3DResName, hField3D] = calllib(libname, 'CST_Get3DHexResult', sHandle, sTree3DResName, iResultNumber, hField3D);
assert(~ret)

% Calculate abs values
hFieldAbs3D=zeros(nmax,1,'single');
for i=0:nmax-1
   hFieldAbs3D(i+1)=sqrt(hField3D(2*i+1)^2+hField3D(2*i+2)^2+hField3D(nmax+2*i+1)^2+hField3D(nmax+2*i+2)^2+hField3D(2*nmax+2*i+1)^2+hField3D(2*nmax+2*i+2)^2);
end

% Extract abs values on a z plane
zLevel = 0.002;
% Map z position to corresponding z index
[minDeltaZ nzLevel] = min(abs(zLines-zLevel));
clear minDeltaZ;
hFieldAbs2D=zeros(nx,ny,'single');
for j=1:ny
    hFieldAbs2D(:,j)=hFieldAbs3D((nx*ny*(nzLevel-1))+(j-1)*nx+1:(nx*ny*(nzLevel-1))+(j-1)*nx+nx);
end
[X Y]=meshgrid(xLines, yLines);
figure(3)
contourf(X,Y,hFieldAbs2D',10)
xmargin = (max(xLines)-min(xLines))/10; % Define x margin around mesh lines
ymargin = (max(yLines)-min(yLines))/10; % Define y margin around mesh lines
zmargin = (max(zLines)-min(zLines))/10; % Define z margin around mesh lines
axis([min(xLines)-xmargin max(xLines)+xmargin min(yLines)-ymargin max(yLines)+ymargin]) % Apply margins
xlabel('x');ylabel('y');
title(strcat('h-field at z=',num2str(zLevel)))

% Close the CST project handle.
[ret, sHandle] = calllib(libname, 'CST_CloseProject', sHandle);
assert(~ret)

% Free the library.
unloadlibrary(libname)

clear i j k n X Y xmargin ymargin zmargin symbol ret iResultNumber MEColor MFColor nzLevel zLevel sHandle resSize sTree3DResName

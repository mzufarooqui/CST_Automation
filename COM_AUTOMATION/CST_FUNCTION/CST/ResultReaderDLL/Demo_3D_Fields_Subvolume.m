% This file demonstrates how to use the ResultReaderDLL in conjunction with
% Matlab. In particular, it is shown how to read out mesh and material
% information. This file will work correctly with meshes created by FPBA
% only.
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
sHandle = libstruct('CSTProjHandle');      % Define the CST project handle
sHandle.m_pProj = 0;
% Initalize the return value
% Values: 0-OK; 1-Unknown; 2-File not found; 3-Invalid cst file;
%         4-Tree item not found; 5-Incompatible result;
%         6-Error in function arguments; 7-Result incompatible with dll;
%         8-Memory error; 9-Unsupported mesh type; 10-Version conflict
ret = 0;
[ret, mwsProjName, sHandle] = calllib(libname, 'CST_OpenProject', mwsProjName, sHandle);  % Initialize the handle
assert(~ret)

nxyz_full = zeros(1,3,'int32');                                                                     % Initialize variable for mesh dimensions
[ret, sHandle, nxyz_full] = calllib(libname, 'CST_GetHexMeshInfo', sHandle, nxyz_full);   % Read out hex mesh dimensions
assert(~ret)
xyzLines_full = zeros(1,sum(nxyz_full),'double');                                                       % Initialize variable for mesh lines
[ret, sHandle, xyzLines_full] = calllib(libname, 'CST_GetHexMesh', sHandle, xyzLines_full);   % Read out hex mesh lines
assert(~ret)
nx_full = nxyz_full(1); ny_full = nxyz_full(2); nz_full = nxyz_full(3); % Store mesh dimensions for x/y/z in separate variables
% Store mesh line positions in separate variables
xLines_full = xyzLines_full(1:nx_full);
yLines_full = xyzLines_full(nx_full+1:nx_full+ny_full);
zLines_full = xyzLines_full(nx_full+ny_full+1:nx_full+ny_full+nz_full);
% Define corner points of subvolume and get subvolume info
p1 = [-.001 -15e-3 min(zLines_full)];
p2 = [0.01 0 max(zLines_full)];
[nxyz_sub sub_inds] = GetSubvolumeMesh(nxyz_full, xyzLines_full, p1, p2);
% Update mesh line positions for subvolume
nx_sub = nxyz_sub(1); ny_sub = nxyz_sub(2); nz_sub = nxyz_sub(3);
xsub_inds = sub_inds(1:nx_sub);
ysub_inds = sub_inds(nx_sub+1:nx_sub+ny_sub);
zsub_inds = sub_inds(nx_sub+ny_sub+1:nx_sub+ny_sub+nz_sub);
xyzLines_sub = xyzLines_full([xsub_inds nx_full+ysub_inds nx_full+ny_full+zsub_inds]);
xLines_sub = xyzLines_full(xsub_inds);
yLines_sub = xyzLines_full(nx_full+ysub_inds);
zLines_sub = xyzLines_full(nx_full+ny_full+zsub_inds);

% CST MWS stores values in one long 1D array (index n) instead of a 3D array (indexes i,j,k).
% Formula for the reparametrization/super-index:
% n = 1 + (i-1) + (j-1)*nx + (k-1)*nx*ny
nmax_full = nx_full*ny_full*nz_full;    % maximum value of super-index n for full volume
nmax_sub = nx_sub*ny_sub*nz_sub;        % maximum value of super-index n for subvolume
nCells_full = (nx_full-1)*(ny_full-1)*(nz_full-1);    % number of cells for full volume
nCells_sub = (nx_sub-1)*(ny_sub-1)*(nz_sub-1);        % number of cells for subvolume
% Create a new mapping vector containing all indexes of superindex n that
% belong to the subvolume
sub_inds_n = zeros(nmax_sub,1,'int32');
n=1;
for k=1:nz_sub
    for j=1:ny_sub
        for i=1:nx_sub
            sub_inds_n(n) = 1 + (xsub_inds(i)-1) + (ysub_inds(j)-1)*nx_full + (zsub_inds(k)-1)*nx_full*ny_full;
            n=n+1;
        end
    end
end

% Create a 3D mesh view
figure(1)
hold on         % Hold plot
% Full mesh as underlying plot
symbol = 'c';   % Define line type
for i = 1:nx_full
    plot3([xLines_full(i)*ones(1,nz_full); xLines_full(i)*ones(1,nz_full)],[min(yLines_full)*ones(1,nz_full); max(yLines_full)*ones(1,nz_full)],[zLines_full(1:nz_full); zLines_full(1:nz_full)],symbol) % Plot x mesh lines
end
for j = 1:ny_full
    plot3([min(xLines_full)*ones(1,nz_full); max(xLines_full)*ones(1,nz_full)],[yLines_full(j)*ones(1,nz_full); yLines_full(j)*ones(1,nz_full)],[zLines_full(1:nz_full); zLines_full(1:nz_full)],symbol) % Plot y mesh lines
end
for i = 1:nx_full
    plot3([xLines_full(i)*ones(1,ny_full); xLines_full(i)*ones(1,ny_full)],[yLines_full(1:ny_full); yLines_full(1:ny_full)],[min(zLines_full)*ones(1,ny_full); max(zLines_full)*ones(1,ny_full)],symbol) % Plot z mesh lines
end
% Subvolume mesh on top
symbol = 'b';   % Define line type
for i = 1:nx_sub
    plot3([xLines_sub(i)*ones(1,nz_sub); xLines_sub(i)*ones(1,nz_sub)],[min(yLines_sub)*ones(1,nz_sub); max(yLines_sub)*ones(1,nz_sub)],[zLines_sub(1:nz_sub); zLines_sub(1:nz_sub)],symbol) % Plot x mesh lines
end
for j = 1:ny_sub
    plot3([min(xLines_sub)*ones(1,nz_sub); max(xLines_sub)*ones(1,nz_sub)],[yLines_sub(j)*ones(1,nz_sub); yLines_sub(j)*ones(1,nz_sub)],[zLines_sub(1:nz_sub); zLines_sub(1:nz_sub)],symbol) % Plot y mesh lines
end
for i = 1:nx_sub
    plot3([xLines_sub(i)*ones(1,ny_sub); xLines_sub(i)*ones(1,ny_sub)],[yLines_sub(1:ny_sub); yLines_sub(1:ny_sub)],[min(zLines_sub)*ones(1,ny_sub); max(zLines_sub)*ones(1,ny_sub)],symbol) % Plot z mesh lines
end
xmargin = (max(xLines_full)-min(xLines_full))/10; % Define x margin around mesh lines
ymargin = (max(yLines_full)-min(yLines_full))/10; % Define y margin around mesh lines
zmargin = (max(zLines_full)-min(zLines_full))/10; % Define z margin around mesh lines
axis([min(xLines_full)-xmargin max(xLines_full)+xmargin min(yLines_full)-ymargin max(yLines_full)+ymargin min(zLines_full)-zmargin max(zLines_full)+zmargin]) % Apply margins
xlabel('x');ylabel('y');zlabel('z');
title('3D mesh view')
hold off    % Release plot

% Reserve memory for cst material matrices
% cst matrices contain information about cell geometry
epsMatrix_cst = zeros(1,3*nx_full*ny_full*nz_full,'single');
mueMatrix_cst = zeros(1,3*nx_full*ny_full*nz_full,'single');
kapMatrix_cst = zeros(1,3*nx_full*ny_full*nz_full,'single');
rhoMatrix_cst = zeros(1,3*nx_full*ny_full*nz_full,'single');
% Reserve memory for physical material matrices
epsMatrix = zeros(1,3*(nx_full-1)*(ny_full-1)*(nz_full-1),'single'); 
mueMatrix = zeros(1,3*(nx_full-1)*(ny_full-1)*(nz_full-1),'single');
kapMatrix = zeros(1,3*(nx_full-1)*(ny_full-1)*(nz_full-1),'single');
rhoMatrix = zeros(1,3*(nx_full-1)*(ny_full-1)*(nz_full-1),'single');

% Read out cst materical matrices,
% adjust physical constants and project units
[ret, sHandle, epsMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 0, epsMatrix_cst);
[ret, sHandle, mueMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 1, mueMatrix_cst);
[ret, sHandle, kapMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 2, kapMatrix_cst);
[ret, sHandle, rhoMatrix_cst] = calllib(libname, 'CST_GetMaterialMatrixHexMesh', sHandle, 3, rhoMatrix_cst);

% Cut out subvolume
epsMatrix_cst = epsMatrix_cst([sub_inds_n' nmax_full+sub_inds_n' 2*nmax_full+sub_inds_n']);
kapMatrix_cst = kapMatrix_cst([sub_inds_n' nmax_full+sub_inds_n' 2*nmax_full+sub_inds_n']);
mueMatrix_cst = mueMatrix_cst([sub_inds_n' nmax_full+sub_inds_n' 2*nmax_full+sub_inds_n']);
rhoMatrix_cst = rhoMatrix_cst([sub_inds_n' nmax_full+sub_inds_n' 2*nmax_full+sub_inds_n']);

epsMatrix = GetPhysicalMatMatrix(epsMatrix_cst, nxyz_sub, xyzLines_sub, 0);
mueMatrix = GetPhysicalMatMatrix(mueMatrix_cst, nxyz_sub, xyzLines_sub, 1);
kapMatrix = GetPhysicalMatMatrix(kapMatrix_cst, nxyz_sub, xyzLines_sub, 2);
rhoMatrix = GetPhysicalMatMatrix(rhoMatrix_cst, nxyz_sub, xyzLines_sub, 3);

figure(2)   % mue plot
mueMax = max(mueMatrix(isfinite(mueMatrix)));   % Maximum value of mue, necessary for rgb normalization
hold on                                           % Hold plot
for k=1:nz_sub-1
    for j=1:ny_sub-1
        for i=1:nx_sub-1
            % Reduced super-index for reduced matrices
            n_red = 1 + (i-1)*1 + (j-1)*(nx_sub-1) + (k-1)*(nx_sub-1)*(ny_sub-1);
            if(isinf(mueMatrix(n_red))) % choosing exactly 1 sometimes yields incorrect results due to numerical errors
                symbol = '.';
                MEColor = 'k'; % PEC is black
                MFColor = 'k'; % PEC is black
            elseif(abs(mueMatrix(n_red)-1) < 1e-4)
                % Vacuum is a cyan dot
                symbol = '';
                MEColor = 'c';
                MFColor = 'c';
            else
                % Adjust color scheme to your liking here
                symbol = 'O';
                MEColor = 1-[.3 .3 mueMatrix(n_red)/mueMax];
                MFColor = 1-[.3 .3 mueMatrix(n_red)/mueMax];
            end
            plot3((xLines_sub(i)+xLines_sub(i+1))/2,(yLines_sub(j)+yLines_sub(j+1))/2,(zLines_sub(k)+zLines_sub(k+1))/2,symbol,'MarkerEdgeColor',MEColor,'MarkerFaceColor',MFColor)
        end
    end
end
axis([min(xLines_full)-xmargin max(xLines_full)+xmargin min(yLines_full)-ymargin max(yLines_full)+ymargin min(zLines_full)-zmargin max(zLines_full)+zmargin]) % Apply margins
xlabel('x');ylabel('y');zlabel('z');
title('Spatial distribution of \mu')
hold off         % Release plot

% The next steps show how to read out and plot field results.
% Specify the desired result number. In most cases there is only one result.
% (as assumed here)
iResultNumber = 0;
% The name of the result
sTree3DResName = '2D/3D Results\H-Field\h-field (f=8) [1]';
% Size of expected 3D-Data
resSize = 0;

% Ask for the size of the expected data vector.
[ret, sHandle, sTree3DResName, resSize] = calllib(libname, 'CST_Get3DHexResultSize', sHandle, sTree3DResName, iResultNumber, resSize);
assert(~ret)
 
% Define an array of proper size. 
% NOTE: If the array size does not have the proper size, matlab may crash!
% Expected size for 3D h-field: 3*2*nmax_full, since there are 3 vector
% components with real and imaginary parts for each grid line
hField3D=zeros(resSize,1,'single');

% Get the h-field values.
[ret, sHandle, sTree3DResName, hField3D] = calllib(libname, 'CST_Get3DHexResult', sHandle, sTree3DResName, iResultNumber, hField3D);
assert(~ret)

% Reduce to subvolume. Correct size should be 3*2*nmax_sub
hFiled3D_sub = zeros(3*2*nmax_sub,1,'single');
% Fill the array: First x values
hField3D_sub(2*(0:length(sub_inds_n)-1)+1) = hField3D(2*(sub_inds_n-1)+1); % real parts
hField3D_sub(2*(0:length(sub_inds_n)-1)+2) = hField3D(2*(sub_inds_n-1)+2); % imaginary parts
% y values
hField3D_sub(2*(0:length(sub_inds_n)-1)+1+double(nmax_sub)) = hField3D(2*(sub_inds_n-1)+1+double(nmax_full)); % real parts
hField3D_sub(2*(0:length(sub_inds_n)-1)+2+double(nmax_sub)) = hField3D(2*(sub_inds_n-1)+2+double(nmax_full)); % imaginary parts
% z values
hField3D_sub(2*(0:length(sub_inds_n)-1)+1+2*double(nmax_sub)) = hField3D(2*(sub_inds_n-1)+1+2*double(nmax_full)); % real parts
hField3D_sub(2*(0:length(sub_inds_n)-1)+2+2*double(nmax_sub)) = hField3D(2*(sub_inds_n-1)+2+2*double(nmax_full)); % imaginary parts

% Calculate abs values
hFieldAbs3D_sub=zeros(nmax_sub,1,'single');
for i=1:nmax_sub-1
   hFieldAbs3D_sub(i+1)=sqrt(hField3D_sub(2*i+1)^2+hField3D_sub(2*i+2)^2+hField3D_sub(nmax_sub+2*i+1)^2+hField3D_sub(nmax_sub+2*i+2)^2+hField3D_sub(2*nmax_sub+2*i+1)^2+hField3D_sub(2*nmax_sub+2*i+2)^2);
end

% Extract abs values on a z plane
zLevel = 0;
% Map z position to corresponding z index
[minDeltaZ nzLevel] = min(abs(zLines_sub-zLevel));
clear minDeltaZ;
hFieldAbs2D_sub=zeros(nx_sub,ny_sub,'single');
for j=1:ny_sub
    hFieldAbs2D_sub(:,j)=hFieldAbs3D_sub((nx_sub*ny_sub*(nzLevel-1))+(j-1)*nx_sub+1:(nx_sub*ny_sub*(nzLevel-1))+(j-1)*nx_sub+nx_sub);
end
[X Y]=meshgrid(xLines_sub, yLines_sub);
figure(3)
contourf(X,Y,hFieldAbs2D_sub',10)
xmargin = (max(xLines_full)-min(xLines_full))/10; % Define x margin around mesh lines
ymargin = (max(yLines_full)-min(yLines_full))/10; % Define y margin around mesh lines
zmargin = (max(zLines_full)-min(zLines_full))/10; % Define z margin around mesh lines
axis([min(xLines_full)-xmargin max(xLines_full)+xmargin min(yLines_full)-ymargin max(yLines_full)+ymargin]) % Apply margins
xlabel('x');ylabel('y');
title(strcat('h-field at z=',num2str(zLines_sub(nzLevel))))

% Close the CST project handle.
[ret, sHandle] = calllib(libname, 'CST_CloseProject', sHandle);
assert(~ret)

% Free the library.
unloadlibrary(libname)

clear i j k n X Y xmargin ymargin zmargin symbol ret iResultNumber MEColor MFColor nzLevel zLevel sHandle resSize sTree3DResName

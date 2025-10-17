% Readout the complex S11 parameter from the CST project "coaxial connector td-hex.cst"

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

% Show a summary of all available functions in the .dll. It also shows what arguments
% a function call needs in matlab.
%libfunctionsview CSTResultReader 

% Project from the current directory
mwsProjName = '.\coaxial connector td-hex.cst';
sTree1DNameSPolar = '1D Results\S polar\S1,1';

% Initalize the return value
ret = 0;

% Define the CST project handle
sHandle = libstruct('CSTProjHandle');
sHandle.m_pProj = 0;

% Initialize the handle
[ret, mwsProjName, sHandle] = ...
calllib(libname, 'CST_OpenProject', mwsProjName, sHandle);

% Specify the desired result number. In most cases there is only one result.
% (as assumed here)
iResultNumber = 0;

% Size of expected 1D-Data
nSigSize = 0;

% Ask for the size of the expected data vector.
[ret, sHandle, sTree1DNameSPolar, nSigSize] = ...
calllib(libname, 'CST_Get1DResultSize', sHandle, sTree1DNameSPolar, iResultNumber, nSigSize);

% Define an array of proper size. 
% Since a two-component result is requested, the previously encountered data size is large enough 
% to cover all those values. However, the abscissa values are of real type (1 component values) 
% and so the storage needs to be only half of that size.
% NOTE: If the array size does not have the proper size, matlab may crash!
xVal=zeros(nSigSize/2,1);

% Get the frequency values.
[ret, sHandle, sTree1DNameSPolar, xVal] = ...
calllib(libname, 'CST_Get1DRealDataAbszissa', sHandle, sTree1DNameSPolar, iResultNumber, xVal);

% Get the complex S11 values.
yVal=zeros(nSigSize,1);
[ret, sHandle, sTree1DNameSPolar, yVal] = ...
calllib(libname, 'CST_Get1D_2Comp_DataOrdinate', sHandle, sTree1DNameSPolar, iResultNumber, yVal);

% Extract the complex components from the vector.
SAmpl = yVal(1:2:length(yVal));
SPhase = yVal(2:2:length(yVal));

% Create a 1D-Plot of the absolute value of S11 versus frequency.
plot(xVal,SAmpl)

% Close the CST project handle.
[ret, sHandle] = ...
calllib(libname, 'CST_CloseProject', sHandle);

% Free the library.
unloadlibrary(libname)

function f_ASCIIExport(oMWS,oASCIIExport)
%% DEFINE ASCIIExport
% ASCIIExport Object
% Export 1D data as a ASCII file.
%% FIELD DEFINATION
% Reset
%     Resets the export options to the default.
% FileName ( filename filename )
%     Sets the name of the exported file.
% Mode ( 'FixedNumber', 'FixedWidth')
%     'FixedNumber':  Fixed number of samples
%     'FixedWidth':   Fixed step width
% Step ( int steps / double stepwidth )
%     Number of steps or step width in all directions. Use the .Mode method before.
% StepX ( int steps / double stepwidth )
% StepY ( int steps / double stepwidth )
% StepZ ( int steps / double stepwidth )
%     Number of steps or step width in x / y / z-direction. Use the .Mode method before.
% SetVersion ( enum version)
%     Sets the version of the ascii export to version. Supported settings are "2009" and "2010"
%     for the farfield ASCII export. All other exports are not affected by this setting.
%% EXAMPLE:
% oASCIIExport.fileName = [pwd '\abcd.txt'];
% oASCIIExport.mode  = 'FixedNumber';
% oASCIIExport.stepX = 12;
% oASCIIExport.stepY = 13;
% oASCIIExport.stepZ = 14;
% f_ASCIIExport(oMWS,oASCIIExport)
%
% oASCIIExport.fileName = [pwd '\abcd1.txt'];
% oASCIIExport.mode  = 'FixedWidth';
% oASCIIExport.DX    = 1;
% oASCIIExport.DY    = 1;
% oASCIIExport.DZ    = 1;
% f_ASCIIExport(oMWS,oASCIIExport)
%% MATLAB SCRIPT
oASCIIExportObj = invoke(oMWS,'ASCIIExport');
oASCIIExportObj.invoke('Reset');
oASCIIExportObj.invoke('FileName',oASCIIExport.fileName);
if isfield(oASCIIExportObj,'mode')
    oASCIIExportObj.invoke('Mode',oASCIIExport.mode);
    switch oASCIIExport.mode
        case 'FixedNumber'
            oASCIIExportObj.invoke('StepX',oASCIIExport.stepX);
            oASCIIExportObj.invoke('StepY',oASCIIExport.stepY);
            oASCIIExportObj.invoke('StepZ',oASCIIExport.stepZ);
        case 'FixedWidth'
            oASCIIExportObj.invoke('StepX',oASCIIExport.DX);
            oASCIIExportObj.invoke('StepY',oASCIIExport.DY);
            oASCIIExportObj.invoke('StepZ',oASCIIExport.DZ);
    end
end
oASCIIExportObj.invoke('Execute');
end
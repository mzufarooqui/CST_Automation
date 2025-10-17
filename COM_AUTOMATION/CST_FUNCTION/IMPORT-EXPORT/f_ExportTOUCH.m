function f_ExportTOUCH(oMWS,exportTCH)
%% DEFINE EXPORT TOUCHSTONE FILE

%% FIELD DEFINATION
%
%  fileName ( filename filename )
%     Sets the name of the export file.
%  frequencyRange
%     'Full'   Full frequency range export 
%     'Limited' Limited frequency range export. This requires Fmin and Fmax to be set.
%% EXAMPLE:
%    exportTCH.fileName       = [pwd '\TEMP\example.s6p'];
%    exportTCH.frequencyRange = 'Full';
%    exportTCH.impedance      = 50;
%    exportTCH.bRenormalize   = 'False';
%    exportTCH.setNSamples    = 51;
%    f_ExportTOUCH(oMWS,exportTCH)

%% MATLAB SCRIPT
oExportTCH = oMWS.invoke('TOUCHSTONE');
oExportTCH.invoke('Reset');
if isfield(exportTCH,'fileName'),                   oExportTCH.invoke('FileName',                 exportTCH.fileName);                       end
if isfield(exportTCH,'bUseARResults'),              oExportTCH.invoke('UseARResults',             exportTCH.bUseARResults);                  else oExportTCH.invoke('UseARResults','False'); end
if isfield(exportTCH,'bRenormalize'),               oExportTCH.invoke('Renormalize',              exportTCH.bRenormalize);                   else oExportTCH.invoke('Renormalize','False'); end
if isfield(exportTCH,'impedance'),                  oExportTCH.invoke('Impedance',                exportTCH.impedance);                      end
if isfield(exportTCH,'frequencyRange'),             oExportTCH.invoke('FrequencyRange',           exportTCH.frequencyRange);                 else oExportTCH.invoke('FrequencyRange','Full');end
if isfield(exportTCH,'setNSamples'),                oExportTCH.invoke('SetNSamples',              exportTCH.setNSamples);                    end
oExportTCH.invoke('Write');
end
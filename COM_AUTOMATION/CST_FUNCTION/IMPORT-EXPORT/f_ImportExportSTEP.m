function f_ImportExportSTEP(oMWS,impoExpoSTEP)
%% EXAMPLE:
%    *For Import:*
%    oImpoExpoSTEP.fileName     = [pwd '\TEMP\example.step'];
%    oImpoExpoSTEP.version      = '21.0';
%    oImpoExpoSTEP.importExport = 'Read';
%    f_ImportExportSTEP(oMWS,oImpoExpoSTEP);
%
%    *For Export:*
%    impoExpoSTEP.fileName          = [pwd '\TEMP\example.step'];
%    impoExpoSTEP.bExportAttributes = 'True';
%    impoExpoSTEP.importExport      = 'Write';
%    f_ImportExportSTEP(oMWS,impoExpoSTEP);

%% MATLAB SCRIPT
oImpoExpoSTEP = oMWS.invoke('STEP');
oImpoExpoSTEP.invoke('Reset');
if isfield(impoExpoSTEP,'fileName'),                        oImpoExpoSTEP.invoke('FileName',                      impoExpoSTEP.fileName);                            end
if isfield(impoExpoSTEP,'id'),                              oImpoExpoSTEP.invoke('Id',                            impoExpoSTEP.id);                                  end
if isfield(impoExpoSTEP,'version'),                         oImpoExpoSTEP.invoke('Version',                       impoExpoSTEP.version);                             end
if isfield(impoExpoSTEP,'bHealing'),                        oImpoExpoSTEP.invoke('Healing',                       impoExpoSTEP.bHealing);                         end
if isfield(impoExpoSTEP,'bScaleToUnit'),                    oImpoExpoSTEP.invoke('ScaleToUnit',                   impoExpoSTEP.bScaleToUnit );                    end
if isfield(impoExpoSTEP,'bImportToActiveCoordinateSystem'), oImpoExpoSTEP.invoke('ImportToActiveCoordinateSystem',impoExpoSTEP.bImportToActiveCoordinateSystem);                    end
if isfield(impoExpoSTEP,'bCurves'),                         oImpoExpoSTEP.invoke('Curves',                        impoExpoSTEP.bCurves);               end
if isfield(impoExpoSTEP,'bImportAttributes'),               oImpoExpoSTEP.invoke('ImportAttributes',              impoExpoSTEP.bImportAttributes);                        end
if isfield(impoExpoSTEP,'bImportCurveAttributes'),          oImpoExpoSTEP.invoke('ImportCurveAttributes',         impoExpoSTEP.bImportCurveAttributes);     end
if isfield(impoExpoSTEP,'bExportAttributes'),               oImpoExpoSTEP.invoke('ExportAttributes',              impoExpoSTEP.bExportAttributes);                             end
if isfield(impoExpoSTEP,'bWires'),                          oImpoExpoSTEP.invoke('Wires',                         impoExpoSTEP.bWires);                              end
if isfield(impoExpoSTEP,'bSolidWiresAsSolids'),             oImpoExpoSTEP.invoke('SolidWiresAsSolids',            impoExpoSTEP.bSolidWiresAsSolids);                 end
if isfield(impoExpoSTEP,'importExport')
    if strcmp(lower(impoExpoSTEP.importExport),'read'), oImpoExpoSTEP.invoke('Read');     end
    if strcmp(lower(impoExpoSTEP.importExport),'write'), oImpoExpoSTEP.invoke('WriteAll'); end
end

end
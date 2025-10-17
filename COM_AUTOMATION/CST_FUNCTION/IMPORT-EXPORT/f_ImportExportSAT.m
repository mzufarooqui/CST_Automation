function f_ImportExportSAT(oMWS,impoExpoSAT)
%% DEFINE IMPORT/EXPORT SAT

%% FIELD DEFINATION
%
%  fileName ( filename filename )
%     Sets the name of the imported file.
%  id ( int id )
%     A CAD file may be imported more than once into the same project with different settings of import options. In order to improve the performance of structure rebuilds, an intermediate sat file is stored during the import process which allows to quickly re-read the data during rebuilds in case that the original CAD file has not been modified. The naming convention of the intermediate sat file has to be unique for each individual import step. Therefore, in case that the same file is imported more than once or a file with the same name is imported into the project, the Id setting needs to be increased. The Id will then be incorporated into the file name which ensures unique file names for every import.
%  version ( double version )
%     Sets the version of the import filter, since the behaviour of the import may slightly change from version to version. This setting is available for backward compatibility reasons and should ensure that later versions of the import can exactly reproduce the behaviour of earlier versions. The most recent version of the import is 9.0.
%  subProjectName2D ( filename filename )
%     The SAT import is also used for the import of sub-projects. This function sets the name of the 2D sub-project including the path.
%  subProjectName3D ( filename filename )
%     The SAT import is also used for the import of sub-projects. This function sets the name of the 3D sub-project including the path.
%  subProjectScaleFactor ( double factor )
%     Defines the scale factor of the sub-project. ( 1.0 means m, 0.1 means dm, 0.01 means cm, ... )
%  bScaleToUnit ( bool switch )
%     If set to True the imported model is scaled to the currently active unit. If not activated the import feature uses the source units. In such a case, no scaling occurs.
%  bImportToActiveCoordinateSystem ( bool switch )
%     Import the CAD data relative to the active coordinate system.
%  bCurves ( bool  switch )
%     Identifies if curves should be imported as curves or as solids.
%  bWires ( bool  switch )
%     Identifies if thin and solid wires should be imported.  At the moment only used for sub-project import.
%  bSolidWiresAsSolids ( bool  switch )
%     Identifies if solid wires should be imported as wires or as solids. At the moment only used for sub-project import, to be backward compatible to older projects.
%  read
%     Starts the actual import of the file.
%  writeAll
%     Exports all data.
%% EXAMPLE:
%    *For Import:*
%    impoExpoSAT.fileName     = [pwd '\TEMP\example.sat'];
%    impoExpoSAT.version      = '21.0';
%    impoExpoSAT.importExport = 'import';
%    f_ImportExportSAT(oMWS,impoExpoSAT);
%
%    *For Export:*
%    impoExpoSAT.fileName     = [pwd '\TEMP\example.sat'];
%    impoExpoSAT.version      = '21.0';
%    impoExpoSAT.saveVersion  = '21.0';
%    impoExpoSAT.importExport = 'export';
%    f_ImportExportSAT(oMWS,impoExpoSAT);

%    *For Export: Part only*
% if EXPORT_EACH_LAYER_SEPERATELY
%     for pInd = 1:39
%         oMWS.invoke('SelectTreeItem',['Components\Vacuum\P_' num2str(pInd)]); % This line is not necessary
%         impoExpoSAT.fileName     = ['D:\CNR\G Addamo\Corrugated Horn\SAT FILES\SAT File For Each Plate\P_' num2str(pInd) '.sat'];
%         impoExpoSAT.version      = '21.0';
%         impoExpoSAT.saveVersion  = '21.0';
%         impoExpoSAT.importExport = 'exportPart';
%         impoExpoSAT.exportPartName = [satComponentName ':P_' num2str(pInd)];                                
%         f_ImportExportSAT(oMWS,impoExpoSAT);
%     end
% end
%% MATLAB SCRIPT
oImpoExpoSAT = oMWS.invoke('SAT');
oImpoExpoSAT.invoke('Reset');
if isfield(impoExpoSAT,'fileName'),                        oImpoExpoSAT.invoke('FileName',                      impoExpoSAT.fileName);                            end
if isfield(impoExpoSAT,'id'),                              oImpoExpoSAT.invoke('Id',                            impoExpoSAT.id);                                  end
if isfield(impoExpoSAT,'version'),                         oImpoExpoSAT.invoke('Version',                       impoExpoSAT.version);                             end
if isfield(impoExpoSAT,'saveVersion'),                     oImpoExpoSAT.invoke('SaveVersion',                   impoExpoSAT.saveVersion);                         end
if isfield(impoExpoSAT,'subProjectName2D'),                oImpoExpoSAT.invoke('SubProjectName2D',              impoExpoSAT.subProjectName2D);                    end
if isfield(impoExpoSAT,'subProjectName3D'),                oImpoExpoSAT.invoke('SubProjectName3D',              impoExpoSAT.subProjectName3D);                    end
if isfield(impoExpoSAT,'subProjectScaleFactor'),           oImpoExpoSAT.invoke('SubProjectScaleFactor',         impoExpoSAT.subProjectScaleFactor);               end
if isfield(impoExpoSAT,'bScaleToUnit'),                    oImpoExpoSAT.invoke('ScaleToUnit',                   impoExpoSAT.bScaleToUnit);                        end
if isfield(impoExpoSAT,'bImportToActiveCoordinateSystem'), oImpoExpoSAT.invoke('ImportToActiveCoordinateSystem',impoExpoSAT.bImportToActiveCoordinateSystem);     end
if isfield(impoExpoSAT,'bCurves'),                         oImpoExpoSAT.invoke('Curves',                        impoExpoSAT.bCurves);                             end
if isfield(impoExpoSAT,'bWires'),                          oImpoExpoSAT.invoke('Wires',                         impoExpoSAT.bWires);                              end
if isfield(impoExpoSAT,'bSolidWiresAsSolids'),             oImpoExpoSAT.invoke('SolidWiresAsSolids',            impoExpoSAT.bSolidWiresAsSolids);                 end
if isfield(impoExpoSAT,'importExport')
    if strcmp(lower(impoExpoSAT.importExport),'import'), oImpoExpoSAT.invoke('Read');     end
    if strcmp(lower(impoExpoSAT.importExport),'export'), oImpoExpoSAT.invoke('WriteAll'); end
    if strcmp((impoExpoSAT.importExport),'exportPart'),  oImpoExpoSAT.invoke('Write',impoExpoSAT.exportPartName); end    
end

end
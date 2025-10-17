function status = f_CreateFarfieldSource(oMWS,oFFS)
%% EXAMPLE
% oFFS.name                 = 'delta';
% oFFS.setPosition          = {'0','0','focus+pc'};
% oFFS.setPhi0XYZ           = {'0','0','-1'};
% oFFS.setTheta0XYZ         = {'1','0','0'};
% oFFS.import               = [pwd '\dataFiles\farfield (f=2.4) [delta]_dy=140_source.txt'];
% oFFS.bUseCopyOnly         = 'true';
% oFFS.bUseMultipoleFFS     = 'ture';
% oFFS.setAlignmentType     = 'user';
% oFFS.setMultipoleCalcMode = 'automatic';
%% MATLAB SCRIPT
oFarfieldSource = invoke(oMWS,'FarfieldSource');
oFFS.id = invoke(oFarfieldSource,'GetNextId');
historyStr = [];
historyStr = sprintf('With FARFIELDSOURCE');
historyStr = sprintf('%s\n\t.Reset',             historyStr);
if isfield(oFFS,'name'),                         historyStr = sprintf('%s\n\t.Name "%s"',                  historyStr,oFFS.name);end
if isfield(oFFS,'id'),                           historyStr = sprintf('%s\n\t.Id "%s"',                    historyStr,num2str(oFFS.id));end
if isfield(oFFS,'bUseCopyOnly'),                 historyStr = sprintf('%s\n\t.UseCopyOnly "%s"',           historyStr,oFFS.bUseCopyOnly);end
if isfield(oFFS,'setPosition'),                  historyStr = sprintf('%s\n\t.SetPosition "%s","%s","%s"', historyStr,oFFS.setPosition{1},oFFS.setPosition{2},oFFS.setPosition{3});end
if isfield(oFFS,'setTheta0XYZ'),                 historyStr = sprintf('%s\n\t.SetTheta0XYZ "%s","%s","%s"',historyStr,oFFS.setTheta0XYZ{1},oFFS.setTheta0XYZ{2},oFFS.setTheta0XYZ{3});end
if isfield(oFFS,'setPhi0XYZ'),                   historyStr = sprintf('%s\n\t.SetPhi0XYZ "%s","%s","%s"',  historyStr,oFFS.setPhi0XYZ{1},oFFS.setPhi0XYZ{2},oFFS.setPhi0XYZ{3});end
if isfield(oFFS,'import'),                       historyStr = sprintf('%s\n\t.Import "%s"',                historyStr,oFFS.import);end
if isfield(oFFS,'bUseMultipoleFFS'),            historyStr = sprintf('%s\n\t.UseMultipoleFFS "%s"',      historyStr,oFFS.bUseMultipoleFFS);end
if isfield(oFFS,'setAlignmentType'),            historyStr = sprintf('%s\n\t.SetAlignmentType "%s"',     historyStr,oFFS.setAlignmentType);end
if isfield(oFFS,'setMultipoleDegree'),          historyStr = sprintf('%s\n\t.SetMultipoleDegree "%s"',    historyStr,num2str(oFFS.setMultipoleDegree));end
if isfield(oFFS,'setMultipoleCalcMode'),        historyStr = sprintf('%s\n\t.SetMultipoleCalcMode "%s"',  historyStr,oFFS.setMultipoleCalcMode);end

historyStr = sprintf('%s\n\t.Store',         historyStr);
historyStr = sprintf('%s\nEnd With',        historyStr);
historyHeader = [ 'define farfield source: ' oFFS.name ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end

function [freq sRequested] = f_ReportSetup_HFSS(oProject,setupName,sweepName,plotNum,sParam)
% oModule.CreateReport( [ 'XY Plot ' num2str(plotNum)], 'Modal Solution Data', 'Rectangular Plot',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}, 'wgR:=', {'Nominal'}, 'wgAS1:=', {'Nominal'}, 'wgS1:=', {'Nominal'}, 'wgAS2:=', {'Nominal'}, 'wgS2:=', {'Nominal'}, 'Lsk:=', {'Nominal'}, 'Lk:=', {'Nominal'}, 'lIN1:=', {'Nominal'}, 'lIN2:=', {'Nominal'}, 'fMin:=', { 'Nominal'}, 'fMax:=', {'Nominal'}}, {'X Component:=', 'Freq', 'Y Component:=', {[ 'dB(' sParam ')' ]}}, {});
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oModule = oDesign.GetModule('ReportSetup');
%-- Get Real Val
% oModule.CreateReport( [ 'XY Plot ' num2str(plotNum)], 'Modal Solution Data', 'Rectangular Plot',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}, 'wgR:=', {'Nominal'}, 'wgAS1:=', {'Nominal'}, 'wgS1:=', {'Nominal'}, 'wgAS2:=', {'Nominal'}, 'wgS2:=', {'Nominal'}, 'Lsk:=', {'Nominal'}, 'Lk:=', {'Nominal'}, 'lIN1:=', {'Nominal'}, 'lIN2:=', {'Nominal'}, 'fMin:=', { 'Nominal'}, 'fMax:=', {'Nominal'}}, {'X Component:=', 'Freq', 'Y Component:=', {[ 're(' sParam ')' ]}}, {});
oModule.CreateReport( [ 'XY Plot ' num2str(plotNum)], 'Modal Solution Data', 'Rectangular Plot',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}}, {'X Component:=', 'Freq', 'Y Component:=', {[ 're(' sParam ')' ]}}, {});
fileNameWithPath = [ pwd '\sParameterRe.csv'];
oModule.ExportToFile ([ 'XY Plot ' num2str(plotNum)], fileNameWithPath)
sParameter = importdata(fileNameWithPath);
sParameter.data;
sParameter.textdata{:};
freq         = sParameter.data(:,1);
sRequestedRe = sParameter.data(:,2);

%-- Get Imag Val
% oModule.CreateReport( [ 'XY Plot ' num2str(plotNum+1)], 'Modal Solution Data', 'Rectangular Plot',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}, 'wgR:=', {'Nominal'}, 'wgAS1:=', {'Nominal'}, 'wgS1:=', {'Nominal'}, 'wgAS2:=', {'Nominal'}, 'wgS2:=', {'Nominal'}, 'Lsk:=', {'Nominal'}, 'Lk:=', {'Nominal'}, 'lIN1:=', {'Nominal'}, 'lIN2:=', {'Nominal'}, 'fMin:=', { 'Nominal'}, 'fMax:=', {'Nominal'}}, {'X Component:=', 'Freq', 'Y Component:=', {[ 'im(' sParam ')' ]}}, {});
oModule.CreateReport( [ 'XY Plot ' num2str(plotNum+1)], 'Modal Solution Data', 'Rectangular Plot',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}}, {'X Component:=', 'Freq', 'Y Component:=', {[ 'im(' sParam ')' ]}}, {});
fileNameWithPath = [ pwd '\sParameterIm.csv'];
oModule.ExportToFile ([ 'XY Plot ' num2str(plotNum+1)], fileNameWithPath)
sParameter = importdata(fileNameWithPath);
sParameter.data;
sParameter.textdata{:};
freq         = sParameter.data(:,1);
sRequestedIm = sParameter.data(:,2);

%-- Make s Parameter
sRequested = complex(sRequestedRe,sRequestedIm);

%-- Delete Real and Imag Plot
oModule.DeleteReports({[ 'XY Plot ' num2str(plotNum)]})
oModule.DeleteReports({[ 'XY Plot ' num2str(plotNum+1)]})

%-- Plot S parameter in dB
% oModule.CreateReport( [ 'XY Plot ' num2str(plotNum)], 'Modal Solution Data', 'Rectangular Plot',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}, 'wgR:=', {'Nominal'}, 'wgAS1:=', {'Nominal'}, 'wgS1:=', {'Nominal'}, 'wgAS2:=', {'Nominal'}, 'wgS2:=', {'Nominal'}, 'Lsk:=', {'Nominal'}, 'Lk:=', {'Nominal'}, 'lIN1:=', {'Nominal'}, 'lIN2:=', {'Nominal'}, 'fMin:=', { 'Nominal'}, 'fMax:=', {'Nominal'}}, {'X Component:=', 'Freq', 'Y Component:=', {[ 'dB(' sParam ')' ]}}, {});
oModule.CreateReport( [ 'XY Plot ' num2str(plotNum)], 'Modal Solution Data', 'Rectangular Plot',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}}, {'X Component:=', 'Freq', 'Y Component:=', {[ 'dB(' sParam ')' ]}}, {});

oModule.CreateReport( [ 'Smith Chart ' num2str(plotNum)], 'Modal Solution Data', 'Smith Chart',[ setupName ' : ' sweepName ], {'Domain:=', 'Sweep'}, {'Freq:=', {'All'}}, {'Polar Component:=', {[ sParam ]}}, {});                                                                                                                                                                        
end
function f_ExportFile(oDesign,plotName,fileName)
% f_ExportFile(oDesign,'3D AxialRatio',[ pwd '\sumP9At2p3.csv'])
oModule = oDesign.GetModule('ReportSetup');
oModule.ExportToFile(plotName,fileName);
end
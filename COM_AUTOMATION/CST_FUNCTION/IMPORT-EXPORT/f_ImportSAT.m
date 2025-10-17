function status = f_ImportSAT(oMWS,fileNameWithPath)
slashInd = strfind(fileNameWithPath,'\');
fileName = fileNameWithPath(slashInd(end)+1:end);
satImport.id           = '1';
satImport.version      = '9.0';
satImport.scale        = '0';
satImport.bImportCoord = 'True';
satImport.bCurve       = 'True';

historyStr = [];
historyStr = sprintf('With SAT');
historyStr = sprintf('%s\n\t.Reset',historyStr); 
historyStr = sprintf('%s\n\t.FileName "%s"',historyStr,fileNameWithPath);
historyStr = sprintf('%s\n\t.Id "%s"',historyStr,num2str(satImport.id));
historyStr = sprintf('%s\n\t.Version "%s"',historyStr,num2str(satImport.version));
historyStr = sprintf('%s\n\t.ScaleToUnit "%s"',historyStr,num2str(satImport.scale));
historyStr = sprintf('%s\n\t.ImportToActiveCoordinateSystem "%s"',historyStr,satImport.bImportCoord);
historyStr = sprintf('%s\n\t.Curves "%s"',historyStr,satImport.bCurve);
historyStr = sprintf('%s\n\t.Read',historyStr); 
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'import sat/sab file:' fileNameWithPath];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end

% historyStr = [];
% historyStr = sprintf('With SAT');
% historyStr = sprintf('%s\n\t.Reset',historyStr); 
% historyStr = sprintf('%s\n\t.FileName "*model.sat"',historyStr); 
% historyStr = sprintf('%s\n\t.Id "1"',historyStr); 
% historyStr = sprintf('%s\n\t.Version "9.0"',historyStr); 
% historyStr = sprintf('%s\n\t.ScaleToUnit "0"',historyStr); 
% historyStr = sprintf('%s\n\t.ImportToActiveCoordinateSystem "True"',historyStr); 
% historyStr = sprintf('%s\n\t.Curves "True"',historyStr); 
% historyStr = sprintf('%s\n\t.Read',historyStr); 
% historyStr = sprintf('%s\nEnd With',historyStr);
% historyHeader = [ 'import sat/sab file:' fileNameWithPath];
% status = oMWS.invoke('AddToHistory',historyHeader,historyStr);

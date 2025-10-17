function f_ExportScatMatTextFormat(oMWS,exportFilePath,fileName,portNum,plotView)
% I have to make this function more general, like farfield monitor function
% plotView could be 'polar', 'smith', 'smithy', 'magnitude', 'magnitudedb', 'real', 'imaginary', 'phase'
oASCIIExport = oMWS.invoke('ASCIIExport');
oResultTree  = oMWS.invoke('ResultTree');
oMWS.invoke('SelectTreeItem','1D Results\S-Parameters');
% firstChildName = oResultTree.invoke('GetFirstChildName','1D Results\S-Parameters');
oMWS.invoke('SelectTreeItem',['1D Results\S-Parameters\S' num2str(portNum) ',' num2str(portNum)]);
oPlot1D = invoke(oMWS,'Plot1D');
oPlot1D.invoke('PlotView',plotView);
oPlot1D.invoke('Plot');
oASCIIExport.invoke('Reset');
oASCIIExport.invoke('FileName',[ exportFilePath '\' fileName]);
oASCIIExport.invoke('Execute');
end


% % function f_ExportScatMatTextFormat(oMWS,exportFilePathWithName,fileName,plotView)
% % % I have to make this function more general, like farfield monitor function
% % % plotView could be 'polar', 'smith', 'smithy', 'magnitude', 'magnitudedb', 'real', 'imaginary', 'phase'
% % oASCIIExport = oMWS.invoke('ASCIIExport');
% % oResultTree  = oMWS.invoke('ResultTree');
% % oMWS.invoke('SelectTreeItem','1D Results\S-Parameters');
% % farFieldChildName = oResultTree.invoke('GetFirstChildName','1D Results\S-Parameters');
% % oMWS.invoke('SelectTreeItem',farFieldChildName);
% % oPlot1D = invoke(oMWS,'Plot1D');
% % oPlot1D.invoke('PlotView',plotView);
% % % curveInd = oPlot1D.invoke('GetCurveIndexOfCurveLabel','S1,1');
% % % oPlot1D.invoke('SetLineStyle',curveInd,'dashed',8); % thick dashed line
% % % oPlot1D.invoke('SetLineColor',curveInd,255,255,0);  % yellow
% % oPlot1D.invoke('Plot');
% % sMatElem = farFieldChildName(25:end);
% % sMatElem = strrep(sMatElem,',','_');
% % oASCIIExport.invoke('Reset');
% % oASCIIExport.invoke('FileName',[ exportFilePathWithName '/ScattMat_' sMatElem '.txt']);
% % oASCIIExport.invoke('Execute');
% % end
function status = f_CoverCurveFromFace(oMWS,faceName,curveName)
% This fucntion make a face from the curve
% EXAMPLE:
% status = f_CoverCurveFromFace(oMWS,faceName,curveName)
% status = f_CoverCurveFromFace(oMWS,'face1','curve1')

historyStr = [];
historyStr = sprintf('With Face');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,faceName);
historyStr = sprintf('%s\n\t.Type "CoverCurve"',historyStr);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveName);
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define facefromcovercurve: ' faceName];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end

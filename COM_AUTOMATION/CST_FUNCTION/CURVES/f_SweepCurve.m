function status = f_SweepCurve(oMWS,componentName,name,material,twistAngle,taperAngle,bPrjProf,bDelProf,bDelPath,pathStr,curveStr)
%-- example
% f_SweepCurve(oMWS,'component1','solid2','Vacuum','0','0','True','True','True','curve1:circle1','curve1:circle2')

historyStr = [];
historyStr = sprintf('With SweepCurve');
historyStr = sprintf('%s\n\t.Reset',historyStr);
historyStr = sprintf('%s\n\t.Name "%s"',historyStr,name);
historyStr = sprintf('%s\n\t.Component "%s"',historyStr,componentName);
historyStr = sprintf('%s\n\t.Material "%s"',historyStr,material);
historyStr = sprintf('%s\n\t.Twistangle "%s"',historyStr,twistAngle);
historyStr = sprintf('%s\n\t.Taperangle "%s"',historyStr,taperAngle);
historyStr = sprintf('%s\n\t.ProjectProfileToPathAdvanced "%s"',historyStr,bPrjProf);
historyStr = sprintf('%s\n\t.DeleteProfile "%s"',historyStr,bDelProf);
historyStr = sprintf('%s\n\t.DeletePath "%s"',historyStr,bDelPath);
historyStr = sprintf('%s\n\t.Path "%s"',historyStr,pathStr);
historyStr = sprintf('%s\n\t.Curve "%s"',historyStr,curveStr);
historyStr = sprintf('%s\n\t.Create',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define sweepprofile: ' name ':' componentName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
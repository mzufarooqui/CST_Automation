function status = f_IntersectSolids(oMWS,component1,solid1,component2,solid2)
% EXAMPLE
% status = f_IntersectSolids(oMWS,component1,solid1,component2,solid2)
% status = f_IntersectSolids(oMWS,'component1','solid1','component2','solid2')

solid1Name = [component1 ':' solid1];
solid2Name = [component2 ':' solid2];

historyStr = [];
historyStr = sprintf('With Solid');
historyStr = sprintf('%s\n\t.Version 9',historyStr);
historyStr = sprintf('%s\n\t.Intersect "%s", "%s"',historyStr,solid1Name,solid2Name);
historyStr = sprintf('%s\n\t.Version 1',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'boolean intersect shapes: ' solid1Name ':' solid2Name];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
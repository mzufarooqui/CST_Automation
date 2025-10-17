function status = f_BooleanOperationOnSolids(oMWS,boolOperation,component1,solid1,component2,solid2)
% Operation: 
% 1 - Add
% 2 - Insert
% 3 - Intersect
% 4 - Subtract
% EXAMPLE
% status = f_BooleanOperationOnSolids(oMWS,boolOperation,component1,solid1,component2,solid2)
% status = f_BooleanOperationOnSolids(oMWS,'Add','component1','solid1','component2','solid2')

solid1Name = [component1 ':' solid1];
solid2Name = [component2 ':' solid2];

historyStr = [];
historyStr = sprintf('With Solid');
historyStr = sprintf('%s\n\t.Version 9',historyStr);
historyStr = sprintf('%s\n\t.%s "%s", "%s"',historyStr,boolOperation,solid1Name,solid2Name);
historyStr = sprintf('%s\n\t.Version 1',historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'boolean ' lower(boolOperation) ' shapes: ' solid1Name ':' solid2Name];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
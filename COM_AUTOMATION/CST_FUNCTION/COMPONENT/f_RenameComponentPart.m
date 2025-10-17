function status = f_RenameComponentPart(oMWS,component,oldName,newName)
% EXAMPLE
% status = f_RenameComponentPart(oMWS,component,oldName,newName)
% status = f_RenameComponentPart(oMWS,'component1','stub1_1','stub2')
fullShapeName = [ component ':' oldName ];
historyStr = sprintf('Solid.Rename "%s", "%s"',fullShapeName,newName);
historyHeader = [ 'rename component: ' fullShapeName ' to: ' component ':' newName];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
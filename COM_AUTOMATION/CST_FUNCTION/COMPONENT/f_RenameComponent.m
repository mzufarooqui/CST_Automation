function status = f_RenameComponent(oMWS,oldName,newName)
% rename component
% EXAMPLE
% status = f_RenameComponent(oMWS,oldName,newName)
% status = f_RenameComponent(oMWS,'component1','component5')
historyStr = sprintf('Component.Rename "%s", "%s"',oldName,newName);
historyHeader = [ 'rename component: ' oldName ' to: ' newName];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
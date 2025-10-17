function status = f_DeleteComponent(oMWS,name)
% Delete component.
% EXAMPLE
% status = f_DeleteComponent(oMWS,name)
% status = f_DeleteComponent(oMWS,'component1')
historyStr = sprintf('Component.Delete "%s"',name);
historyHeader = [ 'delete component: ' name];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
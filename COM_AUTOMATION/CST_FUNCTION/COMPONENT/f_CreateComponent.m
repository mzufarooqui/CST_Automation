function status = f_CreateComponent(oMWS,name)
%% CREATES A NEW COMPONENT WITH THE GIVEN NAME
%% DEFINATION
%  name
%          component name
%% EXAMPLE:
% status = f_CreateComponent(oMWS,name)
% status = f_CreateComponent(oMWS,'component1')
%% MATLAB SCRIPT
historyStr = sprintf('Component.New "%s"',name);
historyHeader = [ 'new component: ' name];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
function status = f_ChangeComponent(oMWS,oldComponent,newComponent,partName)
%% MOVE COMPONENT PART FROM ONE COMPONENT TO THE OTHERONE
% # oldComponent
% # newComponent
% # partName
%% DEFINATION
%  oldComponent
%          Old component name
%  newComponent
%          New component name
%  partName
%          part name which will move from old component to the new component

%% EXAMPLE:
% status = f_ChangeComponent(oMWS,oldComponent,newComponent,partName)
% status = f_ChangeComponent(oMWS,'component1','component2','brickX')
%% MATLAB SCRIPT
historyStr = sprintf('Solid.ChangeComponent "%s:%s", "%s"',oldComponent,partName,newComponent); 
historyHeader = [ 'change component: ' oldComponent ':' partName ' to: ' newComponent  ':' partName ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end


function f_ChangeProperty(oProject,itemList)
oDesign = oProject.SetActiveDesign('HFSSDesign1');
oEditor = oDesign.SetActiveEditor('3D Modeler');
for ind = 1:length(itemList)
    invoke(oEditor,'ChangeProperty',{'NAME:AllTabs', {'NAME:Geometry3DAttributeTab', {'NAME:PropServers',itemList{ind}}, ...
        {'NAME:ChangedProps', {'NAME:Solve Inside', 'Value:=', 'false'}}}});
end
end
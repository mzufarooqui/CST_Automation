function status = f_UnhideComponent(oMWS,componentName,material)
oResultTree  = oMWS.invoke('ResultTree');
oMWS.invoke('SelectTreeItem',[ 'Components\' componentName ]);

childFullName = oResultTree.invoke('GetFirstChildName',[ 'Components\' componentName ]);
while~isempty(childFullName)
    childName = f_GetName(childFullName);
    oMWS.invoke('SelectTreeItem',childFullName);
    f_ChangeMaterial(oMWS,componentName,childName,material);
    childFullName = oResultTree.invoke('GetNextItemName',childFullName);    
end
oMWS.invoke('SelectTreeItem','Components'); % Select the Component tree and exit
end
%-------------------------------------------------------------------------
% FUNCTION
%-------------------------------------------------------------------------
function childName = f_GetName(totName)
ind = findstr(totName,'\');
childName = totName(ind(end)+1:end);
end
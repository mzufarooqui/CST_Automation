function status = f_HideComponent(oMWS,componentName)
hiddenMat = 'temp';
oMaterial.name                  = hiddenMat;
oMaterial.transparency          = 100;
oMaterial.colour                = [1 1 1];
oMaterial.bTransparentoutline   = false;
if ~f_IsMaterialExist(oMWS,hiddenMat) % If this material didn't createed then create it
    f_CreateMaterial(oMWS,oMaterial);
end

oResultTree  = oMWS.invoke('ResultTree');
oMWS.invoke('SelectTreeItem',[ 'Components\' componentName ]);

childFullName = oResultTree.invoke('GetFirstChildName',[ 'Components\' componentName ]);
while~isempty(childFullName)
    childName = f_GetName(childFullName);
    oMWS.invoke('SelectTreeItem',childFullName);
    f_ChangeMaterial(oMWS,componentName,childName,hiddenMat);
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
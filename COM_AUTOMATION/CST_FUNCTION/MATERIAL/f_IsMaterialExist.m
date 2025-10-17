function status = f_IsMaterialExist(oMWS,materialName)
status = 0;
oResultTree  = oMWS.invoke('ResultTree');
childName = oResultTree.invoke('GetFirstChildName','Materials');
while~isempty(childName)
    [temp treeMaterialName] = strtok(childName,'\');
    treeMaterialName = treeMaterialName(2:end);
    if strcmp(treeMaterialName,materialName)
        status = 1;
        break; % match fount, exit from the function
    end
    oMWS.invoke('SelectTreeItem',childName);
    childName = oResultTree.invoke('GetNextItemName',childName);
end
oMWS.invoke('SelectTreeItem','Components'); % Select the Component tree and exit
end
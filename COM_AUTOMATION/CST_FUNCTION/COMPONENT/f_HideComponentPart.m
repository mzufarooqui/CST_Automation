function status = f_HideComponentPart(oMWS,componentName,partName)
hiddenMat = 'temp';
oMaterial.name                  = hiddenMat;
oMaterial.transparency          = 100;
oMaterial.colour                = [1 1 1];
oMaterial.bTransparentoutline   = false;
if ~f_IsMaterialExist(oMWS,hiddenMat) % If this material didn't createed then create it
    f_CreateMaterial(oMWS,oMaterial);
end

status = f_ChangeMaterial(oMWS,componentName,partName,hiddenMat);

end
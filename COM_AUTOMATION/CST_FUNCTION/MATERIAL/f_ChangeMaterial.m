function status = f_ChangeMaterial(oMWS,componentName,shapeName,materialName)
% Change the material
% EXAMPLE:
% status = f_ChangeMaterial(oMWS,componentName,shapeName,materialName)
% f_ChangeMaterial(oMWS,'component1','antenna','PEC')


if isempty(componentName)
    fullShapeName = shapeName;
else
    fullShapeName = [ componentName ':' shapeName ];
end
historyStr = sprintf('Solid.ChangeMaterial "%s", "%s" ',fullShapeName,materialName);
historyHeader = [ 'change material: ' fullShapeName ' to: ' materialName];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
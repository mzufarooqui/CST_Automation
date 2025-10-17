function status = f_PickFaceFromId(oMWS,componentName,shapeName,id)
% Picks a face of a solid.  The face is specified by the solid that it belongs to and an identity number.
% componentName = 'component1'
% shapeName     = 'brick1'
% id            = 1
% EXAMPLE:
% status = f_PickFaceFromId(oMWS,componentName,shapeName,id)
% status = f_PickFaceFromId(oMWS,'component1','brick1',2)
% status = f_PickFaceFromId(oMWS,'component1','brick1',1)
if isempty(componentName)
    fullShapeName = shapeName;
else
    fullShapeName = [ componentName ':' shapeName ];
end
historyStr = sprintf('Pick.PickFaceFromId "%s", "%s" ',fullShapeName,num2str(id));
historyHeader = [ 'pick face'];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
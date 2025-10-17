function status = f_PickFaceChainFromId(oMWS,componentName,solidName,faceId)
% Picks a face chain (a set of connected faces) of a solid. The face chain is specified by the solid that it belongs to and an identity number.
% EXAMPLE
% status = f_PickFaceChainFromId(oMWS,componentName,solidName,faceId)
% status = f_PickFaceChainFromId(oMWS,'component1','solid1',1)
historyStr = sprintf('Pick.PickFaceChainFromId "%s:%s", "%s"',componentName,solidName,num2str(faceId));
historyHeader = [ 'pick face chain' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
function status = f_PickEndpointFromId(oMWS,componentName,solidName,faceId)
historyStr = sprintf('Pick.PickEndpointFromId "%s:%s", "%s"',componentName,solidName,num2str(faceId));
historyHeader = [ 'pick end point' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
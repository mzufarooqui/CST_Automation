function status = f_PickCenterpointFromId(oMWS,componentName,solidName,faceId)
historyStr = sprintf('Pick.PickCenterpointFromId "%s:%s", "%s"',componentName,solidName,num2str(faceId));
historyHeader = [ 'pick center point' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
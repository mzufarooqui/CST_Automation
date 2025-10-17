function status = f_PickCirclecenterFromId(oMWS,componentName,solidName,faceId)
historyStr = sprintf('Pick.PickCirclecenterFromId "%s:%s", "%s"',componentName,solidName,num2str(faceId));
historyHeader = [ 'pick circle center point' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
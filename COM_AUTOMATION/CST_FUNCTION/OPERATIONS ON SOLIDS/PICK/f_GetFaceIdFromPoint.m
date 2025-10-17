function status = f_GetFaceIdFromPoint ( string shapename, double x, double y, double z ) long
%Returns the face id at a given point for one shape.
historyStr = sprintf('---- "%s:%s", "%s"',componentName,solidName,--);
historyHeader = [ '--' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr); 
end
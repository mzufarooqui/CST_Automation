function status = f_GetNumberOfPickedFaces  int
% Returns the total number of picked faces.
historyStr = sprintf('---- "%s:%s", "%s"',componentName,solidName,--);
historyHeader = [ '--' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr); 
end
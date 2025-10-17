function status = f_GetNumberOfPickedEdges  int
% Returns the total number of picked edges.
historyStr = sprintf('---- "%s:%s", "%s"',componentName,solidName,--);
historyHeader = [ '--' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr); 
end
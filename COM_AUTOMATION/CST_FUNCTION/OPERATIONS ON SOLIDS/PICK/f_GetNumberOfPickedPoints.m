function status = f_GetNumberOfPickedPoints  int
% Returns the total number of picked points.
historyStr = sprintf('---- "%s:%s", "%s"',componentName,solidName,--);
historyHeader = [ '--' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
function status = f_AlignWCSWithGlobalCoordinates(oMWS)
% The position of the WCS will be changed to the position of the Global Coordinate System. In other words, a reset of the WCS into its origin position.

historyStr    = sprintf('WCS.AlignWCSWithGlobalCoordinates');
historyHeader = [ 'align wcs with global coordinates'];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
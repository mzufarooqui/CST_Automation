function status = f_AlignWCSWithVW_Plane(oMWS)
% Align WCS with YZ Plane
historyStr    = sprintf('WCS.RotateWCS "v", "90"');
historyStr    = sprintf('%s\nWCS.RotateWCS "w", "90"',historyStr);
historyHeader = [ 'align wcs with local plane' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
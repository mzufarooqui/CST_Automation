function status = f_AlignWCSWithUW_Plane(oMWS)
% Align WCS with YZ Plane
historyStr    = sprintf('WCS.RotateWCS "u", "-90"');
historyStr    = sprintf('%s\nWCS.RotateWCS "w", "-90"',historyStr);
historyHeader = [ 'align wcs with local plane' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end


function status = f_AlignWCSWithXY_Plane(oMWS)
% Align WCS with XY Plane
historyStr    = sprintf('WCS.SetNormal "0", "0", "1"');
historyStr    = sprintf('%s\nWCS.SetUVector "1", "0", "0"',historyStr);
historyHeader = [ 'align wcs with global plane' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
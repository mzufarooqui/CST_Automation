function status = f_AlignWCSWithXZ_Plane(oMWS)
% Align WCS with XZ Plane
historyStr    = sprintf('WCS.SetNormal "0", "1", "0"');
historyStr    = sprintf('%s\nWCS.SetUVector "0", "0", "1"',historyStr);
historyHeader = [ 'align wcs with global plane' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
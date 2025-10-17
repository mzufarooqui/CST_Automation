function status = f_AlignWCSWithYZ_Plane(oMWS)
% Align WCS with YZ Plane
historyStr    = sprintf('WCS.SetNormal "1", "0", "0"');
historyStr    = sprintf('%s\nWCS.SetUVector "0", "1", "0"',historyStr);
historyHeader = [ 'align wcs with global plane' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
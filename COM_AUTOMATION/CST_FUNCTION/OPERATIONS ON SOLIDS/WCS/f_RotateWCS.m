function status = f_RotateWCS(oMWS,rotAxis,angle)
% rotAxis:        Rotation axis: 'u', 'v', 'w'
% angle  :        angle is in degree
% Rotates the axis of the Working Coordinate System clockwise of about the angle degree.
% EXAMPLE:
% status = f_RotateWCS(oMWS,rotAxis,angle)
% status = f_RotateWCS(oMWS,'u',90)
historyStr    = sprintf('WCS.RotateWCS "%s", "%s"',rotAxis,num2str(angle));
historyHeader = [ 'rotate wcs around ' rotAxis ' ' num2str(angle) ' degree' ];
status        = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
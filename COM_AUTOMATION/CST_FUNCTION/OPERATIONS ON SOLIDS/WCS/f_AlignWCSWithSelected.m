function status = f_AlignWCSWithSelected(oMWS,mode)
% Depending on mode does the following:
% 'Point':        Moves the origin of the Working Coordinate System to the coordinates of the selected point.
% '3Points':      Aligns the Working Coordinate System with the plane of the three most recently selected points. The origin is placed at the first selected point, while the u axis is orientated from point No.1 to No.2.
% 'Edge':         Aligns the WCS to the previously picked edge. The u axis will be parallel to the edge. If possible, the w axis will be preserved. If the edge is nonlinear, the direction will be taken from closest point on that edge relative to the current WCS.
% 'EdgeCenter':   This moves the origin of the WCS to the center of the selected edge, the u axis will be aligned onto the edge's direction. If any faces are connected to the selected edge, the w axis of the WCS will be aligned to the normal of one of these faces. If not, the w axis will be preserved as much as possible.
% 'RotationEdge': This mode is used for defining the rotation axis of Rotate Objects. It does the same as the 'Edge' mode but additionally moves the WCS to the start point of the picked edge.
% 'Face':         For selected planar faces, the WCS will be moved to the face center. For all other faces it will be moved to the closest point on the face, relative to the current WCS. After moving, the w axis of the WCS (w axis) will be aligned to the normal of the face in the given point.
% 'EdgeAndFace':  If the selected edge is not directly connected to the selected face, this will do the same as AlignWCSWithSelected 'EdgeCenter'. Else, this will place the WCS origin onto the middle of the selected edge; The u axis will be aligned to the direction of the selected edge in the given point. The w axis will be set to the normal of the selected face in the given point.hWCS = invoke(hMWS,'WCS');
% EXAMPLE:
% status = f_AlignWCSWithSelected(oMWS,mode)
% status = f_AlignWCSWithSelected(oMWS,'Face')

historyStr    = sprintf('WCS.AlignWCSWithSelected "%s"',mode);
historyHeader = [ 'align wcs with e' mode ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
function pickpointCoordinates = f_GetPickpointCoordinates(oMWS,index,x,y,z) ( int index, double_ref x, double_ref y, double_ref z ) bool
% Returns the coordinates of a picked point through the argument list. The picked point is specified by index starting with 1.

x = 15;y = 15;z = 15;
xp = libpointer('doublePtr',x);
yp = libpointer('doublePtr',y);
zp = libpointer('doublePtr',z);
get(xp)
oPick = oMWS.invoke('Pick');
pickpointCoordinates = oPick.invoke('GetPickpointCoordinates',index,xp,yp,zp);
calllib('oPick','GetPickpointCoordinates',index,xp,yp,zp);
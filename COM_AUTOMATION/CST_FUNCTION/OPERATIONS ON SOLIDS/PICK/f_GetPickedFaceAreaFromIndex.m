function pickedFaceAreaFromIndex = f_GetPickedFaceAreaFromIndex (oMWS,index)
% Returns the surface area of a picked face. The picked face is specified by index starting with 1.
oPick = oMWS.invoke('Pick');
pickedFaceAreaFromIndex = oPick.invoke('GetPickedFaceAreaFromIndex',index);
end
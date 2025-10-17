function pickedFaceFromIndex = f_GetPickedFaceFromIndex (oMWS,index,faceid)
% Returns the shapename of a picked face. The face id is returned through the argument list. The picked face is specified by index starting with 1.
oPick = oMWS.invoke('Pick');
pickedFaceFromIndex = oPick.invoke('GetPickedFaceFromIndex',index,faceid);
end
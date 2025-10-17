function status = f_DeleteFace(oMWS,facePart)
% Delete Face.
% EXAMPLE
% status = f_DeleteFace(oMWS,'face')
historyStr = sprintf('Face.Delete "%s"',facePart);
historyHeader = [ 'delete face: ' facePart];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
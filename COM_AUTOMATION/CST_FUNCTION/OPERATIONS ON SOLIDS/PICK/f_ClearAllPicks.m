function status = f_ClearAllPicks(oMWS)
% Clear all pick
% EXAMPLE:
% status = f_ClearAllPicks(oMWS)
historyStr = sprintf('Pick.ClearAllPicks');
historyHeader = [ 'clear picks' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
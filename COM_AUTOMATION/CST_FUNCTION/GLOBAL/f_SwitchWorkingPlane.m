function status = f_SwitchWorkingPlane(oMWS,bFlag)
% EXAMPLE
%status = f_SwitchWorkingPlane(oMWS,'True')
historyStr = sprintf('Plot.DrawWorkplane "%s" ',bFlag);
historyHeader = [ 'switch working plane' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end
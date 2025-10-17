function f_AddMacroInHistory(oMWS,fileName)
hisItemIndex = 1;
historyStr = [];
fid = fopen(fileName,'r');
while 1
    tline = fgetl(fid);
    if strcmp(tline,'Sub Main ()')
        ready = 1;% Ready for the Data
    elseif isempty(tline)
        %leave this line
    elseif strcmp(tline,'End Sub')
        %leave this line
    elseif ~ischar(tline)
        historyList{hisItemIndex-1,:} = historyStr;
        break;%this is the end of the file
    elseif strcmp(tline(1:2),'''@')
        if hisItemIndex == 1
            getHistoryStr = 0;
        else
            getHistoryStr = 1;
        end
        if getHistoryStr == 1
            historyList{hisItemIndex-1,:} = historyStr;
            historyStr = [];
        end
        historyHeader{hisItemIndex,:} = tline(4:end);
        hisItemIndex = hisItemIndex + 1;
    else
        historyStr = sprintf('%s\n%s',historyStr,tline);

    end
end
fclose(fid);

for ind = 1:size(historyHeader,1)
    status = oMWS.invoke('AddToHistory',historyHeader{ind,:},historyList{ind,:});
    % the value of the status variable should be 1
end

end
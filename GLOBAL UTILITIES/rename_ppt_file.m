close all;clear all;clc;
ONLY_LIST = 0;
dirInfo = dir('*.ppt');
% dirInfo = dir('*.pdf');
cnt = 1;
switch ONLY_LIST
    case 0
        for ind = size(dirInfo,1):-1:1
            fprintf(1,'\n%s',dirInfo(ind).name );
        end
    case 1
        for ind = size(dirInfo,1):-1:1
            fprintf(1,'\n%s',dirInfo(ind).name );
            oldName = dirInfo(ind).name;
            newName = [ num2str(cnt) ' - ' dirInfo(ind).name(4:end) ];
            dosCommand = sprintf('rename "%s" "%s"',oldName,newName);
            dos(dosCommand);
            cnt = cnt + 1;
        end
    case 2
        for ind = 1:size(dirInfo,1)
            fprintf(1,'\n%s',dirInfo(ind).name );
            oldName = dirInfo(ind).name;
            newName = [ num2str(cnt) ' - ' dirInfo(ind).name(6:end) ];
            dosCommand = sprintf('rename "%s" "%s"',oldName,newName);
            dos(dosCommand);
            cnt = cnt + 1;
        end
end



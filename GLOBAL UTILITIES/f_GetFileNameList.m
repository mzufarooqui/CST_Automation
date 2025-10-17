function fileCell = f_GetFileNameList(dirPath)
fileCell = {};
dirInfo = dir(dirPath);
for ind =3:length(dirInfo)    
    if dirInfo(ind).isdir
        dirPath1 = [dirPath '\' dirInfo(ind).name ];
        fileCellDir = f_GetFileNameList(dirPath1);
        fileCell = [fileCell, fileCellDir];
    else        
        str = sprintf('%s\\%s',dirPath,dirInfo(ind).name);
        fileCell = [fileCell, str];
    end    
end
end
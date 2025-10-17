close ;
clear ;clc
dirPath = 'D:\temp\Matlab Distributed Computing\SEM_PARALLEL_SCRIPT\ShapedWgSEM';
fileCell = {};
fileCell = f_GetFileNameList(dirPath);

for ind = 1:size(fileCell,2)
    fprintf(1,'\n %d - %s',ind,fileCell{ind})
end
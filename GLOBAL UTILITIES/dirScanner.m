close all;clear all;clc;

functionDirPath = 'D:\CNR\Oscar Peverini\CST\CST MODEL GENERATOR VERSION01\CST MODEL GENERATOR\FUNCTION\SOLVER\TD SOLVER';

dirInfo = dir([functionDirPath '/*.m']);

fprintf(1,'\\begin{enumerate}[(i)]');
for ind = 1:length(dirInfo)
    fileName = dirInfo(ind).name;
    fileName = strrep(fileName,'_','\_');    
    fprintf(1,'\n\\item %s \\\\',fileName);
end
fprintf(1,'\n\\end{enumerate}');
fprintf(1,'\n\n\n\n');
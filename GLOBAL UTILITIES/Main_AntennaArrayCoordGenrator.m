close all;clear all;clc;
nXElem = 8;
nYElem = 4;
xSpacing = 50;
ySpacing = 67;
vX = [0:xSpacing:(nXElem-1)*xSpacing];
vY = [0:ySpacing:(nYElem-1)*ySpacing];
[nXGrid,nYGrid] = meshgrid(vX,vY);
% nXGrid(2:2:end,:) = nXGrid(2:2:end,:)+xSpacing/2;
plot(nXGrid,nYGrid,'o');grid on;axis tight
xlabel('X Eelem. Spacing')
ylabel('Y Eelem. Spacing')

fid = fopen('AntennaArrayCoord.txt',)
fprintf(fid)
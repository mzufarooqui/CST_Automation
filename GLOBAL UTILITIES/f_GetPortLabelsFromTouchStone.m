function [ portLabels totPorts] = f_GetPortLabelsFromTouchStone(fileName)
fid = fopen(fileName,'r');
tLine = fgetl(fid); % Skip line
tLine = fgetl(fid); % Skip line
tLine = fgetl(fid); % Skip line
tLine = fgetl(fid); % Skip line
tLine = fgetl(fid); 
portNum = 1;
while strcmp(tLine(1:7),'! Port ')
    portLabels(portNum) = cell2mat(textscan(tLine,'! Port %d = ""'));
    portNum = portNum + 1;
    tLine = fgetl(fid);
end
fclose(fid);
totPorts = length(portLabels);
end
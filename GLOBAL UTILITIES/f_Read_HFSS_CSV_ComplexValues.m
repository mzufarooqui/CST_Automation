function [xVal,yVal] = f_Read_HFSS_CSV_ComplexValues(fileName)
dataCell = importdata(fileName);

if iscell(dataCell)
    cnt = 1;
    for ind = 1:size(dataCell,1)
        if ind == 1
            continue;
        end
        charData  = cell2mat(dataCell(ind));
        %===================================
        cellChar = strsplit(charData,',');
        numC = str2double(cellChar);
        xVal(cnt) = numC(1);
        yVal(cnt,:) = numC(2:end);
        cnt = cnt + 1;
        %===================================
        %         [thetaDeg1,gainVal1] = strtok(charData,',');
        %         yValTemp  = str2double(gainVal1(2:end));
        %         xVal(cnt) = str2double(thetaDeg1);
        %         yVal(cnt) = yValTemp;
        %         cnt = cnt + 1;
    end
elseif isstruct(dataCell)
    dataCell = importdata(fileName);
    xVal = dataCell.data(:,1);
    yVal = dataCell.data(:,2:end);
end
end

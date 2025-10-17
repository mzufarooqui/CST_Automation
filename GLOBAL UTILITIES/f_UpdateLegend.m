function f_UpdateLegend(legStr,subPlotNum,varargin)
% hLeg      = findobj(gcf,'Type','axes','Tag','legend');
hLeg      = findobj(gcf,'Tag','legend');
if isempty(hLeg) | ( subPlotNum == 2 & numel(hLeg)==1 )
    legend(legStr,'Location',varargin{1})
else
    prvLegStr = get(hLeg,'String');
    prvLegPos = get(hLeg,'Location');
    if size(prvLegStr,1) > 1
%         legStrOut  = [prvLegStr{subPlotNum,1} ,legStr ];

        for legInd = 1:size(prvLegStr,1)
            legStrOut{legInd}  = prvLegStr{legInd};
        end
        legStrOut{legInd+1} = {legStr};                
        
        prvLegPos = prvLegPos{end,1};
    else
        legStrOut  = [prvLegStr ,legStr ];
        prvLegPos = prvLegPos;
    end
    %set(hLeg(subPlotNum),'String',legStrOut,'Location',prvLegPos)
    legend(legStrOut,'Location',prvLegPos);
end
end
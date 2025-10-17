function hdtip = f_AddDatatips(xyData,hPlot )
cursorMode = datacursormode(gcf);
set(cursorMode, 'UpdateFcn',@customDatatipFunction,'DisplayStyle','datatip');

xdata = xyData(1,:);
ydata = xyData(2,:);

%// add the datatip for each event
for idt = 1:size(xyData,2)
    hdtip(idt) = cursorMode.createDatatip(hPlot);
    set(hdtip(idt), 'MarkerSize',5, 'MarkerFaceColor','none', ...
        'MarkerEdgeColor','r', 'Marker','o', 'HitTest','off');
    
    
    %// move it into the right place
    %idx = find( xdata == evt_times(idt) ) ;%// find the index of the corresponding time
%     idx = find( round(xdata,1) == evt_times(idt) );
    pos = [xdata(idt) , ydata(idt) ,1 ];
    %         update(hdtip(idt), pos);
    %         guidata(hdtip(idt),pos)
    set(hdtip(idt),'Position',pos);
end
end
function output_txt = customDatatipFunction(~,evt)
% eventdata = get(evt)
% pos = eventdata.Position

pos = get(evt,'Position');
idx = get(evt,'DataIndex');
% output_txt = { ...
%     '*** !! Event !! ***' , ...
%     ['at Time : '  num2str(pos(1),4)] ...
%     ['Value: '   , num2str(pos(2),8)] ...
%     ['Data index: ',num2str(idx)] ...
%     };
output_txt = { ...
    'sum 3dB' , ...
    ['(' num2str(pos(1),2) 'deg,' num2str(pos(2),3) 'dB)' ]...    
    };
end

% function hdtip = f_AddDatatips(evt_times,hPlot )
% %// retrieve the datacursor manager
% cursorMode = datacursormode(gcf);
% %set(cursorMode, 'UpdateFcn',@customDatatipFunction, 'NewDataCursorOnClick',false);
% set(cursorMode, 'UpdateFcn',@customDatatipFunction,'DisplayStyle','datatip');
% 
% xdata = get(hPlot,'XData') ;
% ydata = get(hPlot,'YData') ;
% 
% %// add the datatip for each event
% for idt = 1:numel(evt_times)
%     hdtip(idt) = cursorMode.createDatatip(hPlot);
%     set(hdtip(idt), 'MarkerSize',5, 'MarkerFaceColor','none', ...
%         'MarkerEdgeColor','r', 'Marker','o', 'HitTest','off');
%     
%     
%     %// move it into the right place
%     %idx = find( xdata == evt_times(idt) ) ;%// find the index of the corresponding time
%     idx = find( round(xdata,1) == evt_times(idt) );
%     pos = [xdata(idx) , ydata(idx) ,1 ];
%     %         update(hdtip(idt), pos);
%     %         guidata(hdtip(idt),pos)
%     set(hdtip(idt),'Position',pos);
% end
% end
% function output_txt = customDatatipFunction(~,evt)
% % eventdata = get(evt)
% % pos = eventdata.Position
% 
% pos = get(evt,'Position');
% idx = get(evt,'DataIndex');
% % output_txt = { ...
% %     '*** !! Event !! ***' , ...
% %     ['at Time : '  num2str(pos(1),4)] ...
% %     ['Value: '   , num2str(pos(2),8)] ...
% %     ['Data index: ',num2str(idx)] ...
% %     };
% output_txt = { ...
%     'Sum 3dB' , ...
%     ['(' num2str(pos(1),2) ',' num2str(pos(2),3) ')' ]...
%     ['Data index: ',num2str(idx)] ...
%     };
% end